From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 09:38:13 +0200
Subject: [Buildroot] [git commit] squeezelite: alsa-lib mixer support is
	mandatory
Message-ID: <20151014073842.77D55805F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae84f99cbc239cf95f145e7433fbdbcd57c35013
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/4f5/4f53ed80c7f135c33341919be4d5256409a2b23a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squeezelite/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index 1241085..be8f11a 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SQUEEZELITE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on BR2_USE_MMU # mpg123
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_FLAC
 	select BR2_PACKAGE_LIBMAD
 	select BR2_PACKAGE_LIBVORBIS
