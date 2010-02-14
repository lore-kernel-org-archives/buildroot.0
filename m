From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2010 12:11:11 +0100
Subject: [Buildroot] [PATCH 1/1] Temporary fix for alsa-lib breakage with
	--disable-pcm
In-Reply-To: <cover.1266145868.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266145868.git.thomas.petazzoni@free-electrons.com>
Message-ID: <94e172c8e7660213d29cb37ff760f5abf8886c31.1266145868.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current version of alsa-lib (1.0.22) does not build when
--disable-pcm is used at configure time. I've reported the issue at
https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4913.

In the mean time, we can prevent the user from not selecting PCM
support by using the following patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/alsa-lib/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/alsa-lib/Config.in b/package/multimedia/alsa-lib/Config.in
index 84629e6..98b8313 100644
--- a/package/multimedia/alsa-lib/Config.in
+++ b/package/multimedia/alsa-lib/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_ALSA_LIB
 	bool "alsa-lib"
+	# Temporary until
+	# https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4913
+	# is fixed
+	select BR2_PACKAGE_ALSA_LIB_PCM
 	help
 	  The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
 	  functionality to the Linux operating system.
-- 
1.6.3.3
