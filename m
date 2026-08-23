Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79DAC5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 15:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F8B76060A;
	Sun, 23 Aug 2026 15:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oosb133DL6KI; Sun, 23 Aug 2026 15:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787499585;
	bh=xHdYaM0wtaaoQuzcqmUa+IuiIaIWkKg6nsi5VDAWj0Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EwiJzML/6lz+VZUJIW4tlLY0c0mt4dalrYDFJipMop88s82JsRENMM3WRPigp9uXa
	 wjxiB+oaOttrMmJ1OK1JChl4hzTSEsoG64yhkBqNg4/U7C/P0TXg8S/xuFZQO9TfNR
	 vCubrdNTku4OeRnTDT0Jv1zJhznZNl0LZNxhpMX7070drudMTMeBH+xYlo6BaYfeUi
	 By6z86VLFulGydqVKAwe7g5Pa0TJk+JDj6UDqhVwmOLLIBFibXqpJ4mSu3DZxLkzyO
	 n0DSOX4SW73CYVElzidm2HtV3QFbVLWdfvEAoJB4OhmIuJOzhx272uWULhvSzpYvAZ
	 LZxmbKQZ+MEUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E3E606B6;
	Sun, 23 Aug 2026 15:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4476E386
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 424E56066F
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4g0icL52pAfY for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 15:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D5E6060A
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:39:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEA218EBFE; Sun, 23 Aug 2026 15:38:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 17:23:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3f3705a2fd27206cf2e79fd802b681e77be2cfe
X-Git-Newrev: 667335cd187150c5afebac2a278f92d5b6ef744d
X-Patchwork-Hint: ignore
Message-Id: <20260823153848.EEA218EBFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools/S10hyperv: fix invalid
 return value
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/667335cd187150c5afebac2a278f92d5b6ef744d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
