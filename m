Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB344F483EA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9DE681546;
	Mon, 23 Mar 2026 19:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EC5oFBVVv_Vq; Mon, 23 Mar 2026 19:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76A081A81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295239;
	bh=tZuH9x7prAvC48+V3LTqf05AxhVN+IWvLteBs/CHG60=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pi9pcXOLIYrUAVMJj+m65i7qajHWCBCWbU0fz22DoMzJnhysGDVUtvxaXGIxiJ275
	 MC9eDpgvc9GLBItcscrkVLmO0lNMJ5BIelywmvkDhdycUx8kOZUHE3qIrePXyQLp6P
	 gDluEvTXysGWj7/R9oOuCgP+SgRGry1pxQaTAcjxoaxVb2hpqJDpmhVbArRNw9LFGx
	 JrtAIKa+whkwgfwZuIHkYB8Q7StkKuAM/8tK4/3OBIsFiI2KqgdH/7Yk1N2nQVgDXR
	 pYpiDN77q4HLZmky31uTDvTTwqw4pTGBmh+ydJp26P3WApRP25GMCnTEIqLWSI1Mmo
	 baisFaLypwQIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B76A081A81;
	Mon, 23 Mar 2026 19:47:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C18BF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00BDA405CB
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjfx3W1Bba5h for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A6A405F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07A6A405F5
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4397984C28; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:52:05 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 47eeee8a3a4bd0f05a7b11857a46277e62ec0d85
X-Git-Newrev: 7560493b6e909b994bc6280c61f4c3bbcd72663c
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.4397984C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libarchive:
 security bump version to 3.8.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7560493b6e909b994bc6280c61f4c3bbcd72663c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libarchive/libarchive/releases/tag/v3.8.6
"Libarchive 3.8.6 is a security and bugfix release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d950ff24888ed48cab96582b9389bda7e0bff6e5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index db7ed95bd9..be357183e2 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.6
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
-sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.6.tar.xz.asc
+sha256  8ac57c1f5e99550948d1fe755c806d26026e71827da228f36bef24527e372e6f  libarchive-3.8.6.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index f3e90e5910..3b8fdbae1e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.5
+LIBARCHIVE_VERSION = 3.8.6
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
