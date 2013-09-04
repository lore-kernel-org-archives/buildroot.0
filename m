From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Sep 2013 12:36:09 +0200
Subject: [Buildroot] [git commit] kmod: disable manpages for host-kmod
Message-ID: <20130904103707.9F2B29B6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24058f10a70812de695f6bf8be3f66f0abcc179c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manpages are not installed to HOST_DIR anyway, and it errors out if
xsltproc isn't available on the host.
---
 package/kmod/kmod.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 169fca3..a1ad7d6 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -23,6 +23,9 @@ KMOD_LICENSE_FILES = libkmod/COPYING
 # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
 KMOD_CONF_OPT = --disable-static --enable-shared
 
+# manpages not installed to host and needs xsltproc
+HOST_KMOD_CONF_OPT = --disable-manpages
+
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 KMOD_CONF_OPT += --disable-manpages
 endif
