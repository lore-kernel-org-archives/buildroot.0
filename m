Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29103606A323
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FgbBR3YS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0654760DA2;
	Fri, 30 Oct 2026 14:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nq2kpkyiJdg; Fri, 30 Oct 2026 14:20:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0053760D7B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370024;
	b=NSTrC+sqrTBNG/aM65XTOdCXQ5IgX+W60PGFJyAFkPEDB5SFPZKsTQqJy64/1hgWBcVf
	 io2tsnGFfEXeR1COOXWmjz5cIAYrwFwjCfYbqGF8LHKfpDgqRtwSKl8iq7cIvd6fn1OIF
	 lYaSJKU9mpFySORxwl/xfMn10/ZjD4eKcgOA9M4P+q3ke0TlWbKy31Zap3GxxDGTLmdcd
	 MGPanuDh8j7z+7uFC5PNNHv4NZMZ7iFlL03nt1Btr+2vVeFWEJxVCSyUhnKuBXEQI1tkQ
	 WBBhihRdQ8RJbKcAbQore5dRlS1oWTj0/zHbebJJYVi3mBI8sWV5t+3F+OriKutmb+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370024;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Dh9yRTY16s5VLF3YFGmb5AY6OE85YjOHvllbqTbTI2c=;
	b=lvVJoEtEbzCk/SF2Uaia8yYETYb2MQz/Ov8ZOlSgfVY1JMP2O3HVH6PnNHEs+mSdVQ66
	 SxWThmRxApZXivn5ImUJHwuzioI3GSWf8/wP9t4lAzP5LcSnDpMUfsOwR7xT4f253XTb1
	 vjtQfPxny9Q4dYVlo1KgjsBu3fzHoO17MA8KrgDeEyJYiHSNKVl/3Qh4bMbcmLD197GCv
	 kpdDtofW8F6nEZuX1QorBMTAtOTBR//nud5yKSm1E4V0ehZ+N4xAfEPAWJx/Hyv/NvN+X
	 2jcMDXYSi/IZ8TbFdpeOoJMEdB5C7nu5iveihrTGGqU5UnkyVVdMw+9KSN67o938LTQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370024;
	bh=Dh9yRTY16s5VLF3YFGmb5AY6OE85YjOHvllbqTbTI2c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FgbBR3YSSUUZGHuXCMspcW2mXSx3+Zr5CrgcOBYhDJVskDFree7TSBWB0GPlNRBFz
	 sdpnvp3sajK+BWF5d2t4KQG5dkS6Q215EH1/mWfTzEpLfCvw6vCsN1PK5z6ddfd5ag
	 EnXiYAI1Oqfy/42hVcxQY2R53yYhDaux+3h7z3Oie6RQeAXf7R9HquD8udc2z+JUDW
	 zg/to3tsM5ltVcTykCpLrVlBO7ccp9FD2/I64x1eqF2vGU6oG5BaOAOricigZOhyJB
	 lUboy/afbzvPk0UlHT/3hm4uktCc/pb/2ZXC6nCzWEuc3OJ55blLL3jlKLsk6K6Ayg
	 Fch7bcbD/pqgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0053760D7B;
	Fri, 30 Oct 2026 14:20:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67325712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59DD440530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFlmVeijr9xK for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A758440535
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=cSa9q0M9Bjcc0H/E2FpUeB0lHyFVnWPGPo5tL3LVbNc8kNaxHVZNl7tsXThQ+wPmaOqB
 GYp28jy3ycc/Lv3azi3vaA4bJ/Q9z28NOj8kh8FszLhR47WZ1x8USgFXWz+96bSh1oWtE
 SZGeqthtWcuBJ1P66A6lGSSpmFrHT2t9ATe7T+4BSeGF3jqU0RJaY4w+rRqevDkz5y1N1
 z0BpD5zt5kY8ZrdhGbFUU7pxmJbJA9DhHetDROtf5MAEy40O7PQjnOlq1U3gTwYRS8dl0
 yyA8mBUlmqf9gvyr763cIOoOl8NysNqLW5ql1rlMFjRayWT85a1ZvPKh575ELuP0IFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4cD5A5rHxC8egh4l+FsYcc1KRS5PwPAlt4fMtOJXUQQ=;
 b=tVJoOQP+ZEGrxkqYSeUULF3Y72pnUB85Opu7xDa7scXgNc0XgI54sGbZBV7D/uPlVNzs
 U2bYCx7WqsGaY7rPTzF28+YTiEu8v/M0qZvk3LKrpzriLxCFDB08Z0eP8yTOk7/VOBv99
 cuRaBrMaHxkpCbGpH3M7BcZiPAPgj1gW3Xfzqp/Rwhh0feHDECdGUt4ba8f5wEm4JZBQT
 RuX8/Yy67NFKB554HCNJdDZMm1493oX87cjQJKiINPMewLYfWjB85K+9c4inYU1SteEAO
 QrHUTtlt8vw9DZTljBsS/Dj5BATXu7ZKE/u/kdx8lZ2opT5ecri5HBpAnJAlM9K27QQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A758440535
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5F909D388; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 61cbae760968f73d2d44a072536ec88e4788a8df
X-Git-Newrev: dc432cf1cd07d81ac5c12e1f24bb7e2610c1d3b4
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.C5F909D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/jimtcl: fix
 optional openssl and zlib dependencies
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
Content-Type: multipart/mixed; boundary="===============1137082293879830632=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1137082293879830632==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc432cf1cd07d81ac5c12e1f24bb7e2610c1d3b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since jimtcl 0.83, the "full" configuration is the default, so jimtcl
automatically enables ssl support in the aio extension and the zlib
extension when openssl and zlib are found. As these dependencies are
not declared, the result depends on whether openssl and zlib happen to
be built before jimtcl.

Add them to the dependencies when they are enabled (with host-pkgconf,
which jimtcl uses to find them), and otherwise pass --disable-ssl and
--without-ext=zlib.

This issue has been present since commit 283821fc31c4 ("package/jimtcl:
bump to version 0.83"), as jimtcl 0.83 made its optional features
enabled by default. It therefore affects 2025.11 and later.

Fixes: 283821fc31c4890f141111cbc5994e36703c91eb ("package/jimtcl: bump to version 0.83")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a416a8ef097250ad6acb9b073880ed2a44f7df62)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/jimtcl/jimtcl.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 5e09e776ad..e81b2a250d 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -24,6 +24,20 @@ define JIMTCL_LINK_TCLSH
 endef
 endif
 
+# jimtcl automatically enables ssl support in the aio extension and
+# the zlib extension when the libraries are found
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+JIMTCL_DEPENDENCIES += host-pkgconf openssl
+else
+JIMTCL_CONF_OPTS += --disable-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+JIMTCL_DEPENDENCIES += host-pkgconf zlib
+else
+JIMTCL_CONF_OPTS += --without-ext=zlib
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 define JIMTCL_INSTALL_LIB
 	$(INSTALL) -m 0644 -D $(@D)/libjim.a $(1)/usr/lib/libjim.a
@@ -55,6 +69,7 @@ define JIMTCL_CONFIGURE_CMDS
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		$(JIMTCL_SHARED) \
+		$(JIMTCL_CONF_OPTS) \
 	)
 endef
 

--===============1137082293879830632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1137082293879830632==--
