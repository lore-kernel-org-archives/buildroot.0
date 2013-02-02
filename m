From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 2 Feb 2013 17:42:31 +0100
Subject: [Buildroot] [git commit] lvm2: Install devmapper.pc to
	staging/target pkgconfig directory.
Message-ID: <20130203142452.102189A917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e407fac85ce51e652c7cd4fd422c788aa3f5f0cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this change if some package which have dependency on device mapper
and use pkgconfig to check version always fail to find library because
devmapper.pc file wasn't installed.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lvm2/lvm2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 52326ea..f54caa4 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -21,7 +21,7 @@ LVM2_BINS = \
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner.
-LVM2_CONF_OPT += --enable-write_install
+LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the CC passed at configure time.
