Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A73D606A321
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AgCLAhnn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=FxdTl/AQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC2780F80;
	Wed, 28 Oct 2026 22:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGwRGe2FDKeT; Wed, 28 Oct 2026 22:30:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EF53A81005
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226613;
	b=MOVcCCIadNg87uzhgbWF5xMfHH/ulcorKVvb6uSHj+tvBsLAzsDmNI7HGyvF1QyGuzNE
	 uxJbXHCeI579vWmstrepe9b5LiWb2hhdHj2XywyAKClOXL17BOxpmSV91Tp1zARSLCP/t
	 Qt2UCjovo4P8UtlrpUJO+4CB6Thkt2m8/p2qd4hAXzH+dCzxvyW5LdfysWpbRMhUzSiMX
	 IsMhtvLjtlgdh8UQHwijn+a6HGvCQwv3EdRxWbust4HsACNJdfYnBT8saDLAO89erc0tt
	 gXWUs4tznARHeVGxrlfKJb7DmYeciwmO8mB82SfG7BRsnvgqIsQsRycPJn+8cfsR+4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226613;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lz+mAzHej/2dpfLnKFnmfkn2XzorsFfmQFvaTRKn2B0=;
	b=OQaH27pLjiNaQLYSlb5mOBbm6FLIUIb82/wANBczBit7nPJILPGXeKyhB3XpUkI2mgiQ
	 h/+CHPPFk7IdOEZV9coMCNXpp8IuzjjZK2p8OJqgEiJzsagr6NWPPRv7g7ChRlOCejcur
	 rhlaIJ9UHj4VJVMVjWunez8WUjD9r1F2Syn3ZMqf6VbbdqTLF47ezF2XC/nnutftZ40HK
	 6UsEJlSahbZJ6kf6Kk8JSpT2CP85itmfDQdItTtzmzVvmFnegE2zLRa3Q+4TXMdH+F6e6
	 KhDdgtanvk2lkJRpnd620ebxJnNihXaUZdvDXVwG3DaW7Y9cgfVOYLYDyp2Dmdngq/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="FxdTl/AQ";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226613;
	bh=lz+mAzHej/2dpfLnKFnmfkn2XzorsFfmQFvaTRKn2B0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AgCLAhnnd+Ljt+E5o07CvsMmmTgbGm7CPZAi53E0lvQiIKOp/sRCEKZYeoTtdZzes
	 JyOmJboK9h2pNWcy3sMoahcVQ8aeJQF/2OBRSB58snWKTsycx6Euj857W6ogsyHHNE
	 TlKUjY6G/aUXFTckwNN8uc5NeZPVNYCzF3Q7ussHKjB8NAfRKq65qgqZnmUeb9apBd
	 q+CqoII8uU1gcujfWegUlJnk2QIvCzSitQjlZSyqzaYIwaDJ/YRKztfoqQWJ0bOmSw
	 U1p6QvEHntkbf/AqIP0oxzZuxefaAZLZ2l38qboiwlJmQGtdtOjjjFaso80J/KvAfM
	 avJI9wTGlOVBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF53A81005;
	Wed, 28 Oct 2026 22:30:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A71592A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D29080F80
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1L6iXW5HI_k for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:30:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C845180F6E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226611;
 b=Q22Rg14EqlS007l2jOAOXLp3jDpEzZWBz/s7tNIOEL+EZvR4U/mESA0qz4ZM/zcPeOdI
 MjgWGPzDLylPFmGFP58SEdruMppM5fi247lry9XGokar4ck2av6fMnTWR/ozL6V1YPERM
 5REnb6fTSBcmBZ/5F47VTqSR6k6Yat2q9FgD5MQamP7nx0hg0fcoMeZrYZVFdcKyGR0jA
 rZMiZ8tRVeDtvyXiRKl41BC1JYSLpFh665xjHgzMzajqsSPay7kfQEjTQIEAVQUDPaZSc
 pCdDAu7gFBNoUpdWlbr3CTPkJNmKrgxYG7i4z4pxL70J5LGnE2UwyEEPkSwS8xJyL7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226611;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=VOI7og3AGvbWmqoicU9n9Ggu8ww3QaVN/rGVOfgCSZ4=;
 b=nsm2leonACRb1bg878PWG/eeuSqUO102F8/iQsMRk899GF3QHuf6W3Jwv7y0gR6t3YZg
 5VlnllPlWMg6khAS1o7f4i+NLilD2d6yV2pzP03OVrM/f5y/MCwlHk/9h0hrpj+2IvN4p
 EWhO2AhytB3NLTbkFLG2FkvU/lpPo1L+DQDyeZV4/6EP07zVqWwZevWN76ikUifpjDOVx
 9oUM4e7SlyfWoklqZ7ALRlfF7iBokIO1AAcyKDp4lBylrByxR53iYMsmg5/Tit1yOnHOm
 v4JiCq4Xn/S4WaSF+ARjWk0qxQF0JebHviK/qwAQAme/lBBOq+J33k3cfqCju/Vidkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="FxdTl/AQ"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FxdTl/AQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C845180F6E
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226542;
 bh=VOI7og3AGvbWmqoicU9n9Ggu8ww3QaVN/rGVOfgCSZ4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=FxdTl/AQBM849dcIbe5ASFiqnO/TGQXceauDYFu6xYrIZ0TNDJ7hzyOw+mLR+6trv
 lOu6IIqToNVFbDeRxO4bvS20z7P7lsvqI3kD0Z7ok+TZp21C59h2RhuPVI4OfO1afm
 Dp1P2AqAxhP5SDyspSjQfkIEuoRhRSnbz8g6nspk0FP2P1RpejxNdMKxad7MTiWDaD
 st62Pb0ctMxmES7g/igoga/zyH6A2UlyjEAFT0lAePmSIXr945XXV8dg2kmSAYUUx2
 ZG02BZXFovCR9YtNtM8WQKzEPZmZvpzcMgivqO1vuNGXPWIvg/Nakh6ZLKUYQHW64j
 kDljdASYrjSmg==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 E2Eb9W/gbNNgzVfSSOBt9ljGEd99Wem1/W0KXrOs80aojado4LCaNYM2l2i2RBmSiVRJ0HvA/0t
 sCkKw+7DXxbAO4wS5qD+MCC8BDJI7POyGfuXM5zhmMJEYTynsnT8v0sCAmZNmp5p2FbFE9u0f3W
 c+tqE26RCtsurBib/QzV/ZLodlAgvNqpIWVIjF8+L37/wqe3qIcalfsyAI+O6qdxAdZGROSYTb1
 TcxiGt86m63D2t+5jgxFKI7uZ7rUnUraFyGNKU9ZpBf+qa5BCgoLZBan3d7gcURLNKbxdpot5F/
 PBOfveGTycVNYa0Dawa3/+kT9Un30wUKltd6u9XFSl5r8fWDtBkYXsOFUn892K71bffFOOQ9ANE
 6pXazoKJ2E6urKfQ5F3zHgxrSKOwS79FpsTsEc+jDFlKUFlpoHZg4pBSNQuTEuRK/bNZ/RThCgj
 eWXGinZPy3gX1KvraWPYmbIKZgHQZjfzrE+aHE2Pz27IDQgRwx5/RnCzdfC1Siq+wTItt9l3ZLR
 UV/90uC7h6rNEpy5QIrXTw0cGlGa+AioxoDxRN8jcO0nRTOTlPD+T3YSoanJEDUlu/EQUptOP+T
 ojnn
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8965CA4C6FCF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC88-000000001Tt-3gf3
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:08 +0100
Message-ID: <20261028222822.490779-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 07/20] package/kodi-inputstream-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash        | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index cfd0b62fe6..146457ef55 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c4a458045bf4edfe51a1f9f03ac777c7101c9b00e0e72c76ac51a2b3f530779a  kodi-inputstream-adaptive-21.5.25-Omega.tar.gz
+sha256  4aa567ce2de1eafcac02e341a726ecd0fb91be81c8c06f9e503cb6d36f818eec  kodi-inputstream-adaptive-22.3.23-Piers.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 8aab0c88e8..08db94c031 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.25-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 22.3.23-Piers
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index 497efef7cf..c19949135f 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7223a30d2774e4c7cbd6c4f8a266bf4d186d160590077be627bd0490d80645c  kodi-inputstream-rtmp-21.1.2-Omega.tar.gz
+sha256  4980297ade011d9c9f34c668702d5ae9528650bb4dbeff34cfa640d3a86f57ec  kodi-inputstream-rtmp-22.1.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 7aef9c815d..7b487564b8 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 21.1.2-Omega
+KODI_INPUTSTREAM_RTMP_VERSION = 22.1.3-Piers
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
