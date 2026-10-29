Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A432606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Mm1q1E9D
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14DD660B31;
	Fri, 30 Oct 2026 14:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4vcw3JUeyYX; Fri, 30 Oct 2026 14:07:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D55560B70
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369252;
	b=sN9gl4uAsvt4c1IwUbEVoXt+Kf+2I+D85IiFb0AtF1g7Z5Ed1rw2SiNZIdTklrfoTZma
	 P0VPX0OuZ9RJk89PMtrSmNQoyf4vTE0FuQYy7oFHXwrX9Ext1Cs7wSNvGOsFsLvH7X/bU
	 +oTUffaiSdzrp57W9gzBDQjwMmO7SIJAs4gKY//OD6dWZo4SWsylHp2qif8emFaGL4TfK
	 iIIpvIu/BDBcAQaoapmYj7unQ4D5YktHdCKbB8wrcLVPzjmZyxkq19vFLu9FlynFBauMd
	 lQ89VLmKtdjvYnsdgspYpPFlxQEgdGgWQC/apAQXsiQtMLp1u0piPWRfTKS2EEDLZCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qS9dbzW+E8xwsnblCDb0W1nu6wxK/fSUeuMf/h6vJZQ=;
	b=rmmQeZHhHQ79u8/8DF4L948D/ZcJEdRbpan3dN8LLppqosuM4ucj4KMh/gS10biCzVJL
	 XXoJ2sDJtTMQy2gcaTC8fixuQZCaY6EFOcsVMLBr0tK+nzcUztns/d0M9YsgfuD5QHQTP
	 FZSCR1cX1dfGUfMHfYiyVKhoMsG4ys7aiSrOiKKn54U/b8rfkpb/XAQtuC5B04O0qKNiu
	 S2chlJ5qbUjaHTYxJBB74M0DZSVdvRWuPu9NaEmx6ZAQLY07yaswCtdpahsUw/351sRjL
	 AkmMp3QmVB0GoC+PEY8jfKZFA/mKqIPOqi3lGLzZwJted15V/1T15rG4lYgCzNN9GmA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369252;
	bh=qS9dbzW+E8xwsnblCDb0W1nu6wxK/fSUeuMf/h6vJZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mm1q1E9DNIFOZWWXpKdm2wZlLUAeAnqVdf52k/qd8CkrfQeHuCppeeJ7McZ8hOCZp
	 QVfAYWgEl8KPJJlYlTQe8J0vvlAmqX5ICYHuxMBFVvJvMl5neenXH7LYJjUgFlPhNE
	 /h0WWkwT4N+7uL4VVVF5yxxd9QdFjebfUBw8OWZIsJwDlS2DG9BUOVS/dhtqf4NcuV
	 q8osySK8vTsCpB1AwbdhSxdCz6ruWWP63QuCCOuBQKQ0osLUYCWpy+fCixZV4fukqh
	 hdrCNbF5AYfm+ACgDiDgmBxX3kq0uMhO1L0mlEvFfKf2U/+BqTbx7d+kZf2eYA6HY5
	 R5i65i/8ErEfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D55560B70;
	Fri, 30 Oct 2026 14:07:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A72AD44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AA158118D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loKdE0DnYNLF for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8AC308119B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=qnCiYLhvetpfDGPJMPWl1xYLgTWsO04MiNFQ928GKqV0jc6iWpmlwIHzAaMUAZhEzdoN
 X+iinqZwuUzYpHuR9LDxtNmy0UaRGOI0ktUCQCM/AdtsJclN4CHOJAH3bmRQwckPhiSOY
 4piiG5SgCkJXBuRXswjPdshmdkleInWT0RNJxZWWnnCMzyUnznc0bL8sEteJvPcFhRExi
 OJqeCj7oOroBAgsc5hoEJHU+/FOFQdrXA4DRLvdZGJPs8vFPvFj2poEkGD3jMla9GrCG7
 I/6F9y9iegh2LygzIssQPUzolkCqx0/m31VFQ1LXUWn6XmbdzdYSlx1oth4rG9FyUsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CwHKwBjhaUkoRltxT9/cMWea5IWyamjEor6vrX+JGFM=;
 b=TXjtie77u26jN4if7TaOy50NQWYADruMx0gbT972RVlvyTL6f6/xyc5YsZQtZW59FXk+
 J3CZAGSc8xyXAnBujDc+meo7Ck2ul0Osgc6imnKAr8jtuCw6bMWFgibbgiz3LvYIeLM+N
 hcrOCZRIQ4iNgtmSWKWPYiGooOC6ro+SQD7/9kIjU09ifDONj9ERTXFaaUahDO+WjdZSQ
 6rMKPKEP1r92GvpYby8RYuLnsr6SVr3gWJgfT7ZZe21yh1sGXjeq6M9zy7DMS8Negdet4
 qPI8qSIzh1L6vsF0VS5QY4JjwvSUd2nyWQXGhQsgOaW36nWsoj0mCU+sAHpttcgbpGQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AC308119B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A99C99D389; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 03ee2021bddfe8357d562b995ec6e7237d4e84fc
X-Git-Newrev: 975d3db0113d530769e953ddd651d98026240c17
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.A99C99D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.120.1
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
Content-Type: multipart/mixed; boundary="===============3597598451775036504=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3597598451775036504==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/975d3db0113d530769e953ddd651d98026240c17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/471dd263e131d2f14b3c047bc2f3f5315db9a015/doc/rst/releases/nss_3_120_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix release notes url in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 50d1dec604c21c04bd518109fff0c67e8f7f029b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index dd0724f8c7..f3805fe6b7 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_RTM/src/SHA256SUMS
-sha256  7ce5f5b3a172a41539ffc118d8ef4834974d0a6a782743e4a05a4e208dd6d22f  nss-3.120.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_1_RTM/src/SHA256SUMS
+sha256  a98f002d20bfe719f50f81824a64c9e6f067f4da3c6a1f0455e97e6d79240512  nss-3.120.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index fc8d0edb39..c7354290b1 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.120
+LIBNSS_VERSION = 3.120.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============3597598451775036504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3597598451775036504==--
