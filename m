Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603C1606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bs9Gv3OE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C89481E86;
	Fri,  6 Nov 2026 16:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJAfVie1y2-Y; Fri,  6 Nov 2026 16:11:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 438FC81E82
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981476;
	b=Ysurv7wLHjK6tb8EN/DEOwW8YFrcyuaCo+6ITwbiHGueUqQvy9t05nWDdhfxx+JA5JQv
	 0KXwJRJmna6qd7S25KqRZfkdR9apq2IKxZstUkoEVL4TKT6qUZTiLeKX2IhuCMvlUBEnm
	 yPd1fbAcghipGmS9cJukJuasbU0Qa2n+nKr5SZTEAkwRnAOUaTyWhylq9Z5SBdWhP5sno
	 uRFgKsKa7q1ai4ziTotKBowA3XT2n9AftXnaUgh0G/CmmAaNSZN2wlnc3MkQH7k11owpa
	 h5w90RkJyf2/R7E53PHofqOUwCYdwEzJSsrJnmsziXRQx6CKFrWJQf6nHq8G6U+BBZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981476;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y5dE2hVuRVXHs5WYfOE1LpQgcOJXz6zeR7diIlYIojs=;
	b=KiuUNQ/6Z8QfPTTd4BLPM+BJJV5SR9xB6oeGLSPjeIMw0gdfax42BIL4cu3jLaMUpgVW
	 JwMXUCoyetc/HT8ieCUiDPqFqzWhfiLLrt6Gud1N0oCVUbAboX1APtc9ovBsQPADr0Zzz
	 PkjVvCrY+etG3GmEByM1ZCrN78kPVwQGNZjycGKPbDTzvK79qMUfIAuVRU7uJonyc0ur2
	 nPaybi2Fus161AoT9KmWdb5onq9piWuSKQRykNJ364M2Lg7uLxCJPVGI7tIOL9yUvkTwR
	 DnQzxyQxBf5Ers18/kzAoyzhRAEbLeBrlYm7yWQgH4VydKF9XDbfcSfLT67xn+CRCIw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981476;
	bh=y5dE2hVuRVXHs5WYfOE1LpQgcOJXz6zeR7diIlYIojs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bs9Gv3OE2HA/l5P/8gKy3SGFWI9pSifo6M14uCqyAaodNRNL/ApnCNbuJWBJl9m17
	 1w9UxVMy785B/GXbIS2uH2ikXSUo3mbetoTDOI3+shG8iIHKK5xHuArLM5E3NibbOx
	 Wct23X0ezcN47vsZiac+dGpbyKB0535/dX0myIhPPtX3Izjag3dH0SPA7Aj28jFKcq
	 wmignbhuMnkhwV4gNiAwDAbSCbkP/qeJKv5qnQxQro56lsCyDA8goJwj6g1kw9pOjL
	 +q8YephRc491McFCyYi1qXRRwi2moQZ6gy87Guujv3J/BXQDJpRp41ijdtDNJmi3hQ
	 5HdGNbnfyjZyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 438FC81E82;
	Fri,  6 Nov 2026 16:11:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D83972E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9FB760AC0
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWlHGftjg929 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 96D7060AD2
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96D7060AD2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso8985395e9.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981470; x=1794586270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Le+VQNAfD40DAYtPZuGnUBWyCh51v6cqUGOxhOtgpak=;
 b=DKbvh9pqIo4AL8LPtIKLsrrLTSN945WEJf2udpewcnBO5DdFTOwQaLoSWbvK8OoYfl
 nxAx8/asuE8yBP9XCA7/lsXKutQ/HOaGyHQMWKU9bJ3ZlwYGlkS1dz0hboQbNs6jn9hL
 pf2U9eJ5MHQwDQrirc+2v0U7vE2maPhOqFyu1hi12DhvX/LWTFV7Y31lfhRUn7C3wC+D
 4aI4ZxVlzdL7HbgcKw0eShCRnwhBSyieSpYciLpAGz/UdFSdcNey6UCMnQGrSRCz75MO
 SWVR5N00mNMMvJZVBQA/F84Cb4gv7IoQ3b3nXoVsE/hiXilSa4T5ZrEGnvecq16Nj3lt
 m6FQ==
