From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:00:45 +0100
Subject: [Buildroot] [git commit] package/prboom: disable for Sourcery
	CodeBench SH 2012.09
Message-ID: <20160322090105.3759280503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dde353a12869e351a5d86e55fb42a5f67ba2f0c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building prboom with the external Sourcery CodeBench SH 2012.09 toolchain
fails with an internal compiler error:

r_fps.c: In function 'R_StopAllInterpolations':
r_fps.c:296:1: internal compiler error: Segmentation fault

Make the toolchain unavailable for building prboom.

Fixes:
http://autobuild.buildroot.net/results/2f1/2f14075e22b420cc3fdaaa2231494f2829f040ec/
http://autobuild.buildroot.net/results/d30/d3030fea0b3b8693be640754774e50ac064f8c89/
http://autobuild.buildroot.net/results/b5b/b5b90a03fc47f3771803cb474e0ea9671b5c4667/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/prboom/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/prboom/Config.in b/package/prboom/Config.in
index 678a151..e9a3d4a 100644
--- a/package/prboom/Config.in
+++ b/package/prboom/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PRBOOM
 	bool "prboom"
+	# These result in internal compiler error
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_SDL_MIXER
 	select BR2_PACKAGE_SDL_NET
