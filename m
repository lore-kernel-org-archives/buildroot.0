Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E538606A32E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nPB1Jwav
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 699FD40C34;
	Fri, 30 Oct 2026 15:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omU0M0E4svQa; Fri, 30 Oct 2026 15:27:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6088740C24
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374045;
	b=hnrC65Y3qASyw9fB9xmSUcwj85tX/+EdB1vFwGY70oIq7vdAnYtmZDvA4bL09q25EFsW
	 ybRMKdWUPmo72WJelBhdRLT6zmOFJfdSMDKtfQhnb4S1nd2zm3I4SUuBbetK9cvO4weIN
	 xEahYywvjoenmXWcrt17+s+uoo5Plv5eSiQhBo/eFKW6tFCiJxXSy0LwJj6iNjaP9t4Xa
	 KWhbE3BfAhSePrK23v+XOzCEXRFFNazFfV95G2R2bl4FmnvU5Qu8PjstzUdgxvTU3+CNp
	 pO9yeaiViqv2hek5y4GSTHyVzQSztBc0/TdXU6GirbuLUd+M4QGOa7WKghDJLDxfKzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6ZHE0HeWYASsP08+r/gkF0khEwLeOgy9oy5S9Lyafnk=;
	b=D59QZZhclBI9sjyNSnyEFX09Yg2ems5LaP3nSe8/PWjqdDkW22QOZ8MJ1CwnHx/f4DD8
	 ZlOPcKI8UiiH7lVypDTHAFkxfnVS87cbsLD3pvQ+k6Yu1yPWMnQJzNB1sITHDBnmbh7To
	 bw7TQ9nX1STeeRTRnawPIFIbsqkqPrTQTUvhtOUXR0JeS/yAb8vj2Fv8jBNcz6bz9GFK6
	 mLo1WeJGGtEMiBq699O8NFixRrw4GI/82iM3mSVPAT0eAaDFrvlkFyarhTNuWYO//ppzc
	 4b84Sree8a5q0dgHq2A615mIJciJL9yEerGJ8ts5z4APFPPBpe6PvbDzAQ24TTzX8pw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374045;
	bh=6ZHE0HeWYASsP08+r/gkF0khEwLeOgy9oy5S9Lyafnk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nPB1JwavuY+N/l6wA7Manu7sznAGVRVIhKMWsB+4b8hrI8qCkSj6MTIWwAzBEqFAW
	 hBf3rveaEYoRtM1kBXUd8dmrwrOdTy1mFiu/hx1iB8azmlygoXbuZbyNlQj8hXqBfA
	 vetY/yNKLP2HjGoHbPvKoc8Zjf5BtFppG+FyxArmesQ7AZVOXs4Z/uDfWgdFAePRbB
	 vvjbs37GkJvhsqrv/rbCFqSnKxGr3VVqHTlQZbVh2X4Txuxq0v5fbPW14qT3giziqt
	 GqqhUTn+pBviSlpFbr99vvNmLXv2r03GgmFoJm9RHNj6NU8oPlfeYwG+qQbL3hAlXt
	 bMuMFuA7S/v5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6088740C24;
	Fri, 30 Oct 2026 15:27:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96D573AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AA3740C12
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4p3oTK7Lxg7N for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5963D40BD0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374025;
 b=PO6q0+DhKXPfTRf4m9j3NR/cfzCckPstARmxGmVNGrqUw2gCABwdQ7m5i79pvA5IVYRO
 YZYKwnjijM9aTdzWqpHR0NAoA2meXZlVjdVeEyVg06u7L+gRZI26LXLU3vCgdIDLVLnhi
 tSBhfTQlW5YcORtlbjHeu+NapbxXMjpWzlexvFpIgVOGRJDfga5W2CeK/xr536325K70u
 duhU5sFsHZ+/Bc5jmijpIo5/juoddgfjIOgAFeUMknLnsm6VlZkeG0pWFsGGz6B8yFdWH
 4n4gxu65N1sLPtUhV7RvqZFT0vp813epJ+RqeeFalZQlwFwbFEfHOqhbtxBOLXDZ2IA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374025;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=p1UwnX0e0swcfxqoO825fe5nt5hYoi5KuPCdEM8KI5g=;
 b=rVd7g5AxC1/zBNbHgoUmHyEpGEZOdbeksB2FdfjrC8cz3ijdLluLkoXuz9WAluOdXgdo
 fKtySXUzkbOzKHUPmorfqRfu2yOkZW5ScNiGzcGPo78lcT84BtTeGUyH2FiD89XUjtOLN
 0Af1d7ot0pnfSqWNLVLRcSYeU+vBxCHyMax0TNrylqr4eBst0KvFk0z76baVgULJ6MGop
 VBZCf77t9X6Fuzi47nBcZTfUcYBo57z8+KCdwmJuXpZuKRXjUL6Jp3LsPWai3hLifEbiE
 qfYcDF1QDgFfhbUgU3T4SMY8LcH9Kzg54N8+FKqU4CpcdVic80dLjCi55KNvd/VIrbA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TonQZlN2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5963D40BD0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso791711f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374023; x=1793978823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=p1UwnX0e0swcfxqoO825fe5nt5hYoi5KuPCdEM8KI5g=;
 b=dtxvpjzV+D37r0n9IwMOrtIYaYr8lyjQ6VTfvK/EuQnYVnUtR5+0DxqJ8pVQI5BPe4
 jCzv+dJ5bJ6Euufm1s+beUkiCw3m1SPOAQOLmCIOBQtBiIzxCk4CWiuorSsQc4SdE59a
 /WmMFnXy0p+/MfivOc05Y+al6Musbq5S96C9LUksE1BlPSrLiQQS2k+3G9PPycIoIdx/
 xQctpmcbidyCJR2tyNZC/U3f0YIOqJGTNSRNvQmt39WeVMbhc5QnSosaMq5GkK9AiHE8
 xuZ3WKXf3bi1ZnL9zFB70hj3OmBWuOoGGAEG9geaha8ZMkGHFUA/du5Z94/OV7zk1LFm
 tUmA==
