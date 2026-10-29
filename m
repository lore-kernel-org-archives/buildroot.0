Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA70606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EzxqXHiq
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E470281276;
	Fri, 30 Oct 2026 14:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Yh00LKKNwqO; Fri, 30 Oct 2026 14:07:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 18D338125E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369246;
	b=XOq+4U1Ul6preKsWhvkqd3el60lDc5xmLZeMPgA+Ojgs7LPvPp3W361cjmVWjti6Ilj5
	 kUPz8jajqaJ5YCUMiAxHcVl+yr7OIZEXo7OfDe1Pe395cMYnIKBo0PeeiQ12NauJWhvUs
	 YprPHICsnuB57H1JWZ/dV5aOzlbrro93LpXHncxUXJAJmHmV3gu2YV2KfAYmGfsxWK/9H
	 ZrbFOmYV0oWZxqwuiifkpBuPZT1NboU7IXAdTh+nTIzQ05scODZ0s5xa7bq1kZm91ho0J
	 vYY47AyNvThRZHwVSSqzJy66540vSWiNn7DZtm9sfH7YXXrXAVOOpsk4i6eONT6cxJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=B4xVvrC5VldTnhzFpZJPJNd5S1q4/vDtUA8Wb3gRcsg=;
	b=NMwBs+C6V4qtXS1gpRGLmP4ndphGA2AWTt0CRVlKgAywwEvLn7kUaPdDwy1jJ46aqvJN
	 kf4gBBh1b/FePOqF6zheoiEDmvGw6MgnS55mPkyUzKKhauoBp6DAC7svj+nZ7YWYZAGCI
	 oCfo+mdyMPBEYbklK7CUj+n0mSNaD/lBkzcUzy1UYuCeVTZix1eBK19wJhk47FLHLDN+K
	 BuUjqsYK5mKa/bdP3stZCiy3Wp/Wqx5DNdDgYyQsjBbJevmel0bnRaDGzChpP+CAPR5sq
	 Mow7IgpRzVcOXvA2b6KiIuRCAGPw/WtQyVILsxjWdswSyUAdZhdpSwdKEIIo5yt1dXw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369246;
	bh=B4xVvrC5VldTnhzFpZJPJNd5S1q4/vDtUA8Wb3gRcsg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EzxqXHiqXj8lNEMNj1nUE3yivT2oHP1yOIqYE3otUzzPIPDfBGDwXbKf1ZeX0ayY9
	 VNBtuJkx14wkF0355UBpQwCIypnnhyn2mfetneBZvrWikbI9AKtE6PaBFnBJuVMY+B
	 GEW0wVb/HgJftTSU1THXOMD/d95t+Acgfv0WFC5fsldo3p1SAqL34NB/suTCGvvbWu
	 e21sLsXmDJLYEbf8pr3EOAFqRbkT6JgJf4b1ZCcG9IeElzx6rwEL/+pvj0upesxrtR
	 EyPwNAJ0/oJPZMm1ldxSDwzB5Lg1nFqQkk3J0nVJ4s6gN/Y02TSj9OMtdM/jXXHYmc
	 M8Aaf5Y8Salew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18D338125E;
	Fri, 30 Oct 2026 14:07:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DCD8D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5743540B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urDLRbRQ7qYE for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 96F9E40B2E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=d63ZjR7wnlJXcQzqkr6Lg092yWwdfCYSubZuKFByBcY6Q4yKRp+OtaxejDENLpEyd99i
 e6LJ3nJkRJuPMP95pmku9hXNOhBDWydVBIFKNAOBFMAvI7fKg9/I0s1jbyYeU5Jws4t+J
 JkmJZWNIUobh0bsq76hlJ5uXMVs1XYHJqMdB5IGF/uwsepUkg0V1M9JzkTH2UMEVYF3Wk
 w2uqaf0uaBXSM4oq9kPSdWG5N2jXM6v0KdeANMvKjmVqQNU2HD6JqRMxYvl+iMnHCfrhT
 BFQmEs7WthmIrs/qUM3BMRP/lUrZbiGyC8NeBYbx8QQJkNCEqOhOouuKiSfobsH2IBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1gvEIwoC1pFykaSmZhgR1NFt4EqLKYoT81ync7k5qmk=;
 b=e/oBCOW8mAQgrzQJdqCIQmEhmp1JgBoFO9JLqNksjPYoHL/SYNoNvjxBsFWjsiFNvsMn
 z1/L5ntADq6Da5PR49rWSDxzeqGUWrRUBpYZV5jIdHPJ4OD13Y7bENRf0pjR/BkSABiSL
 PkPnshP4wWhbrTZSXeWtHzZGL3yjF0zIbhtq+AqctRtLMQXPKWpZL7HXLmF2bLd0QgZL+
 5RmYFv120SL3JVjNZnVe7G5rRifyegFtUC2R3OIlNvSd8T7wvrZKJ5yiHUw4/E38c9sPm
 SgaNA6jv1gV/xlvHGDAJ1kD5ENCGF3CIgq0M1+gYuyN1Wshb2xr8ZlMtYtLpP/dwSqQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96F9E40B2E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B646B9D388; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 975d3db0113d530769e953ddd651d98026240c17
X-Git-Newrev: 4ca04e1d3456cc392e9fbb0750b68cfa3c130f2a
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.B646B9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.121
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
Content-Type: multipart/mixed; boundary="===============2401184842119137508=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2401184842119137508==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ca04e1d3456cc392e9fbb0750b68cfa3c130f2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_121.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e8a567043d8a7e9eb996582a3177e077f23b11ae)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index f3805fe6b7..1a15325f1d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_1_RTM/src/SHA256SUMS
-sha256  a98f002d20bfe719f50f81824a64c9e6f067f4da3c6a1f0455e97e6d79240512  nss-3.120.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_121_RTM/src/SHA256SUMS
+sha256  cb3a8f8781bea78b7b8edd3afb7a2cb58e4881bb0160d189a39b98216ba7632e  nss-3.121.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index c7354290b1..dfded6999e 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.120.1
+LIBNSS_VERSION = 3.121
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============2401184842119137508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2401184842119137508==--
