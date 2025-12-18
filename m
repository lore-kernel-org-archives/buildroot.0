Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB738D6E2B3
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 810C54112E;
	Thu, 18 Dec 2025 16:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CvIiHmiq_Hw; Thu, 18 Dec 2025 16:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73F3A41135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076248;
	bh=tM90NvkjNXSbrJAqyO42+Wl0gTFoJr6x+a0dcFblemc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E0ftqO9/iyKliurvuQ3Xz+icAnLiyarZejbkWDuQZ33VardztSbs9xirpFgiIFa6p
	 OMuqsNDWE8k3ZBv5qfIZoIihMDA893eYp180/uj6/g2YMtd3Nj326imvc7bf7tV8sF
	 Ztp8cRFeQe+dxYm/ITncSwKKJg7vdm+Zi1wvanTquKnhJT1A9DSrt45FzMapPBtHuW
	 nXp5/2lppSItiOrJnMw99MR6JW0tMN1BFFJo9A0MrnHw7ZL6nh/UKXyBBHsPDjKNAi
	 /dacrtufVqEztvl1tfUDVOzelKYhL+n+p/WByUiYqjjbZ182a1/wo5qgMlVdWZAP2z
	 QX5F1dVAe4HgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F3A41135;
	Thu, 18 Dec 2025 16:44:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01969375
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6305441042
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiNTzl11w16F for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA6241043
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACA6241043
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA350873D5; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:57:30 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a57d4e39bb1f17ca07354645f6adbfa2fac44ab2
X-Git-Newrev: a291caf139a966867364ab37f0842881572c775f
X-Patchwork-Hint: ignore
Message-Id: <20251218164358.AA350873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/samba4: bump
 version to 4.23.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a291caf139a966867364ab37f0842881572c775f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

https://www.samba.org/samba/history/samba-4.23.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d39ec850916d17b28ccba614f0ef5d03a2878042)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index ec28ced087..363c6c26eb 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.3.tar.asc
-sha256  06cdbb27a6956978b045455fe0696d998ffbac8d24ba24de87a4ef8200813320  samba-4.23.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.4.tar.asc
+sha256  af429d078a86f1ce16d0d1ecee35c42a3610790b47b84468f31284a8c4060140  samba-4.23.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 439e5452af..7976e9ae05 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.3
+SAMBA4_VERSION = 4.23.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
