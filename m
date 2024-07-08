Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14653C3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D748860A4B;
	Mon,  8 Jul 2024 20:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWGBRv9El1_Q; Mon,  8 Jul 2024 20:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B27B060AA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B27B060AA5;
	Mon,  8 Jul 2024 20:20:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 050DE1BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFBD14033A
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05y8lwWUGeds for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D836740593
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D836740593
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C664780424; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d584a2e0d593598e61db9ad435f4555c79c71743
X-Git-Newrev: 61d67ad32152a54ccbeef70fbecea1ed659e9f87
X-Patchwork-Hint: ignore
Message-Id: <20240708202013.C664780424@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ympd: update the patches to be
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=61d67ad32152a54ccbeef70fbecea1ed659e9f87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, ympd fails to build with output:

    Applying 0002-added-forward-declarations.patch using patch:
    patching file src/mpd_client.c
    Hunk #1 succeeded at 29 (offset -1 lines).
    patching file src/mpd_client.h
    Hunk #1 FAILED at 96.
    1 out of 1 hunk FAILED -- saving rejects to file src/mpd_client.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ympd/0002-added-forward-declarations.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ympd/0002-added-forward-declarations.patch b/package/ympd/0002-added-forward-declarations.patch
index 90ee1eae68..d96307d2a4 100644
--- a/package/ympd/0002-added-forward-declarations.patch
+++ b/package/ympd/0002-added-forward-declarations.patch
@@ -8,6 +8,8 @@ Subject: [PATCH] added forward declarations
 from:
 https://github.com/notandy/ympd/pull/191/commits/2268e0f0f372a61827b912155a1796490968b3ff]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/mpd_client.c | 2 ++
  src/mpd_client.h | 6 ++++--
@@ -17,7 +19,7 @@ diff --git a/src/mpd_client.c b/src/mpd_client.c
 index 2911e461..9f003ab0 100644
 --- a/src/mpd_client.c
 +++ b/src/mpd_client.c
-@@ -30,6 +30,8 @@
+@@ -29,6 +29,8 @@
  
  /* forward declaration */
  static int mpd_notify_callback(struct mg_connection *c, enum mg_event ev);
@@ -30,7 +32,7 @@ diff --git a/src/mpd_client.h b/src/mpd_client.h
 index 447dd563..9342c550 100644
 --- a/src/mpd_client.h
 +++ b/src/mpd_client.h
-@@ -96,6 +96,8 @@ struct t_mpd {
+@@ -92,7 +92,9 @@
  
      int song_id;
      unsigned queue_version;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
