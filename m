Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922A2D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59564611E6;
	Thu, 18 Dec 2025 16:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zEa0mgOmqR4; Thu, 18 Dec 2025 16:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36F8C611AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076246;
	bh=BmWhZn4l1A4DcXlNDkKwoJ5Ugvr4tGz5lWdwmqj8ivg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hAQDbBlSkgKBiMLo8km5Sdi39AXQ4nS2GM40cjYMlUfRCfYBARIPQ1Ml9+eeenUOw
	 OZNUQvsNyea1YGxOzuedRo8pKxZsZKmUrgiMneDNjKDG/TpJHU/NAXa7b+dKTbShOZ
	 V0g/C72qNaa86s1IkzlL1HvNQpndsPJfkku+cfp1/ERSoLiCinpGtF7YDfzYppVKmA
	 2P3hMf/daru+GWS6h8lA0y5MlPsl2zwYELZIL1Ou7wsPtr4vCQr0Fr3oPVPasdc1Qc
	 hPhK4A3VCd8GB/VW9ymSRG3nXG5l3kXGpy65uISf+Kw9S/ud+3XfjPMSjrhR/zNrwz
	 CAKipx/Woz2/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F8C611AA;
	Thu, 18 Dec 2025 16:44:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE8DF1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FCE683E6C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqX_9u9tQv3Y for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9723D83E72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9723D83E72
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8954E873D6; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:56:36 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 3709f8ee857ae122027fdfc6d9abecd4c388077f
X-Git-Newrev: 45a8a415bce326728540921fb728bacb137cb955
X-Patchwork-Hint: ignore
Message-Id: <20251218164358.8954E873D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rtl8192eu: bump
 to 2025-10-13 version on branch 5.11.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=45a8a415bce326728540921fb728bacb137cb955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

This version allows to build with Linux 6.18.

Fixes:

    In file included from core/crypto/sha256.c:11:
    core/crypto/sha256.h:16:5: error: conflicting types for 'hmac_sha256'; have 'int(const u8 *, size_t,  const u8 *, size_t,  u8 *)' {aka 'int(const unsigned char *, long unsigned int,  const unsigned char *, long unsigned int,  unsigned char *)'}

Build failure still not occured in autobuilders.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add details about the error being fixed]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9ec337489a399f65df66dbad11317e35e44ef30d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 42055cb194..05e53745c7 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  19e1686d6841f572d3274c96e3e4b66544027d559f5d4da528d8c8510f7d34e6  rtl8192eu-ee928d5dc065f328043711c271eb54f008e6245c.tar.gz
+sha256  50e289e6a1a4f5cf455e7525b2e2003c0ce58b6b55c1c3ab2e91e3b9fc357730  rtl8192eu-9664b2bfc4bcba55ca5a1284e67bad15ed910081.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index d96389edf0..91c250e07d 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = ee928d5dc065f328043711c271eb54f008e6245c
+RTL8192EU_VERSION = 9664b2bfc4bcba55ca5a1284e67bad15ed910081
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
