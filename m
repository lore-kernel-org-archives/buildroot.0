Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72936606A323
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tFCKOZw+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R5tFP/20
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5280140F92;
	Wed, 21 Oct 2026 20:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6f5cz17Mce1; Wed, 21 Oct 2026 20:34:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 65FA140F4C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614883;
	b=ko42P8x2xD+TLw1Z15LK4eXJMfu3oGp4JHKz39AehshlYQMqZm9vOEXud3j6HUGk5B64
	 ZfXTjjMY4kfAXbMp7eETZycw+YxLz9Dh5T0pdxRkdk1EoAOzMKSlOamF+cSfJLkSjfx61
	 XBQyXoqEW8sNrLDhLSl6290gr6J15wa3yAZyIDpIa1wHGFBa196bHVXoTJ2SUEe4Xb4Lr
	 flVr7KnDDSAtlRxmz9G5r/WIKbNa5yexpzXxQXCa4ikJWxKgfPkv/CaqP/jTQAUpHBxf4
	 dcG5CblQNx6cTRYaLymcwf1JE/NnwsUHw0hUCUEix5bH5Jk5lekn8QkTKqeIKyqhz2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614883;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=UHsGJtM0Y0oGt0sQayFqm6XE6AI3MiD3xF2JM/PEnIA=;
	b=dMdVMGph+YYSWqr5oux6/nlGn+6cBNLe5dsWayW+2RB1/qe1X2MNGf/ew+d3ca0qmQ4y
	 wAyOoL1BvFnxGcly6PizOb6SZ/aDqvJTCEttrrMmJ/APTAtviOSTCjr7OKfCMwmMBVIm2
	 e2wZ2hH1O3hc0Hv4IZBM4IBseetDbetIbfzSuRu65+UabIts1h/Ey9ofXFdl7H1/8wzZ9
	 bWhBrYgOXWgiDwd3+cB0QVE7U1LR28/GCyKgq2tVCP/Uy1dxKxrTGM24u07SjOglF1STK
	 2eZRUT514FXvnOoTo7YFNiSjwmdipQoPUd+MXM4foJxFd6o/GYTHp8bOjls2HavH+2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="R5tFP/20";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614883;
	bh=UHsGJtM0Y0oGt0sQayFqm6XE6AI3MiD3xF2JM/PEnIA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tFCKOZw+MvwfrGbuUT9SA8Ew2meCPf4576aSL9q2cJ3vAImoVcjZnLaci8lrQ2i9q
	 V8d71FqbJs15d6L6ZR+9XLAdAnSzV6ZnM5WPYGjF+9FIC/nh44jjSvZMvMh9y5UlWP
	 BaCpVhAyHvz1oA3zMuRQZabCeM+DfrE7B7Yz6gvLT2gITOnSEcUQNXGDjgZdvS/juX
	 aq6PqGNp8m2I4Aoh1LESoUFUeEAxiwveZJ8bbeTA1recw8whPDSpr1KcwUFOyuVMM/
	 EhqJSgbCE4I7k5DX4HIHyBfUipfuaBaVpatxHr3lbpZ78p1PtvbbsZvT8KXeaa9LnX
	 jsR3/HSjkRxLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65FA140F4C;
	Wed, 21 Oct 2026 20:34:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F1EB3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6522040F5F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rudNPzWVGnLT for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8427C40ABF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614867;
 b=NhLFcFSbS4yZYFXFI2wret5iVBDFIBkOSFvlHSPsm7K6UtZ5tIH0I/PIyIOa+KmsL3PA
 B4eb3svpZ0RNrCSdvLTyP079lqLUfrUbYuKzZ+X4RGcjH5ds6XVZ23ps0tyX3FITiKgY/
 6RVmJ2QDz883C4BarwEkI/Ss42WNkPlVhUZicAmGyTBKQNSBm70qA+0zabufaB4VJ8sqm
 n0zhBCUO4J4SCYYkhAk15VLLc5DQ3xmrArctQuZRyiTu8hZlwkCHqiv1utCeFhgCdQTtu
 cRgLDQ5mLiGw04mHmoa0xBUgbY/k3XNxDDxOoPaBCilrwV/GO/lOspocqwaBjm7Sidg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614867;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=R4cWBJfLiY79ZGe+ftaHbQM3nlpn/eHMACMAaMCTQgA=;
 b=TKYjuTo34oop0J5lc7eyubOlufePKClnxOJu/UBdzAch/v1N0ASC79/0MN/jjRF/+iTH
 jPUt/Kx57mvTjvumhGo7mJirRJNTXWKdI3aU1onoKpuRPFn5oq2+KwxTGgQ9ixQLQxDVi
 HTPz5in6cXiSGGP8tFmqOVevr0zZypQPug6VPGN5eaNqgH4ahXKKng9rxp1ZiPSCcAjFg
 +S+a4UXKs5BBFZuseBOirjd75sSO7fYFTs/uqRjW4fJ7N+yRYlGeM5XUnEWEFX8gelVM3
 O0xuO6PJoVLS6SpS6B44DK5VhfD18OGpj4wYdN7S0yvhLg8E7CXVHn9ayhhBfpNwjtQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="R5tFP/20"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=R5tFP/20
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8427C40ABF
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:27 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-5058b105df7so301520b6e.1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614866; x=1793219666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R4cWBJfLiY79ZGe+ftaHbQM3nlpn/eHMACMAaMCTQgA=;
 b=R5tFP/207zYgQI8hR+0mnPUpxYVudmpCxSEk5WNP7VOfZQ3MIX5tkwBoynZHsrxfmy
 j9xkYWpK8JRqdhO4rRUn1xduOQoV3NdXA9ZcUvdbtjDmkYzpCOn3/sGpxS5qIf72gwCR
 6793e37hzogOT1+6rQpbvI7atabSDdWoESzKJ8rT5kPoMYbpifArNW36hdBCoJt9q8CA
 ynITDN69YaRnmaS1yEoIRzaicY7ETHGb7WskCmnYMHGt7MI+9l7bxWxJTfExw1wiXeaK
 v4Lc9r24ZsYN9Q/pwzykVUkRMdJNhi/ps5SG/zlDPLRNpnp2qdKU4wzW91IspWxOhmU9
 1fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614866; x=1793219666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=R4cWBJfLiY79ZGe+ftaHbQM3nlpn/eHMACMAaMCTQgA=;
 b=xuuwZAbD8nMLNDdmjWHYqN3X+AV3MdIMRtdF1t5QsIqjNvKA22BnknrlmH0aVOcmJi
 tzTzTp0bsPKb9W11sty23ORC1M+NUgEX1+wpw70yOtDFdiv6/4yYG4Gp5Ld3R2sRNTj/
 FzvgSMt4p5Cmn7hwCfasloi08JKiIq2XZhvQHtbg5sJecCyI+TyXkqLmaFVg42/pv82u
 hngG47EJ5ULEg304/+AsjNnBFfChmsW3GcEvBtc9lOo5Yes3x499xtoUSf837Xg2Zr8v
 UuS4SiReLDRWeG33BpUmh57LIMmkytQc90hDMeklvEr+PjGXbgcMr4TVS+0Ste+untd9
 rWFQ==
