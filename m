From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 09:31:42 +0100
Subject: [Buildroot] [git commit] xz: revert back to using a .bz2 archive
Message-ID: <20150107083249.54FD0807E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27b6e43b034b5a9e4e040f335dddef161655ec85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On machines where xzcat/unxz is not available, we build host-xz. So if
host-xz is itself downloaded as a xz-compressed archive, it doesn't
work. Revert back to a .bz2 archive.

Fixes:

  http://autobuild.buildroot.org/results/79e/79ecba46f353546ba60ae86dd3898b4d86c056a0/
  (and many similar failures)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xz/xz.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 1b44678..24b1adb 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XZ_VERSION = 5.2.0
-XZ_SOURCE = xz-$(XZ_VERSION).tar.xz
+XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
