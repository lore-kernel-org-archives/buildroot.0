From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:04:55 +0100
Subject: [Buildroot] [git commit] gstreamer1: fix hash files
Message-ID: <20171202131022.8DAFA7FF89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=705fd01931a3d8c9be280ad3ca816d96c9de5ea8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In many gstreamer1 packages, the line containing a comment about the
origin of the hash was not prefixed with a pound sign as it should be.

Fixes those check-package warnings:

./package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash:1: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash:1: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash:1: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash:1: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-vaapi/gst1-vaapi.hash:1: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-vaapi/gst1-vaapi.hash:1: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash:1: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash:1: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash:1: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash:1: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gstreamer1/gstreamer1.hash:1: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gstreamer1/gstreamer1.hash:1: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash:1: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash:1: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-libav/gst1-libav.hash:1: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst1-libav/gst1-libav.hash:1: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst-omx/gst-omx.hash:1: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/gstreamer1/gst-omx/gst-omx.hash:1: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash                     | 2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash               | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash   | 2 +-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 2 +-
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 2 +-
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 2 +-
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash   | 2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash               | 2 +-
 package/gstreamer1/gst1-validate/gst1-validate.hash         | 2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash               | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index ec3f31d..179993a 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.3.tar.xz.sha256sum
 sha256 eef5de8bab1bb495bfbc9d16af9837d7f55b47cb6b97819b3152c5899c85843c gst-omx-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index a5a9590..1fd6ffc 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.3.tar.xz.sha256sum
 sha256 015ef8cab6f7fb87c8fb42642486423eff3b6e6a6bccdcd6a189f436a3619650 gst-libav-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index e4b83ff..5cd25da 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.3.tar.xz.sha256sum
 sha256 36d059761852bed0f1a7fcd3ef64a8aeecab95d2bca53cd6aa0f08054b1cbfec gst-plugins-bad-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 7b02be0..2f4d57d 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.3.tar.xz.sha256sum
 sha256 d3d37b8489d37fa0018973d850bd2067b98af335fef2fa543ee7d40359e3cea5 gst-plugins-base-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 0d4b70b..4df63aa 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.3.tar.xz.sha256sum
 sha256 13e7f479296891fef5a686438f20ba7d534680becf2269ecc5ee24aa83b45f03 gst-plugins-good-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 999166b..c7bbce5 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.3.tar.xz.sha256sum
 sha256 e88ca584c94ea78eeecbf3af00ef7f134b66bdee7408aa4aa6c547235e060052 gst-plugins-ugly-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 6457861..536a77c 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.3.tar.xz.sha256sum
 sha256 67255971bb16029a01de66b9f9687f20d8dbf3d3bd75feb48605d0723a7c74ec gst-rtsp-server-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 1ffa5a9..97bebab 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.3.tar.xz.sha256sum
 sha256 f4cdafd8fd9606a490917c8b67336e835df1219580d55421c70480fd0913744d gstreamer-vaapi-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 75e43b1..c726c17 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.3.tar.xz.sha256sum
 sha256 5139949d20274fdd702492438eeab2c9e55aa82f60aca17db27ebd3faf08489e gst-validate-1.12.3.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 2a1edbf..abcb62e 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.3.tar.xz.sha256sum
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.3.tar.xz.sha256sum
 sha256 d388f492440897f02b01eebb033ca2d41078a3d85c0eddc030cdea5a337a216e gstreamer-1.12.3.tar.xz
