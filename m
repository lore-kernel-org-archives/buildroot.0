From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:57:53 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/localedef: depend
 host build on python3
Message-ID: <20200915185442.892B38ABA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d16b59467509d9a72766c0c3c6dcfd0de7090b4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Just like glibc, host-localedef needs python3 on the host to
build... since host-localedef is basically using the sources of glibc.

Fixes:

checking if /build/build/per-package/host-localedef/host/bin/ccache
/usr/bin/gcc is sufficient to build libc... yes
checking for x86_64-pc-linux-gnu-nm... /usr/bin/nm
checking for python3... no
checking for python... python
checking version of python... 2.7.18, bad
configure: error:
*** These critical programs are missing or too old: python
*** Check the INSTALL file for required versions.

As reported at:

  http://lists.busybox.net/pipermail/buildroot/2020-September/291929.html

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6e73c71cc48fb1528044bbc63da028d2f74cbbab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/localedef/localedef.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index f6e26b5666..d6f1625e3f 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -14,6 +14,7 @@ HOST_LOCALEDEF_DL_SUBDIR = glibc
 
 HOST_LOCALEDEF_DEPENDENCIES = \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
+	$(BR2_PYTHON3_HOST_DEPENDENCY) \
 	host-bison \
 	host-gawk
 
