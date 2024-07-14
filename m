Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FFFC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AB9B405B6;
	Sun, 14 Jul 2024 20:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGKq8Y-YW_MD; Sun, 14 Jul 2024 20:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8577405BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8577405BB;
	Sun, 14 Jul 2024 20:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBC651BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A86FF60635
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUOhEWJ-IQbA for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA29B605D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA29B605D8
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E8398673F; Sun, 14 Jul 2024 20:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 22:35:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14192d722c09ca5355566303e8808d9f2c83ad31
X-Git-Newrev: 322213e131fabd6aa6879c4f653415a35c93e63e
X-Patchwork-Hint: ignore
Message-Id: <20240714203702.8E8398673F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .b4-config: configure `b4` for Buildroot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=322213e131fabd6aa6879c4f653415a35c93e63e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

`b4` is a commandline tool to make patch-based development easier[1]. It
is primarily used for Linux kernel development, but can be configured to
support any project that has a public-inbox endpoint. Buildroot has a
public-inbox mirror at "https://lore.kernel.org/buildroot/".

We configure some basic settings that tell `b4` where to send patches
and how to use get-developers.

[1] https://b4.docs.kernel.org/en/latest/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .b4-config | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000000..1943458f2f
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,7 @@
+# Configuration for the `b4` tool
+# See https://b4.docs.kernel.org/en/latest/config.html
+[b4]
+    send-series-to = buildroot@buildroot.org
+    send-auto-cc-cmd = "./utils/get-developers -e -"
+
+# vim: set filetype=gitconfig:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
