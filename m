From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:20:56 +0100
Subject: [Buildroot] [git commit] package/libabseil-cpp: enforce C++11
Message-ID: <20201031210947.6A16182B99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d1390e6e332f88e07bf393f7d0a9e65d4ec3023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Abseil needs at least c++11 but removed the fallback when not set in [0].
So we need to do this.

[0] https://github.com/abseil/abseil-cpp/commit/c6954897f7ece5011f0126db9117361dc1a6ff36

Fixes:
  http://autobuild.buildroot.net/results/5780d5e21e5e9c0ba86cc422ef995f45dc83cc4c
  http://autobuild.buildroot.net/results/8138c63fc13940e1b97f07f24752b199f88ccfa8
  http://autobuild.buildroot.net/results/f8eda966c6400c242680db378c8944444d89d5c5
  http://autobuild.buildroot.net/results/38e9427d995e16bc4876f9fdc890c42e4fd04c06
  http://autobuild.buildroot.net/results/4e99415728a6f3c6b396a9872924262652f77996
  http://autobuild.buildroot.net/results/1830577843772bdfd6e310b4d361aa1edf5969d6

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libabseil-cpp/libabseil-cpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index dfcf892f65..9cff8f0ff4 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -11,11 +11,13 @@ LIBABSEIL_CPP_LICENSE_FILES = LICENSE
 LIBABSEIL_CPP_INSTALL_STAGING = YES
 
 LIBABSEIL_CPP_CONF_OPTS = \
+	-DCMAKE_CXX_STANDARD=11 \
 	-DABSL_ENABLE_INSTALL=ON \
 	-DABSL_USE_GOOGLETEST_HEAD=OFF \
 	-DABSL_RUN_TESTS=OFF
 
 HOST_LIBABSEIL_CPP_CONF_OPTS = \
+	-DCMAKE_CXX_STANDARD=11 \
 	-DABSL_ENABLE_INSTALL=ON \
 	-DABSL_USE_GOOGLETEST_HEAD=OFF \
 	-DABSL_RUN_TESTS=OFF
