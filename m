Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01821C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B793E81168;
	Fri, 28 Aug 2026 14:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xn0mjqjYN-_T; Fri, 28 Aug 2026 14:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927162;
	bh=JDi4xbWKqJZ7Mc7wrVSfgFw7vpbfg7gd8S6uIL5p6zs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q8nb3CKcyAk0w3biGHBqiWm7s63sb92EqqkrEzXAklBqgjiFkT9Iz03W00JChV+84
	 ZT435BT+/1Yc0RItg9PvHvG5UQeZEHmYVuAiN6qJyWEYMPMK91lo9e+8ex62wgWpub
	 9iX2xX8BdUnfx1naZkYKwgWExugLhla3RmqDOO01t9af2/EA0+daPePrYm7vaby06E
	 JePJ85Cu7jrXC2oKMjBNv3PtY08KbkfaWpBw3b9wgaUrDrNRuOlysBgQvf545DT1Ng
	 s2Mcn1qoNcmvMtnoKwBxwb32PGmpWtYPfK81OpcUV/HSNNJfjLZLu+m9nt6a+hCZGZ
	 QIc4Nu29V3/wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE4381164;
	Fri, 28 Aug 2026 14:26:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24C6AD2B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123BA80F7C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlq0nk227ooi for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07BCA80F45
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE08D921FB; Fri, 28 Aug 2026 14:24:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 34cc95533a48a7d8bbd47e5169d29977dab8df64
X-Git-Newrev: 98816aaa9e05701708efdaa933644c4a847179b8
X-Patchwork-Hint: ignore
Message-Id: <20260828142441.EE08D921FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/wireshark: bump
 to v4.4.17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98816aaa9e05701708efdaa933644c4a847179b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.17.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1d257e242c7fcbe6082d774602032e92b7a2c700)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 2c15d4f0f4..917ac47471 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.16.txt
-sha1  1424ea22b4959f94eb85c1fc3c510f281766144e  wireshark-4.4.16.tar.xz
-sha256  0bda0e34a4c5da72ea9009134d733783d08189c07462198e53a4f533fd1201fd  wireshark-4.4.16.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.17.txt
+sha1  d46443d5bbca3580f944f3effcdfcc59e24eb7f4  wireshark-4.4.17.tar.xz
+sha256  b89a8c60b9282f29be4db91437a6e969e61bc17e8c92ddd980cc38c7304dd772  wireshark-4.4.17.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ab393b8a48..1fd81515c1 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.16
+WIRESHARK_VERSION = 4.4.17
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
