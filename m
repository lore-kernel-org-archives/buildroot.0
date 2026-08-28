Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949D2C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B78F6083D;
	Fri, 28 Aug 2026 14:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27i5CMsIFXAG; Fri, 28 Aug 2026 14:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927032;
	bh=Rb6vqF8Bf7avXKo7I3mQYg+FytSLwOZ6Y2ZszCUejGY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FTlkBYVcNnnm7LAlq8/hgVctKHlRawdfCynVse/XNTCqccC9w3t52N/g7CZag5H1x
	 hUVA9vkNelzQvNechx2hrSVemcIrBVpLgeMRaD7KC3rdOWho1J8rqHMiTDKfEHgkiR
	 MDIX9Pnox2J51AaonbP69FyNn/ihA4MV5HOToNcJ7eMAYV++gBSRyuvx9EVyuQJS6K
	 dXWj/DuX3V0srUVZ2lLBa6kgEgt9tQhL1ElPrlSC/8N0WovjEZX7LttxkQ1djSmbjn
	 Bsi6e5TRlsqm7g/LBF/VTsubBH6WWfcORii8+h3JZt50Rq1d6a3asZhwycKBG4TNk8
	 kfPKm1jZhtFHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A012607EC;
	Fri, 28 Aug 2026 14:23:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DAB8D2E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 701FB403A6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPuSq2yLd1pR for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3C24403A1
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A182E921DD; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cdb6b23824b17799cd999a481d2c75cb64bb38c9
X-Git-Newrev: 4f1d3b786deb4e234bd4a7e20bd9c975ee544017
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.A182E921DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f1d3b786deb4e234bd4a7e20bd9c975ee544017
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
