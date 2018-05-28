From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:07:01 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/xen: force
 location of init scripts
Message-ID: <20180528142834.344D4805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f24d5edea6d69886f5529951b4845b999b60d6e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The Xen configure scripts looks at the build host to decide where to
install the Sys-V startup scripts, and that location differs between
various distros.

Force the location.

Fixes:
    http://autobuild.buildroot.org/results/869/869829ab086e824d164c5c5ec7f087ed83993be6/
    http://autobuild.buildroot.org/results/336/3360e5a9e3d007b4ed77345b5fe93b2dacb6ad49/
    http://autobuild.buildroot.org/results/29e/29e308ce3cc9c83497ba1c1f98fcda3f48fd03c4/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 366e42c2cf60ecf9640ad7a57dcbe5d9d287dc02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 8ba2b9d5c2..1b741a90f6 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -17,7 +17,9 @@ else ifeq ($(ARCH),arm)
 XEN_ARCH = arm32
 endif
 
-XEN_CONF_OPTS = --disable-ocamltools
+XEN_CONF_OPTS = \
+	--disable-ocamltools \
+	--with-initddir=/etc/init.d
 
 XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python2
 XEN_MAKE_ENV = \
