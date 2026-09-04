Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB129C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 18:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB1C605EC;
	Fri,  4 Sep 2026 18:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4J-_EiIoQha; Fri,  4 Sep 2026 18:42:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A963660B89
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788547371;
	b=RHyEqU/bV3TiY9nbsmwNXpBy1BQSxXRSFvLP2w1AAF4ONfdejYl8sRNRA5jWtFcu6irw
	 B+5T4CZdnWm4XTDxlnXNulXYtB7dTXUcd9B4kyxNcPK1odnCcxBM4a3lhODgvcSbuOTyz
	 CvFeNErUbiUaUyiEfRMErdyIbSHvHKp8TEsHx7ouXLoLuTjNWT35wtDbc4gIn4/D82jV0
	 ll2v5eN37eliThGI/a4549QF/t7k9CZfJOnKuwBOPmrFeIMgyvygvbr5QYdJUzgfMYC+N
	 fSJ2KftmtYc9bez4Hycoqr8+8AbPduM4AvTCyDJlR2xxy2iYPApcT/XjXqSIfnQ89Dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788547371;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2meA23ckoLYV+LXTM43KVMXoXro/noBAXGWmmkT1ThQ=;
	b=Xju5RwbefviF4/W4BWCVi8nNzqaBi6IAxyTI5RnPfHKDG650RwvkOQb5cSR9JvMtWFfd
	 G6coUsCo9u4gnI3YuExMR7XAtHELeAoOb+9u/L65oEKlzwfIx1pMz9lnLKxN1GkFiOPLk
	 WoVIgjhuAEKMHgUy1Q9VPME+GbWKP+/62JeQlXfzgA+KkvZgaRkyigzAjYJJJHQVgBFmk
	 6v8Hmb57GNbO0rI7bqX5Ol6yjqkeaYyvsjCEQV3svqBLcQsrHAbiqlPCRLi8pAdneYSBQ
	 Z5POXnNq+L1quSO5Bwk4KYtcq5gMIZ3RBGI+doloa84y0huOl0TtdMxP+N5vd/vYZRw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788547371;
	bh=2meA23ckoLYV+LXTM43KVMXoXro/noBAXGWmmkT1ThQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dIkyzJbO5vmQuVcWTLhbg9YaN4HvAVqbq+QusENW8BG7yjYhl5g4IGZViwBp3RtGy
	 7rX00tCVUBK3XoM1dIZs6hVGj+VnJpuHMone7tLPp55FRyv4rec8TCAQ6MahcVQOJq
	 zYj3GVyzpqmCXMgsPEyamDcyJkBI1hM7je5XCaNEsbzkpWjxCcKOGtur/iAiYSoMNV
	 M2SjBvGixVxmluZSQ4PtfWCCN5VHp5byapcKXaRR1boTxGG4+EckQ3gP+/GKDls5CU
	 ogHl/L7bNYxfqOWSQECfpo65Jg2qC4Jn1404w0c7taLm2RqLT2jJ0F39KMyXIyNg8L
	 IJGiRH+n7lLdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A963660B89;
	Fri,  4 Sep 2026 18:42:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFEC53DA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B33404F9
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jd5lo7cenAxf for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 18:42:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A1298404F8
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788547368;
 b=pwB9GlVuA8D+xll2C4DfNDsIqe6jW8IjY79Q7aCoRl+9RSYVaDLWRXzrS4Yop1j0D+MH
 wV67TGzzJp2tsifktKglqccE/enUd7VM6BgRH9ZDUe7+uQlckggHLAZOqSZrauDI3E41T
 0Jwg9MSMvw0nFPhVbmSj48gcUY8j5PaaC0ryZIOFTVnTa2w+54Gl/C8ps/pgfGBm/rgMR
 U9nmwlDXiaQhwcCaeWAs46EdKw4QoBw08Wk47ulGZHNDcwt/pmH4W2MFVE+/vx6GN/Ln+
 bEsGNJgZ35GIH/r9rLm1do6Ji9BzAn1zDlf8616EQ5YT9URuC9CB1gDxD0686Kz9bPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788547368;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=aeVRkYFxOJ+VnLO2c1ZC0fu1hNiG0UaMV4yxHHszuGw=;
 b=eu997Lgdxj5Of4nVJR5O9rNa4KSs8WiM11FF2jh111/WF2Rpe2mIIvhFyuf8lHIL+8vA
 JG88VtJ5h/wUoKGgHvH/g/w7C8jaRp9yDJwA4/Dp+QT1MSt9uFHnvPE5yYsshBCiaQbKq
 CQ+E4oyD17AWKW5euNnG3NNBIrCjTuGZ+/Dlh32F4/8N/tdA0QGIvR3ufrIL2Kw3MGEeR
 D4bLw3U3V5yxrOU8usrRmI54KFS5iG7csA3PFjhqPjjEl6101QQ1vkdmuNHxv4WBP10uU
 hxL4cqTbwXfcliIdfsIhqaqboZF9uUtLqYsaRmChKsCs6CgLAWstEmAJC9L16ByLTJQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=i0xAV2XC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=i0xAV2XC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1298404F8
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788547366;
 bh=aeVRkYFxOJ+VnLO2c1ZC0fu1hNiG0UaMV4yxHHszuGw=;
 h=From:To:Subject:Date:From;
 b=i0xAV2XC7BvDw0JJ8lNHXJiRACdTZrkToMMvv9BLJNqOias7eAy3DZUzbgCGlS9FC
 PmZMSuW9F3f3ChwmYnhnuXC2BKzwdvlWrnTEA+cgsaXh+mj+GmOhpQOsa7o3WBpjN4
 u6rJ+mA2U9YmmPrYH94KLsQRYn/Rn8qqy9kmreY6i9PScabX9BPme7R5bwVeZLs9U2
 w1nZijX38u2b2UVKTVUdg7M7npmfPsGbkZpKkvCDGqp3HdWuUPHS5SCX9HEr341O7R
 JmNuSvU9k1U9oJrCJ9bOcbpV1cePrx1o4XYDELbCSW7twYchUTblrmMotfnXWhnGZ/
 Th1olpwoeWhZw==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F0F4A4C1FC3
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:42:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42138)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2Ys9-0000000054W-3icV
 for buildroot@buildroot.org; Fri, 04 Sep 2026 18:42:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 20:42:45 +0200
