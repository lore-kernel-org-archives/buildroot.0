From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Mar 2014 13:13:03 +0100
Subject: [Buildroot] [git commit] jack2: fix missing alsa-lib feature
	dependency
Message-ID: <20140310121333.F05229BDE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca4e9a78732bcacddd0c91ab35ee39a60ff040aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jack2 needs snd_hwdep support.

Fixes:
  http://autobuild.buildroot.net/results/4c3/4c3b4f1db5c1aadfd8de59f7a655a7644f1bc1be/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
