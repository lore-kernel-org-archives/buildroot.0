From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Dec 2012 09:17:00 +0100
Subject: [Buildroot] [git commit] package/spice: Only builds on x86
Message-ID: <20121217081706.3D89A9A321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f452a86b8523d90ffa7a94cb1d540e574ceb165
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The spice configure script explicitly checks for x86 or x86-64, so
disable it on other architectures

Fixes
http://autobuild.buildroot.org/results/7f7e2d46542a685b93211f76ad063f8b2ba7b5e5/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/spice/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index b1e187a..1b264e7 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,8 +1,10 @@
 comment "spice server depends on python (for pyparsing)"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_PYTHON
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
+	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_CELT051
