Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1113CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71EF460AAE;
	Fri,  7 Jan 2022 18:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYVx9TO77Nqr; Fri,  7 Jan 2022 18:06:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8748160A88;
	Fri,  7 Jan 2022 18:06:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1E51C115D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 322BE400E5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdm61IfoqirA for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:05:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C36B40192
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:05:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CC16B832FF; Fri,  7 Jan 2022 17:59:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:05:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2af6bef9c11b6438338f4ddb2f968a7f0141adb
X-Git-Newrev: 97daba5781bf58a6476c76a2910254bd9cbd329e
X-Patchwork-Hint: ignore
Message-Id: <20220107175940.CC16B832FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: remove single hyphen
 command
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

commit: https://git.buildroot.net/buildroot/commit/?id=97daba5781bf58a6476c76a2910254bd9cbd329e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Single hyphen commands has been removed since Mender 3.0.0 [1]

[1] https://github.com/mendersoftware/mender/commit/fd838ec1b08f3d429b1d81607e9c35a87a104ee6

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
