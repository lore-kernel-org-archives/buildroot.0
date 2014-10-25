From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 19:10:12 +0200
Subject: [Buildroot] [git commit] shairport-sync: requires alsa-lib mixer
	support
Message-ID: <20141025171031.B32ECAF458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2287b9a3ab5c116a4866b7026d013d48cd61950
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/b74/b74c764e9527ce1cce8825682285824a519ac2cf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index bf40524..ce31061 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	depends on BR2_USE_MMU # libdaemon
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa_lib
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBDAEMON
 	select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
