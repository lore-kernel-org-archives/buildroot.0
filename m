Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEC6C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 15:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E629860776;
	Sun,  9 Feb 2025 15:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WH88_0NthQ5n; Sun,  9 Feb 2025 15:10:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE69A607BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE69A607BD;
	Sun,  9 Feb 2025 15:10:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 187246C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12A98605EE
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHfwEb1wjetB for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC79605F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AC79605F9
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 299EA8745D; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 14:38:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aebbf57354d76ce22fd51718e07dc0a3cd3db116
X-Git-Newrev: 48ccb7d1d7a12567c79fa296336c3086108f144c
X-Patchwork-Hint: ignore
Message-Id: <20250209150951.299EA8745D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi/br-kodi: fix shellcheck
 SC2317 & SC2329
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

commit: https://git.buildroot.net/buildroot/commit/?id=48ccb7d1d7a12567c79fa296336c3086108f144c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated in shellcheck wiki about SC2329 [1]

  "ShellCheck is currently bad at figuring out functions that are invoked via trap.
   In such cases, please ignore the message with a directive."

While adding SC2329 check after shellcheck v0.10.0 release, it also
reduced the amount of false result returned by shellcheck v0.9.0.

So disable SC2317 and SC2329.

[1] https://www.shellcheck.net/wiki/SC2329
[2] https://github.com/koalaman/shellcheck/commit/4f81dbe839091a06a5cfaea695cf1c451ff07565

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/br-kodi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kodi/br-kodi b/package/kodi/br-kodi
index 83d4d4e5ac..b776b5d96c 100755
--- a/package/kodi/br-kodi
+++ b/package/kodi/br-kodi
@@ -5,6 +5,8 @@
 KODI="${1}"
 shift
 
+# shellcheck disable=SC2329 # https://www.shellcheck.net/wiki/SC2329
+# shellcheck disable=SC2317 # shellcheck 0.9.0 "spammy"
 # In case someone asked we terminate, just kill
 # the Kodi process
 trap_kill() {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
