Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16386C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 947AE84BD5;
	Sun, 24 Jul 2022 10:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 947AE84BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dxxng4q9Pgu3; Sun, 24 Jul 2022 10:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B435183F42;
	Sun, 24 Jul 2022 10:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B435183F42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3981D1BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1479A83F42
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1479A83F42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ue9pFOsxEF3Z for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:31:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 441D883F38
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 441D883F38
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 556E485BF2; Sun, 24 Jul 2022 10:17:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 12:28:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9ff62c4cdfdbd73a0c172bc2f6e77c5e6e28048
X-Git-Newrev: 20c9e5cfd406751f090072d0c532fa8f4c9591af
X-Patchwork-Hint: ignore
Message-Id: <20220724101753.556E485BF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: remove single hyphen
 command (2)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=20c9e5cfd406751f090072d0c532fa8f4c9591af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Single hyphen commands has been removed since Mender 3.0.0 [1]

The hyphen was added back while fixing check-pkg and shellcheck warnings [2]

[1] https://github.com/mendersoftware/mender/commit/fd838ec1b08f3d429b1d81607e9c35a87a104ee6
[2] 0b350cf7569005d3eec6bb55a3acd4688d2fbd4e

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mender/S42mender | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/S42mender b/package/mender/S42mender
index 29008beca0..0f2077d089 100644
--- a/package/mender/S42mender
+++ b/package/mender/S42mender
@@ -5,7 +5,7 @@
 DAEMON="mender"
 DAEMON_PATH="/usr/bin/mender"
 PIDFILE="/var/run/${DAEMON}.pid"
-DAEMON_ARGS="-daemon"
+DAEMON_ARGS="daemon"
 
 start() {
 	# If /var/lib/mender is a symlink to /var/run/mender, and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
