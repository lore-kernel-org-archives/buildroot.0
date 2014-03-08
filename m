From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 11:11:32 +0100
Subject: [Buildroot] [git commit] jack2: add select on
	BR2_PACKAGE_ALSA_LIB_SEQ
Message-ID: <20140308101217.59AD39BE58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=714de8abcd0977eefc24c3bdb2cef5608059742d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_ALSA_LIB_SEQ option is needed for jack2 to build
properly.

Fixes:

  http://autobuild.buildroot.org/results/fc4/fc42597a9a22af69a33c810561e2b3dd6c6bf8f4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index 2117f48..978c7a8 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_JACK2
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	help
 	  JACK Audio Connection Kit (server and example clients).
 