Message-ID: <20260904184245.875865-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/omniorb: bump version to 4.3.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sourceforge.net/p/omniorb/svn/HEAD/tree/tags/4_3_4/omniORB/ReleaseNotes.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/fb329836dc625659960294682a434f77ab4ba2b9

 package/omniorb/omniorb.hash | 8 ++++----
 package/omniorb/omniorb.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
index 36db67191d..b71fa7e2ac 100644
--- a/package/omniorb/omniorb.hash
+++ b/package/omniorb/omniorb.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.1/
-sha1  b6581c9b6a956c1d442c442767b5a58899a09513  omniORB-4.3.1.tar.bz2
-md5  dc3e4467ef3f457025fedcc6403f8f13  omniORB-4.3.1.tar.bz2
+# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.4/
+sha1  03cab2ac0ff04688e174a9247e85ff230d6f2451  omniORB-4.3.4.tar.bz2
+md5  92a8f1b8612dcf692a8c35da4b0da9d2  omniORB-4.3.4.tar.bz2
 
 # Locally generated
-sha256  0f42bc3eb737cae680dafa85b3ae3958e9f56a37912c5fb6b875933f8fb7390d  omniORB-4.3.1.tar.bz2
+sha256  79720d415d23cd8da99287a4ef4da0aa1bd34d3e4c7b1530715600adc5ed3dc3  omniORB-4.3.4.tar.bz2
 sha256  126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
 sha256  eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 8235fac797..b61c7c3537 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.3.1
+OMNIORB_VERSION = 4.3.4
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
