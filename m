From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 28 Aug 2018 19:01:53 +0200
Subject: [Buildroot] [PATCH] mender: fix ioctl build failure on powerpc64le
 / power8
Message-ID: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails due to missing // +build ppc64le in ioctl_64_bit.go

Add patch to append ppc64le to // +build list.

Fixes
http://autobuild.buildroot.net/results/f22/f222b4389f9308363c386da25ec22a0919bc29fb//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...001-ioctl-allow-building-for-ppc64le.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/mender/0001-ioctl-allow-building-for-ppc64le.patch

diff --git a/package/mender/0001-ioctl-allow-building-for-ppc64le.patch b/package/mender/0001-ioctl-allow-building-for-ppc64le.patch
new file mode 100644
index 0000000000..f8aeaae143
--- /dev/null
+++ b/package/mender/0001-ioctl-allow-building-for-ppc64le.patch
@@ -0,0 +1,31 @@
+From 0c15fedbfe962912c8ad5e16073f4fc5ad03797f Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Tue, 28 Aug 2018 18:48:22 +0200
+Subject: [PATCH] ioctl: allow building for ppc64le
+
+ppc64le is not supported at the moment.
+
+Add ppc64le to // +build of ioctl_64_bit.go allowing building for
+powerpc64le.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ ioctl_64_bit.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ioctl_64_bit.go b/ioctl_64_bit.go
+index 6f61a6c..dc4c38f 100644
+--- a/ioctl_64_bit.go
++++ b/ioctl_64_bit.go
+@@ -12,7 +12,7 @@
+ //    See the License for the specific language governing permissions and
+ //    limitations under the License.
+ 
+-// +build amd64 arm64
++// +build amd64 arm64 ppc64le
+ 
+ package main
+ 
+-- 
+2.17.1
+
-- 
2.17.1