X-Gm-Message-State: APuU4Z9ljnw3M+wpAu4750+B/VPMoY72ZTiOudTdgy5qRc6mVtuH1x5Y
 KfdPdmzJeJeF6mlxA+ul5T3KFDSrLwoedw5mVa6IrL8FW9YWO903FlR9K5tMRv1BqJV7fYqHJyt
 kuy++L5c=
X-Gm-Gg: AYBFou0FA07X52G2+XygDvhIQEWB2edzufkf40W3+HsfohsGMPYVis3Ht9wIqKp2aP6
 hNL82Wy904bEFUD25s24lxDsK8orP6Pql7JwA8cuepmJWhzNx34xKmmxjGJNV6AmKvNoVvGY/Cv
 Qzt7x5GpZPI2HiI0xYMsYYkucvHCoGhBop+gpArAH8zAHm/PkwxKn/e+ojHTdb3ekX3aRci9Jou
 E67/4/v5eBLw75PaVfXskbBE98ajUTVUWzkwmcSLvgptMJwkYoX9S5OH9MFTavUg1EThWtzqBmB
 GuJiKmk8mULF7VfjtlM1kxjtm4NJTVWNqbwTeHjHGkjviXZUVDsBpehTxsWn9b/5R0rxO5Pn386
 KBIxLgGLeE1v1F/T7RxiDLRcZFTmT46x9+ZT+OmEhqUZJkCjZ6+tG1npV6/olKvFZ9T7wqt4mDh
 KtJMEWQILXX+tQyBZKYRz6LO2ByAWY5m0F5B2I3ydLYPjb6NFK/p2PZWf1nTA2Q1veUVh+jCehe
 tL5IMSOS5mgL1jAvEW+wJpbQ71mG5/ZfCmitYdITw45H2ObNhvTFUfpMX3WWLiCQfEUEjEbb28I
 CykALQ3yKGnYO6erT6GdxQGJEQZmC3JVbOg2BoqYS/wXRE9bsaVf
X-Received: by 2002:a05:600c:4443:b0:4b6:b2cf:3088 with SMTP id
 5b1f17b1804b1-4b6ddcf59abmr55985045e9.14.1793981470346; 
 Fri, 06 Nov 2026 08:11:10 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b571f46538sm142153125e9.5.2026.11.06.08.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:09 -0800 (PST)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:07 +0100
Message-ID: <20261106161108.607961-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031174249.2698980-2-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-oauthlib: security bump to
 version 4.0.1
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
> Fixes CVE-2026-49272: missing device code validation could allow a
> client to obtain a bearer token with an invalid device code.
> 
> https://github.com/oauthlib/oauthlib/security/advisories/GHSA-3jp2-3mrg-2vxc
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/python-oauthlib/python-oauthlib.hash | 4 ++--
>  package/python-oauthlib/python-oauthlib.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
> index 5540760118..e001a8baa7 100644
> --- a/package/python-oauthlib/python-oauthlib.hash
> +++ b/package/python-oauthlib/python-oauthlib.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/oauthlib/json
> -md5  f1eb96f8a4257d715ec8af21a217a0c8  oauthlib-4.0.0.tar.gz
> -sha256  efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86  oauthlib-4.0.0.tar.gz
> +md5  52700d6336f3766bd05d98b3696bec88  oauthlib-4.0.1.tar.gz
> +sha256  3d73febdb6faa00f277c81fb04be7b7586fb96fc3b7f0b9c772dada69a25ede7  oauthlib-4.0.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  0028aa4763a8a0b09ca4c68d585263474cf9aaa6ec69ffbef3a31a9eccdd3b91  LICENSE
> diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
> index d001fcd071..7a2e66c22e 100644
> --- a/package/python-oauthlib/python-oauthlib.mk
> +++ b/package/python-oauthlib/python-oauthlib.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_OAUTHLIB_VERSION = 4.0.0
> +PYTHON_OAUTHLIB_VERSION = 4.0.1
>  PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
> -PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/7a/d8/a1bcc8ba112a627f8ffbdc212a78ce18d3ac07e91a5ca65d27918eee25a1
> +PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/33/17/2bb072de0b990303c985f26869fd47bb179024a051f47e7f9d208eb92f8e
>  PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
>  PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
>  PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
