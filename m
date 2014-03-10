From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Mar 2014 08:09:38 +0100
Subject: [Buildroot] [PATCH] jack2: fix missing alsa-lib feature dependency
Message-ID: <1394435378-32063-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jack2 needs snd_hwdep support.

Fixes:
  http://autobuild.buildroot.net/results/4c3/4c3b4f1db5c1aadfd8de59f7a655a7644f1bc1be/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/jack2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index bf70ab0..4d451d0 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_JACK2
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_HWDEP
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	help
-- 
1.9.0
