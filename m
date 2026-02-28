Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE13BFEE4ED
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 16:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A2A160EB8;
	Sat, 28 Feb 2026 16:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PslaFN-kde3l; Sat, 28 Feb 2026 16:22:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56F7A60E5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772295764;
	bh=m2GAZcrfbN2fpsy62EkfrrOp38Jr6IDFAmBatigIIpk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U04iThuPCB53EWihh8711w5OIL61I5KUj75kAbVF6BGGygcrvjmWS9qXuYus40fHy
	 8qPj/QEoLfiptLUOibyFycUv1TMIMCqXafYnpmSiVYypiUM4mPl+Z8Egr9ZEKdMkcO
	 Vq2yTMLS5+VsfFNla07W7SOkDYbPKu/LYQDOl+BFj/q7kVcrPsQOGda12V0qIbCFee
	 VyQfY1TaC+s/2jXuwht4wElPcBSc8HPszF0C3gl+fGbZguQz5NcHL0YRXp0yTJecUf
	 ymVnF6qwFTKVftJz8hcJbj4zxXvQ5EeEQQ39HCNPuMCRc8XUCSO7+qh3zVGCrEkJwY
	 n1us2sasREauA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56F7A60E5F;
	Sat, 28 Feb 2026 16:22:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43D6724E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41C7A60E5F
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HT7QCUkM2L8P for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 16:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1D916083F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1D916083F
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:22:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEF5B85C3B; Sat, 28 Feb 2026 16:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 17:08:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 97ceb56821b5c1a23ef763bf98e55c6e09ccd846
X-Git-Newrev: c61dbf8493f6e6c45e55716617c8f8c3b8224879
X-Patchwork-Hint: ignore
Message-Id: <20260228162241.DEF5B85C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gkrellm: bump version
 to 2.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c61dbf8493f6e6c45e55716617c8f8c3b8224879
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://git.srcbox.net/gkrellm/gkrellm/releases/tag/gkrellm-2.5.1

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gkrellm/gkrellm.hash | 4 ++--
 package/gkrellm/gkrellm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gkrellm/gkrellm.hash b/package/gkrellm/gkrellm.hash
index 2f0fbcbeb4..e8a6ef5540 100644
--- a/package/gkrellm/gkrellm.hash
+++ b/package/gkrellm/gkrellm.hash
@@ -1,5 +1,5 @@
-# From https://git.srcbox.net/gkrellm/gkrellm/releases/download/gkrellm-2.5.0/gkrellm-2.5.0.tar.bz2.sha256sum
-sha256  68c75a03a06b935afa93d3331ca1c2d862c1d50c3e9df19d9a8d48970d766b55  gkrellm-2.5.0.tar.bz2
+# From https://git.srcbox.net/gkrellm/gkrellm/releases/download/gkrellm-2.5.1/gkrellm-2.5.1.tar.bz2.sha256sum
+sha256  089e3c1ed398482e682c9900b504ea166a6144a6c9fa041e70c5bbca6b177e63  gkrellm-2.5.1.tar.bz2
 # Locally computed
 sha256  691de85c3c6eeda5b6982c751548575344739ce4b4418d78905e599359f6c435  COPYING
 sha256  a4bb0b604fe7d40ca4469ffd5e2e2de70ff8ece43e47980ab2c8962d5e913330  COPYRIGHT
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 6ee00858d3..16d0729d5f 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GKRELLM_VERSION = 2.5.0
-GKRELLM_SITE = http://gkrellm.srcbox.net/releases
+GKRELLM_VERSION = 2.5.1
+GKRELLM_SITE = https://gkrellm.srcbox.net/releases
 GKRELLM_SOURCE = gkrellm-$(GKRELLM_VERSION).tar.bz2
 GKRELLM_LICENSE = GPL-3.0+
 GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
