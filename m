Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A64C982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DAC780BA2;
	Fri, 16 Jan 2026 20:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90qLNSL_QZ5i; Fri, 16 Jan 2026 20:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5110480B75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768595071;
	bh=2SS7tqjM5xwT6KDBUsI0/PqpuPmXQmIXNh5heZGszpk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MkTtyTy5URQKOmHyVdfWfEzrR2i0jtACPFr/Usi3fXb1a25wn9v1BJxLrBx83/iUw
	 LVTQNO8te277S0RCVBtZwpiT5ObDAmwujkSmIwiPJqYGbdle21xvsYMPqCO6QFNPMY
	 CNpMCAXrrzEhTIGS/5cxC1ZA6uu9fnN6ItlHUR66JamFSuVtHcBi2DPo0826zr2Y28
	 3PI94vi4fFrOhhdoatWZMJfA1MNbHlluAEb6CJC6OPG0XCUdTGD/t+3ofRuZAFsHAV
	 S76fI0EINchta5c6PjqpQb7zvr/IQksbYY6Jkkro3xdPFUdTIHF6NPs3zhy2NX8Og7
	 qkzHgQomsyX7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5110480B75;
	Fri, 16 Jan 2026 20:24:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D602CC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84B9880B25
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GExWs3Kr381o for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D346380B19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D346380B19
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:24:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F8EB88631; Fri, 16 Jan 2026 20:24:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 21:20:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85fa070335cd536793255d8c90fe915e11c3bee8
X-Git-Newrev: 99b4067859d0623dffcca743adc6ebe5c67a1bd2
X-Patchwork-Hint: ignore
Message-Id: <20260116202428.5F8EB88631@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ddrescue: bump version to 1.30
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99b4067859d0623dffcca743adc6ebe5c67a1bd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release announce, see:
https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00001.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ddrescue/ddrescue.hash | 4 ++--
 package/ddrescue/ddrescue.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index 716f6e4cfd..6c234d003e 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2025-03/msg00011.html
-sha256  ddd7d45df026807835a2ec6ab9c365df2ef19e8de1a50ffe6886cd391e04dd75  ddrescue-1.29.1.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00001.html
+sha256  2264622d309d6c87a1cfc19148292b8859a688e9bc02d4702f5cd4f288745542  ddrescue-1.30.tar.lz
 # Locally computed
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 20070d763a..6803246dd1 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.29.1
+DDRESCUE_VERSION = 1.30
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = $(BR2_GNU_MIRROR)/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
