Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A878FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 433FE60FC6;
	Wed, 26 Jan 2022 20:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiZLCBwflwsk; Wed, 26 Jan 2022 20:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DC0560FA1;
	Wed, 26 Jan 2022 20:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1A891BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F62A409EA
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIyh5Mjthkoe for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:49:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E70A409D7
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 462A281D78; Wed, 26 Jan 2022 20:42:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:41:40 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 288007dc4a3c95a705c811d6c6cbb64a623ae733
X-Git-Newrev: 7263cf4946682c4674dd63881fd166f81e3f0921
X-Patchwork-Hint: ignore
Message-Id: <20220126204254.462A281D78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/mender: remove
 single hyphen command
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

commit: https://git.buildroot.net/buildroot/commit/?id=7263cf4946682c4674dd63881fd166f81e3f0921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Single hyphen commands has been removed since Mender 3.0.0 [1]

[1] https://github.com/mendersoftware/mender/commit/fd838ec1b08f3d429b1d81607e9c35a87a104ee6

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 97daba5781bf58a6476c76a2910254bd9cbd329e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/S42mender             | 2 +-
 package/mender/mender-client.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/S42mender b/package/mender/S42mender
index 108fecfea9..dc60f94f8b 100644
--- a/package/mender/S42mender
+++ b/package/mender/S42mender
@@ -25,7 +25,7 @@ start() {
 	umask 077
 
 	start-stop-daemon -S -q -b -m -p /var/run/mender.pid \
-		--exec /usr/bin/mender -- -daemon
+		--exec /usr/bin/mender -- daemon
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
diff --git a/package/mender/mender-client.service b/package/mender/mender-client.service
index 2a5f476ee5..5539a56fd6 100644
--- a/package/mender/mender-client.service
+++ b/package/mender/mender-client.service
@@ -17,7 +17,7 @@ if [ -L /var/lib/mender \
         mkdir -p "$(readlink /var/lib/mender)"; \
     fi; \
 fi'
-ExecStart=/usr/bin/mender -daemon
+ExecStart=/usr/bin/mender daemon
 Restart=on-abort
 
 [Install]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
