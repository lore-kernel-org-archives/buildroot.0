Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2818606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IhrsMi89
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9114940BE3;
	Fri, 30 Oct 2026 14:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zD3aPKRl1tWU; Fri, 30 Oct 2026 14:07:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9D89B40BBE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369256;
	b=YLQxBtWRyGoGG4JwHvbDjqEAdqMx7Bg7xsHBhYT35tqcgJ5cdkpNwogngXQpi5bYx1WZ
	 CF7Gh30vHR293EVrPtNd714IHPN4xXUoxm7UfdtmaZuNzrY3R/sxbAfgfT7Uh50jiVude
	 fwZPqtRWmJE7vHAh0hiFZUs4N45Z8Enu9nEXucaokpY5w1vaai2nT+SnDIIxdekkIThAs
	 b7c/HkuuMs9TiQyDwetXHZAsYb4PWFhebnvOgDitpNgvp2fgQA17NCcHTKowGeXyeWLrB
	 1OKO+b4ST7nzwKJKcgHxnHdItqImx91nOmEU+MUUI0zXP317+qDeR/yw3AbrGDLLzdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Y8AFGqdGatIVFuBMTg7vdjYOty2kVr8UCoZ1Vchrm1k=;
	b=hBczAA9fbLKHhArsERgBmhCQT06bZdVVotPiNXKvevR+ZEBx9GoJkaio0txF9u8czBuN
	 YEwdhggpvDo3imL3BEk0nAJUqwKh59p6gMPssHPpu2qsO2HRo4+YVRPLpJdM1Dc/rwNmY
	 5mxYPjamPd8YR7FZ4Q2xWNNbq/CgjUNjOGDhp5g0aIWlk4DNZ9kARzA/zDBOu9re7LTTR
	 z4Rkm1Ni5gU+xPwc62ZeOFHxpq0wiUX6z2CpFiTM0LNZc1yMtdbw+MTaPzQK9truTegva
	 cDOQATvMSDVxc/b8W7BXO7DpY4zyZ6GKqqTXaNllyfiVNBdr2dq3+sSsHPaWcdo2/gw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369256;
	bh=Y8AFGqdGatIVFuBMTg7vdjYOty2kVr8UCoZ1Vchrm1k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IhrsMi895TWZg45x69/ZpCM2Z9u7fOrx2HrdZF9S4Ud1TaFBBrtYTSCRYi0G+aeYJ
	 K+967evIO/geluU/wNSLnJU8SY1vQJbRbkMnwz0SbX06uSoTz07lX0JxHhRukqTtYu
	 LkttrjkmLGQgjyXj+vMhTQOuKok2VefuqLanzbMwWiYHdzC/s49PCJw9ZYt3E0D+aw
	 0N7oSOLNwaUfBfw0Md+on+tvAR+TNd0622S/YWqokKt5g1YsuQytG4zvbJ0QogSoCd
	 uStTIXFnjqqnAKm/+w6zyxma/oAyWtiUHd0YBIqgSFAsOJZcVWCx8G/rcEKZCQ1jM/
	 Fa5CK1fetpXpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D89B40BBE;
	Fri, 30 Oct 2026 14:07:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 786B6D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68B8940B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uy0GR2HARJA for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 93ADD40B1F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=kXapuA5rnrenvAwSNtMTFCqwVlTAVoL0iV15+JGs9FDufAINUOk8LgwIFjaSlcVeqor/
 7FdVvIQKH0s4QCsrx9EQVa/bvYpb+tHK+HEXRaiu/qHQq+X114zRISUS3AEoquHhku4aH
 t5JuWXwpjFs5digvGuTpiUyUSb6US1Sesfb4ndEYYb7ZA+sVKALNxBvyJNP1MiX7Ud1y5
 8FFK4XTwOIuAYfoOZKMeUds3I4U7QF1HhhWP0IQBry/YZC4NMzTujunI8lo15xOYtlrx4
 XSqkgvecBLmeRykR5h/D8A/fn5RBIbGz4TdSILL8vf83c5HT/Fp17I4hd0X0oMymMwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZIOm6ISHzEBvaJ9yXlmbPwLg7RlhSYRP2kG84AAQo6w=;
 b=g+C/rIdh3zIJdVcEVUwUd0uqBh4HYi/Xtpv312KxsKdYzqpqNzhdNBoP9k7pgd8kUu3U
 yxlHdjOVIkMYSDNIt5fzlBzkwLmsZQuLYIvTRHK9fHq1YddSuFUivFaM27ePN05dHvnhy
 NKIMqCw8ZuMQn4F1PfZSxwIma4BnIH0YRDYIPI6cuP/g91x4vKXzvqaAw+rhRC+kKhoZt
 Ysiexeelxf9HbpIcUs89qxCF5SNp1787WlCO0yy5qrv/2E+lyKT7+0861o0gPx8Nc0ZnZ
 Quyjw/N8x1z0vuowjDJDqd5zfLmnNHPqNtZzB1bzZpQ+baLzWStxqjGFMbhg2z4yOgQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93ADD40B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B37F39D388; Fri, 30 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8a5114b517723448629b241480e4138f28fe5c7b
X-Git-Newrev: 0139d15ff6d6d4626ebfbf6b46e109294d6809d5
X-Patchwork-Hint: ignore
Message-Id: <20261030140437.B37F39D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.109
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8963993420527276907=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8963993420527276907==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0139d15ff6d6d4626ebfbf6b46e109294d6809d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg.mozilla.org/projects/nss/diff/82eb56300e9d8e1e65312acc8ed11b26de8de222/doc/rst/releases/nss_3_109.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4f0c7b0dcb48d5e9e9fc54ce49c1771f7e49f54a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 0f73002243..9244a0000d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_108_RTM/src/SHA256SUMS
-sha256  a0f6fcb5dbadc1635b43827517a979e3a6d005d0788527802a6b31e2c5f66eec  nss-3.108.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_109_RTM/src/SHA256SUMS
+sha256  bea46c256118cd8910202f05339627d75291f13b80054527df58419b9d29c18b  nss-3.109.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 1be96e19b9..e25beacba5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.108
+LIBNSS_VERSION = 3.109
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============8963993420527276907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8963993420527276907==--
