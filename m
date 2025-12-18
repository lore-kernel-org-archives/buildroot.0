Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B80FD6E2AF
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB325410D8;
	Thu, 18 Dec 2025 16:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsOFGw_KRP-8; Thu, 18 Dec 2025 16:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C37410D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075718;
	bh=tKqfj91ZQwMVki+ZNJI2SzChEV2VIKAOa46LaKNZkMU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XSA5ZPoLGVDotTazaU+KSXWaoWuoJBIc5teUBj7gsdKNG93yMP7AS1me/aES3cVmL
	 mfoAYIXXfRdFHsc9tZuqwl2ybcmOM4qxbNkJjdMpn4HI2oi9C4RA03VLXffYVB2el/
	 7EHHOzHBMGw4SGMhyMfLT5xKF9wwG69kr+9yoDRCO0neh1t7Qn44N3oJA5Er/zGGsx
	 qCSEnQACVCrBNgh3t4wq3eBYTpJ4XUtkHJhnfDAFfd2PF03EvdkS9/UFbFF2gaaLwR
	 3rY4mQf9w+Pl+PlOh1/p+UoBgezZVH9Zx5PjuOiH5RsLjTNUvh0tHvK9OtzLBQZWgK
	 fSQmuNpRxCH7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C37410D2;
	Thu, 18 Dec 2025 16:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C30B3361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3296183DDE
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLkR-qZ0j3jI for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 864A083DB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 864A083DB6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73FB88229C; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:53:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8782b81bf3dee288916ef1f660f97fcb0108fb6b
X-Git-Newrev: 0c1ecdc34cd23432b6f641f0a65d837af01b0f5e
X-Patchwork-Hint: ignore
Message-Id: <20251218163507.73FB88229C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pigz: switch site
 to HTTPS
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c1ecdc34cd23432b6f641f0a65d837af01b0f5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Prefer HTTPS for source downloads.
No functional change; hashes unchanged.
Align comment in .hash and Config.in.

Signed-off-by: Preyas <preyas17@zohomail.in>
[Julien: also update Config.in package home page]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 638224b4e62d24a64ea6043d3efdbeb9278f94ad)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pigz/Config.in | 2 +-
 package/pigz/pigz.hash | 2 +-
 package/pigz/pigz.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pigz/Config.in b/package/pigz/Config.in
index af229060cf..c6db83d490 100644
--- a/package/pigz/Config.in
+++ b/package/pigz/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PIGZ
 	  processors and multiple cores to the hilt when compressing
 	  data.
 
-	  http://www.zlib.net/pigz/
+	  https://www.zlib.net/pigz/
 
 comment "pigz needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index d09930b62b..d63c5a5717 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,4 +1,4 @@
-# From http://zlib.net/pigz
+# From https://zlib.net/pigz
 sha256  eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0  pigz-2.8.tar.gz
 
 # Locally calculated
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index e3273c71c1..0708882a15 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PIGZ_VERSION = 2.8
-PIGZ_SITE = http://zlib.net/pigz
+PIGZ_SITE = https://zlib.net/pigz
 PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
 PIGZ_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
