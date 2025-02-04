Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FB1C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4193A50485;
	Fri, 28 Feb 2025 17:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mA1ZSEdFH7h; Fri, 28 Feb 2025 17:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17530419DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17530419DB;
	Fri, 28 Feb 2025 17:13:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1405E68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A842424B4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGvJi2ruXxKd for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB73B42FCD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB73B42FCD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A35D987A92; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 18:44:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 80d26f091fdf2ab6bda956d91dc93a6c63d83797
X-Git-Newrev: 747c3ae005cf8e12eb23025db7362426f5ab595d
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.A35D987A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] .b4-config: check patches with
 ./utils/check-package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=747c3ae005cf8e12eb23025db7362426f5ab595d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

NOTE: This requires `b4` version 0.14.2 or later as earlier versions had
a bug that broke custom prep-perpatch-check-cmd[1].

If a check-cmd is declared, `b4` will warn developers to run the patch
checker before sending a patch series[2][3]. Developers can then run `b4 prep
--check` to automatically run ./utils/check-package on only files
modified in the patch series.

[1] https://github.com/mricon/b4/commit/0741bc9a5b45578e4d3804588dd3f63fe4848059
[2] https://b4.docs.kernel.org/en/latest/contributor/send.html#passing-pre-flight-checks-v0-14
[3] https://b4.docs.kernel.org/en/latest/config.html#contributor-oriented-settings

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .b4-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.b4-config b/.b4-config
index 1943458f2f..d568669864 100644
--- a/.b4-config
+++ b/.b4-config
@@ -3,5 +3,6 @@
 [b4]
     send-series-to = buildroot@buildroot.org
     send-auto-cc-cmd = "./utils/get-developers -e -"
+    prep-perpatch-check-cmd = "./utils/check-package -q -p -"
 
 # vim: set filetype=gitconfig:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
