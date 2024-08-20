Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D550C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 17:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1427B409E5;
	Tue, 20 Aug 2024 17:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsCm55PBpphU; Tue, 20 Aug 2024 17:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB1C440ACD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB1C440ACD;
	Tue, 20 Aug 2024 17:21:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0369E1BF37C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE78C60A82
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rO53J0Pf34M4 for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC416088D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC416088D
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14BFE8614C; Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 19:11:53 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4a23e8d07baecd748e35136c7ccdb1bbd02ded04
X-Git-Newrev: 53e5169e863532455a53ff5c030d6ffa1d230670
X-Patchwork-Hint: ignore
Message-Id: <20240820172121.14BFE8614C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] .b4-config: configure
 `b4` for Buildroot
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

commit: https://git.buildroot.net/buildroot/commit/?id=53e5169e863532455a53ff5c030d6ffa1d230670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

`b4` is a commandline tool to make patch-based development easier[1]. It
is primarily used for Linux kernel development, but can be configured to
support any project that has a public-inbox endpoint. Buildroot has a
public-inbox mirror at "https://lore.kernel.org/buildroot/".

We configure some basic settings that tell `b4` where to send patches
and how to use get-developers.

[1] https://b4.docs.kernel.org/en/latest/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 322213e131fabd6aa6879c4f653415a35c93e63e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
