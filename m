Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED33C61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BBF360897;
	Fri, 28 Aug 2026 14:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSsCyQKvo147; Fri, 28 Aug 2026 14:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927181;
	bh=EeTB/b4WLY2esAsuvTphu43d95Hur6AsdE5NEDXEo3g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RFcex92h8KNtM6jASePQbzHkWsm7qxiIXVTqF4+2PO/O5xIKqLsB/SuWzUrFL3Ar4
	 Zcg91Ut2X/jzTOolSL8U++rNlxGzcDyuV7lQf4CUP0FuoGdVjBgKJ2uMGGx/8kNz01
	 XCkMRMvURevQRsM9ECe80WFrwDVrCyt+F5Fb7YijQ/MNuFy2qSHZ0PSVsjG2xlRewl
	 iTxq2E8BS+bE2YuzggVOuhPfZzELoYDPhzpnzstPNqWy2FNpdCESXIyridkmo3QXAI
	 9B1U/SdOQ4EoapRWz+YbcxZLz8T8kmHy1UHV7kJ7jdFIdvreA2yH7l8aNFi1dTdBjf
	 Zm4WwwRcMltdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F79608A2;
	Fri, 28 Aug 2026 14:26:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C05FBD2B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4B4480E1D
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvU3l28fCUf4 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C899480F36
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6C0D921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:05 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8242797d31df0acb397be81e882d4f972ab847f7
X-Git-Newrev: 3ec18f27154704240fd0239f17946369c224ce13
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.C6C0D921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 package/linux-tools/S10hyperv: fix invalid return value
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ec18f27154704240fd0239f17946369c224ce13
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

In both start() and stop(), ret is only assigned on failure. When
hypervkvpd starts or stops successfully, return "$ret" expands to an
empty string and causes:

  /etc/init.d/S10hyperv: return: line 31: Illegal number:

Those double quotes were added in Buildroot commit [1], to fix a
new ShellCheck warning at that time. This was not a complete fix.

Only removing the double quote would reintroduce the ShellCheck
warning. This would also reintroduce a check-package error.

Since a bare return is equivalent to a "return 0", this commit
also initializes with ret=0. Doing so will tell ShellCheck "ret" is
an integer. Therefore, the ShellCheck warning will no longer be
reported.

This commit fixes the invalid return value by removing the double
quotes and initialzing "ret=0".

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/c4173d8b08525f260fea8a2a1e805b806bcba9fc

Signed-off-by: Benjamin DeCamp <benjamin8532@protonmail.com>
[Julien:
 - add "ret=0" initialization in script to fix check-package error
 - add extra info in the commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 667335cd187150c5afebac2a278f92d5b6ef744d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/linux-tools/S10hyperv | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/S10hyperv b/package/linux-tools/S10hyperv
index be9ed2c5df..63424f5ae2 100644
--- a/package/linux-tools/S10hyperv
+++ b/package/linux-tools/S10hyperv
@@ -24,11 +24,12 @@ start_one() {
 }
 
 start() {
+	ret=0
 	# shellcheck disable=SC2086 # we need the word splitting
 	for prog in ${PROGS}; do
 		start_one "${prog}" || ret=$?
 	done
-	return "$ret"
+	return $ret
 }
 
 stop_one() {
@@ -45,11 +46,12 @@ stop_one() {
 }
 
 stop() {
+	ret=0
 	# shellcheck disable=SC2086 # we need the word splitting
 	for prog in ${PROGS}; do
 		stop_one "${prog}" || ret=$?
 	done
-	return "$ret"
+	return $ret
 }
 
 restart() {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
