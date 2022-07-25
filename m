Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E871AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A1EA610C1;
	Mon, 25 Jul 2022 22:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1EA610C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHtEdaBitibl; Mon, 25 Jul 2022 22:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADBF060E57;
	Mon, 25 Jul 2022 22:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADBF060E57
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 846121BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B9C2830E3
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B9C2830E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8F9-9cdMWE7M for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:29:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9638383300
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9638383300
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4EC0285E6F; Mon, 25 Jul 2022 22:15:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 00:27:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23a71b7d538b6ff7ae7622a712792a28fde9ddd3
X-Git-Newrev: 20a3cf8cc04971e900bb01ad0a43a5de03c26dbf
X-Patchwork-Hint: ignore
Message-Id: <20220725221521.4EC0285E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: disable doxygen
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

commit: https://git.buildroot.net/buildroot/commit/?id=20a3cf8cc04971e900bb01ad0a43a5de03c26dbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable doxygen which is enabled by default since bump to version 16.1
in commit 6f3131296484767f037d3535ab69f328e94351db:

../output-1/build/pulseaudio-16.1/doxygen/meson.build:9:0: ERROR: Program 'doxygen' not found or not executable

Fixes:
 - http://autobuild.buildroot.org/results/127b87f97eb5517cd0a513289768a599081c15c9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pulseaudio/pulseaudio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 1322b25fe3..b423057ab6 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -13,6 +13,7 @@ PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
 PULSEAUDIO_SELINUX_MODULES = pulseaudio xdg
 PULSEAUDIO_CONF_OPTS = \
+	-Ddoxygen=false \
 	-Dlegacy-database-entry-format=false \
 	-Dman=false \
 	-Drunning-from-build-tree=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
