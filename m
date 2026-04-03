Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD28E7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0E961295;
	Fri,  3 Apr 2026 10:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buhXkCZaH-Mn; Fri,  3 Apr 2026 10:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F07AB60F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212134;
	bh=fPEe3k0WHiwrPNl1GsBPghT1abT2FG+AHwwLXC+IABY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L+UgXE3Z3cb4f5UZYYIFZxFTrIwyELookeZY2029h03WQaNcsmg4KpfxPCgrrgrSg
	 LjrP9qhg/He7WJSJQYsR/lJSvjvy4o6FgkTa4scr7r29+ajRWAQDXYvHmA1lopM+U7
	 vxv091xE12eahqlzxqR1zRaKhyfAUZbaetKLHSZDuO8CWqqAkvOgFBWUGYwaMxwvNK
	 ai2+hYSYXhFdM9JNlq1Szc+hFq7o1wz20OwzWVNCuOWxDMijOWNo0vKnXtxnt3FBBo
	 zSI+5r1M8udNYd9GmtxzFEw46Xn00WMa8OLFMcGwDBXvDUohBltPWP9tQhQm8HhrVv
	 iczMaRsH/dX5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F07AB60F25;
	Fri,  3 Apr 2026 10:28:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15FCC2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 824DB81A29
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMSl1NXX4LRi for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5023581E1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5023581E1C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD3757FFAA; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 11:53:13 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2745326e6c9790d0200e19f6ae75d4fcb31d3cca
X-Git-Newrev: bd446d02affa43671dae6aeac5ca8eca58ef27cf
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.CD3757FFAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/rauc: security
 bump to version 1.15.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd446d02affa43671dae6aeac5ca8eca58ef27cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following security issue:

CVE-2026-34155: Improper Signing of Plain Bundles Exceeding 2 GiB

RAUC bundles using the 'plain' format exceeding a payload size of 2 GiB
cause an integer overflow which results in a signature which covers only the
first few bytes of the payload.  Given such a bundle with a legitimate
signature, an attacker can modify the part of the payload which is not
covered by the signature.

Bundles using the recommended 'verity' or 'crypt' formats are not affected.

For more details, see the advisory:
https://github.com/rauc/rauc/security/advisories/GHSA-6hj7-q844-m2hx

https://github.com/rauc/rauc/releases/tag/v1.15.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6e4a136363260458a1a15c487f1903f233e80795)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index ea537c63b6..edfefb5a7b 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  603dafa5085b6b964c74d5f57a154a1489af2b415dd20c6ff1447815d02c094f  rauc-1.15.1.tar.xz
+sha256  127a24cde208c65b837ae978c695a00730f1094ee8b6c7d48cf58ef846eae340  rauc-1.15.2.tar.xz
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index ba30c70dad..54974abc09 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.15.1
+RAUC_VERSION = 1.15.2
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
