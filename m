Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94428CCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27245607C8;
	Wed, 25 Sep 2024 18:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YG2fEZMe4X8Z; Wed, 25 Sep 2024 18:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 695C761240
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 695C761240;
	Wed, 25 Sep 2024 18:55:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1632B1BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8283611C9
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IbTYvJ2vgGw for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13A25611CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13A25611CA
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10F8D844B6; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 20:42:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70ded7c2127e80d89a150bcf1c891c90093c5978
X-Git-Newrev: eb83f8e09a28e4ca978cb02b20c54e350bd71614
X-Patchwork-Hint: ignore
Message-Id: <20240925185457.10F8D844B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skeleton-init-systemd: fix "won't"
 typo in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb83f8e09a28e4ca978cb02b20c54e350bd71614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/skeleton-init-systemd/fakeroot_tmpfiles.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton-init-systemd/fakeroot_tmpfiles.sh b/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
index 9498638f0b..8c28ccfa14 100755
--- a/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
+++ b/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
@@ -16,7 +16,7 @@
 # such an specifier to prevent leaking host information.
 #
 # shell expansion is critical to be POSIX compliant,
-# this script wont work with zsh in its default mode for example.
+# this script won't work with zsh in its default mode for example.
 #
 # The script takes several measures to handle more complex stuff
 # like passing this correctly:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
