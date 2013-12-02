From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2013 13:33:02 +0100
Subject: [Buildroot] [git commit] libtasn1: fix botched makeinfo/missing
	logic
Message-ID: <20131202123344.8C4449BEAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edce303b8da95a9b19939ab7a4199a39c0483c6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The makeinfo/missing logic is botched leading to failures such as:
http://autobuild.buildroot.net/results/5f0/5f0e8f62be86b56813f5fc0510e83289ed2b0410/
Just disable documentation build the hard way.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtasn1/libtasn1.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index e58bcbc..122f775 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -10,5 +10,7 @@ LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
 LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
 LIBTASN1_INSTALL_STAGING = YES
+# 'missing' fallback logic botched so disable it completely
+LIBTASN1_CONF_ENV = MAKEINFO="true"
 
 $(eval $(autotools-package))
