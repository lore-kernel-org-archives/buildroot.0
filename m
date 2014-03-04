From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:21:17 +0100
Subject: [Buildroot] [git commit] eudev: disable manpages
Message-ID: <20140304182239.B5F989BD19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5604d9c3de6cd0b24db1351227b017fd8a8be75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If host-libxslt or some libxslt is around (xsltproc) eudev will try to
build manpages with it. Problem is docbook DTDs might not be around and
things will break. We want no manpages anyway. Fixes:
http://autobuild.buildroot.net/results/c4e/c4e920b16c57e79df979f00cceaea7c0483f043c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/eudev.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index ffa413f..95aa1ce 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -15,6 +15,7 @@ EUDEV_AUTORECONF = YES
 EUDEV_CONF_ENV += LIBS=-lrt
 
 EUDEV_CONF_OPT =		\
+	--disable-manpages	\
 	--sbindir=/sbin		\
 	--with-rootlibdir=/lib	\
 	--libexecdir=/lib	\
