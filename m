From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:42:52 +0100
Subject: [Buildroot] [PATCH 01/16] automake: add build dependency on
	host-autoconf
In-Reply-To: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f03faaf3ab5bbd5f375c47c3cf12f1254d1237bd.1266691382.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

automake for the target fails to build if autoconf is not installed on
the host:

checking whether autoconf is installed... no
configure: error: Autoconf 2.58 or better is required.
    Please make sure it is installed and in your PATH.
make: *** [/home/test/brbuilttest/build/automake-1.10/.stamp_configured] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/automake/automake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index eb3b375..db935a4 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -11,7 +11,7 @@ ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
 AUTOMAKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 endif
 
-AUTOMAKE_DEPENDENCIES = autoconf microperl
+AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
-- 
1.6.3.3
