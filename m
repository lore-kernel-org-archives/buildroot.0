Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65F2C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C44A6072F;
	Mon, 24 Jun 2024 20:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dvrYIRRmX7M; Mon, 24 Jun 2024 20:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54EDD60A82
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54EDD60A82;
	Mon, 24 Jun 2024 20:02:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 161571BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 032B660A83
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUyuXMSR9k1e for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C42C608F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C42C608F4
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14B1282B84; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:30:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2c26c125e6b78ecefe0d97bbc487fb47dcb729d
X-Git-Newrev: e04faea50f5554ab24f8b756860b9a7922094a6f
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.14B1282B84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: update the patch to be
 applied with fuzz 0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7886934582255002343=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7886934582255002343==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e04faea50f5554ab24f8b756860b9a7922094a6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-Don-t-use-fork-on-noMMU-platforms.patch      | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
index 0d2b479534..87add9ff56 100644
--- a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
+++ b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
@@ -1,4 +1,4 @@
-From 41c029755502acf01ed634db437ac06d09be6c41 Mon Sep 17 00:00:00 2001
+From ffc567b790005850c561f9f6590b069b61f5ba20 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Fri, 13 Apr 2018 09:02:37 +0200
 Subject: [PATCH] Don't use fork() on noMMU platforms
@@ -12,18 +12,21 @@ Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
 Upstream: http://mailman.alsa-project.org/pipermail/alsa-devel/2018-November/141376.html
 [Bernd: update patch for 1.2.4 & 1.2.7]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
 ---
  configure.ac         |  2 ++
  src/pcm/pcm_direct.c | 10 +++++++++-
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index cce195ae..0c852434 100644
+index 7a152a4abd20..3cf88c37db56 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -52,6 +52,8 @@ dnl Checks for library functions.
- AC_CHECK_FUNCS([uselocale])
- AC_CHECK_FUNCS([eaccess])
+@@ -56,6 +56,8 @@ AC_CHECK_FUNCS([eaccess])
+ dnl Enable largefile support
+ AC_SYS_LARGEFILE
  
 +AC_CHECK_FUNC([fork])
 +
@@ -31,10 +34,10 @@ index cce195ae..0c852434 100644
  AC_SUBST(LIBTOOL_VERSION_INFO)
  
 diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
-index 2b07eff9..4dc3ea26 100644
+index e53e59238119..cf94c7c1dbf0 100644
 --- a/src/pcm/pcm_direct.c
 +++ b/src/pcm/pcm_direct.c
-@@ -437,13 +437,21 @@ int snd_pcm_direct_server_create(snd_pcm_direct_t *dmix)
+@@ -442,13 +442,21 @@ int snd_pcm_direct_server_create(snd_pcm_direct_t *dmix)
  		close(dmix->server_fd);
  		return ret;
  	}
@@ -58,5 +61,5 @@ index 2b07eff9..4dc3ea26 100644
  			server_job(dmix);
  		_exit(EXIT_SUCCESS);
 -- 
-2.14.3
+2.43.0
 

--===============7886934582255002343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7886934582255002343==--
