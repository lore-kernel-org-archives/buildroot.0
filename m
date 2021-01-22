From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Jan 2021 23:37:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/zeromq: drop AUTORECONF
Message-ID: <20210122223723.3178834-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 64ec0541d56cb05aa5898c42f26dd6b531d9b96a forgot to drop
ZEROMQ_AUTORECONF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeromq/zeromq.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index fbf2ca3f8c..4eb6931f1d 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -11,8 +11,6 @@ ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --disable-Werror --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
-# We're patching configure.ac
-ZEROMQ_AUTORECONF = YES
 
 # Assume these flags are always available. It is true, at least for
 # SOCK_CLOEXEC, since linux v2.6.27.
-- 
2.29.2