X-Gm-Message-State: AFq9FYJIX4RZ29qF6Wg92w37CyyYtD7pTDzAOVirSv0nfCzm81tG+Bk2
 ecIQFriCnxMcb85Y/NpibTLrTDK8YyI5mSI4NE3bOvks2yHxgS+XxkRz7CqdKA==
X-Gm-Gg: AYBFou3QLjGB9XMrTZQhFoRj0gvF52TbzgTPrgMroKYWKZxCx1jcNYHoP8ulLbiiXS5
 LpFOitLfrwIuTz1+IH8BBrmCyVRj7INVpCRtC/VEYsUkZwUe3t66A2y7ozOYYB+DyhxYJYDJfio
 KyThrnR+UAeCQns6nmZbPcqxZtRkDkQaB2sbKAJtPbO9ikkZebaZH0BqH1hA2hWtM7pYs53wUUn
 pZ6Hm4Jjf3UKH3vP4VvmBYrwEHtaefjg1vestdcNJO843hUgCZ3cPPBxbwrC1jQKbzf4gUSKvj2
 cC9SpuUKEw/gmaMzKc719U+jFG4fZLFFVuJKTzLumBNca/1N5wT2oT3fRfw4Rgt/mB5K3nIxhpQ
 /Pnoydhftn4hrzsG6gSz8hw9snFdjCv5Yim87RJOh03hg1tBCqIVjikbdlavi/RycEQSFim6Nl8
 8teaZ2yIuVi2HF96b9VNuE9lm/5Ukbk99k/DBHO81Udehdyw4BaEb4QfbMrn5XSMmnok+ddwGnd
 v4JgzwXfEKFKRL+d8kiTLQNm+RWoKshcCwNsFI029S+kOIvmGBt8OdUOiUPMISM7jtb+hEDKHcu
 RdMNyzfkae1QeLL/0sQBRAT0LiwTYclhGQEZ5ScxJboJn1LAyzPlEexWzg7PO5oexIKg8SgzQYY
 YBQ2JN1oWGm/G0f3Qqwsoq6Man5hKk97NDGO0qwRLKuN2bW+zA87bY4pFj8CxyCxNftsjpM3EBO
 lPG8H0FvyAgMl21m8Dcgin3CY=
X-Received: by 2002:a05:6808:1984:b0:4f3:e133:c574 with SMTP id
 5614622812f47-553585760e6mr2755561b6e.19.1792614866304; 
 Wed, 21 Oct 2026 13:34:26 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:10 -0600
Message-ID: <20261021203410.3114473-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 16/16] boot/uboot: add
 host-python-pkg-resources dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Older U-Boot Binman versions import pkg_resources, which was removed
from setuptools in version 82. Add the standalone host package when
BR2_TARGET_UBOOT_USE_BINMAN is enabled to preserve support for these
versions and vendor trees.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v2 -> v3:
  - Restrict host-python-pkg-resources to BR2_TARGET_UBOOT_USE_BINMAN.

Changes v1 -> v2:
  - Tie host-python-pkg-resources to BR2_TARGET_UBOOT_NEEDS_PYTHON3
    instead of BR2_TARGET_UBOOT_USE_BINMAN.
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 99330a2f15..a7e831f6c3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -312,6 +312,7 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
+	host-python-pkg-resources \
 	host-python-pyyaml \
 	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
