From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:22:17 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/systemd:
 explicitly configure split-usr=false and split-bin=true
Message-ID: <20181125222047.2573C88426@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3efa1021b85d175ccd98192b1aa45be654f186f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

meson-based build of systemd runs a couple of checks on the structure
of the *host* system which will incorrectly configure systemd if build
host configuration doesn't match Buildroot target.

One can also find the following in the NEWS file:

* A new -Dsplit-bin= build configuration switch may be used to specify
  whether bin and sbin directories are merged, or if they should be
  included separately in $PATH and various listings of executable
  directories. The build configuration scripts will try to autodetect
  the proper values of -Dsplit-usr= and -Dsplit-bin= based on build
  system, but distributions are encouraged to configure this
  explicitly.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e9b70f96e8200956c871810d7b7a60017b9b974d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4813496670..ecbf7e97ff 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -29,6 +29,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dldconfig=false \
 	-Ddefault-dnssec=no \
 	-Dtests=false \
+	-Dsplit-bin=true \
+	-Dsplit-usr=false \
 	-Dsystem-uid-max=999 \
 	-Dsystem-gid-max=999 \
 	-Dtelinit-path=$(TARGET_DIR)/sbin/telinit \
