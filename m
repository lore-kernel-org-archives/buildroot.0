Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DA5E7717B
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 09:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7509381FE8;
	Fri,  6 Dec 2024 09:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_cXhXeDVXO4; Fri,  6 Dec 2024 09:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B93382084
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B93382084;
	Fri,  6 Dec 2024 09:29:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D864ED3
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C7C4611C3
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5E524XbkuTP for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76951611D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76951611D6
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 661CC86A35; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 10:18:27 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 845a663f99b78bdcd6d7f417af2c1df8c711af33
X-Git-Newrev: 8943a028d0ad6b5ee1b7ba6709a831c4dd46caa5
X-Patchwork-Hint: ignore
Message-Id: <20241206092846.661CC86A35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/bmap-tools:
 select host-python3 if building host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=8943a028d0ad6b5ee1b7ba6709a831c4dd46caa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Host bmap-tools runs using host-python3, but did not select it,
leading to the confusing situation that BR2_PACKAGE_HOST_PYTHON3=n
even though it was built and working.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dbb019db73d8d78466c04b1847f501317a7aa214)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bmap-tools/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
index cb4d35a437..499f9d177d 100644
--- a/package/bmap-tools/Config.in.host
+++ b/package/bmap-tools/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_BMAP_TOOLS
 	bool "host bmap-tools"
+	select BR2_PACKAGE_HOST_PYTHON3 # runtime
 	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
 	help
 	  Tool to flash image files to block devices using the block map
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
