From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:57:37 +0200
Subject: [Buildroot] [git commit] package/go-bootstrap: bump version to 1.4.3
Message-ID: <20161016105747.9B24A81F66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17a82fc253b00a7eab33ddc5e2bcb965610ac9d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump includes
https://go.googlesource.com/go/+/a527bdbda39c48fa772d8d54eb6b849f240442c1

which fixes a gcc6-related compile error

cmd/6c
/home/buildroot/br2/output/build/host-go-bootstrap-1.4.2/src/cmd/6c/txt.c: In function 'gmove':
/home/buildroot/br2/output/build/host-go-bootstrap-1.4.2/src/cmd/6c/txt.c:995:28: error: left shift of negative value [-Werror=shift-negative-value]
     f->vconst |= (vlong)~0 << 32;
                            ^~
/home/buildroot/br2/output/build/host-go-bootstrap-1.4.2/src/cmd/6c/txt.c:1045:28: error: left shift of negative value [-Werror=shift-negative-value]
     f->vconst |= (vlong)~0 << 32;
                            ^~
cc1: all warnings being treated as errors

not yet caught by autobuilders using this defconfig:

http://autobuild.buildroot.net/results/394/394e22be0ef986463e97b3040dad8f978262732c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go-bootstrap/go-bootstrap.hash | 2 +-
 package/go-bootstrap/go-bootstrap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go-bootstrap/go-bootstrap.hash b/package/go-bootstrap/go-bootstrap.hash
index 1d0566a..8938266 100644
--- a/package/go-bootstrap/go-bootstrap.hash
+++ b/package/go-bootstrap/go-bootstrap.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 299a6fd8f8adfdce15bc06bde926e7b252ae8e24dd5b16b7d8791ed79e7b5e9b go1.4.2.src.tar.gz
+sha256 9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959  go1.4.3.src.tar.gz
diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index 29f2b03..f403f78 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_BOOTSTRAP_VERSION = 1.4.2
+GO_BOOTSTRAP_VERSION = 1.4.3
 GO_BOOTSTRAP_SITE = https://storage.googleapis.com/golang
 GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).src.tar.gz
 