X-Gm-Message-State: AFq9FYICsWcjX62krZhOKNMSr+JrbFcJKT3ssrBfGzvtMo0DUObmiV7n
 MRPgeMUNKSu+SpXgQB3f1TK4O25xhklQWdqLE0TkFfXKLY5sK47mM25+aqPZLBCmyHaYadknaZE
 sXej/IIU=
X-Gm-Gg: AYBFou1Lxw8dPC8Ytj3jqLjLyDujWRetsP24295LOLcphsZQ6TedHgsb2X0HBJhcKW1
 CgDUxTP2qgty5zKQLjPKN9L3ozr8LMsmjj2YGzJ9U9TZgR4bUYrQLLQqfBgYIOsSDJMkyNy/ahe
 RoskwrQYe+D28srU4qkYOVYSw0Uh4mv5hDLoGz6XcKRyWkoM0LGCyjyQNzCQzQr1iXU4Pl3M59q
 XYlQFYXWKErhfFJpCa89Z8wxGfeAx9KnJHEG3/HThBj5lNyFUazOg4YIIIDwhncg9qgfr1STW0z
 1eA8eWC3szp6trC5PSdmfJoZHaTWbLkoxc/a3p7HKV3SWmJBRj5WWXrlO5VlVEX70r73ee10c9C
 GhUyXdYJd0yJ+bTyRTY1O6PhnINAXcMlXiTpZbpLeSZYdxKlOkOhcb54bFdmf8406MNdX0BCLwg
 BGzNYFyd+HE4nDWVSTqT5NOMe2phoYPwmiKSqXI5AD+0yjrrNVdLdrTj3fGLx4TnIXj5z3qz3vr
 ptHuENyU6q81HXiBxF2K2ElHLdFW8xEaNqLauLa8R6mUeYKWdnEgVl9ftrsjvl0MraKDgDy4niR
 warD+Rey/6Z1MMNNS68iuDhTXCE3PVDg+G9Ux8Cm+jPeq9cP1a8saoEjE6920AhHAXg/VXLt
X-Received: by 2002:a05:6000:29cf:b0:48c:4a62:9af7 with SMTP id
 ffacd0b85a97d-48e6e50090bmr3958155f8f.28.1793374023000; 
 Fri, 30 Oct 2026 08:27:03 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b79059sm4009355f8f.30.2026.10.30.08.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:02 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:59 +0100
Message-ID: <20261030152701.1906509-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019212832.97456-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://github.com/strukturag/libheif/releases/tag/v1.23.6
> 
> Fixes the following CVEs:
> 
> (CVE numbers will be added when assigned.)
> 
> CVE-2026-XXXXX (GHSA-h4h8-qgvc-m7r2)
> CVE-2026-XXXXX (GHSA-fcmw-5764-7rq8)
> CVE-2026-XXXXX (GHSA-6fqc-p7r8-2g36)
> CVE-2026-XXXXX (GHSA-q7mw-2fmm-5q94)
> CVE-2026-XXXXX (GHSA-vv35-6hxg-95x8)
> CVE-2026-XXXXX (GHSA-8p2c-9wv4-rx4p)
> CVE-2026-XXXXX (GHSA-86ch-j429-fpr2)
> CVE-2026-XXXXX (GHSA-3gwx-cjv4-jr74)
> GHSA-hqpw-h8p6-22q9
> GHSA-hvwh-xpj6-ph5x
> GHSA-v5rj-g4wv-j5w3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/4bfdf5e1cd6169d20971e8bd1f9731b85e65e9f5
> 
>  package/libheif/libheif.hash | 4 ++--
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index 30265f4aab..44e9c54781 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
> -sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
> +# From https://github.com/strukturag/libheif/releases/tag/v1.23.6
> +sha256  4484346dc5995319dbc11e3a1c35d0a2ec46511ce370900869337fd2c7033125  libheif-1.23.6.tar.gz
>  # Locally computed:
>  sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index cd171b9637..179c952566 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.23.5
> +LIBHEIF_VERSION = 1.23.6
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
