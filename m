Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037E606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HYsY16qB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C22606A8;
	Fri, 20 Nov 2026 10:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SuXwmEixXnD; Fri, 20 Nov 2026 10:01:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 25C3660D8E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168888;
	b=BW23wohtxLhFcG7BRz2lWmhEBkFFfKf5/tUP4CdTjIw4Pu6AFyrnld/egtd6AeDsZqMg
	 MDC5lf8hppWsBUIatwa/g6osmHJLkAT3Lx7mMPnWsr6WLhep2bMA/+FpdRAKDAxxaNXLH
	 BSDJAh6hsbDx+OuGKEGGJxq486+GJjBCNRpyCLJ0RzahCYEPTMwE3NzSju5FByzoZmI8g
	 H/066yepGgwfR3KNQysw55DcHL27PUbsmj0V1Pn8j+lNdsrEctEUIY8YvE9IXCw9hapKB
	 pV3FwZ4sttUgmF4UHbqv5CgxAG0CJNAYmvoLNoIz3JSQc7xPGOqLgfanfnKXbGCEI0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3AXf7n2AxEhIUzsNSeQWzslHf8qgvmcSAC1t8kmgvq4=;
	b=tc2HO9JD2WBSgJXUcxWOeINb0Rk4m4bsLnFu7pAVRxa+ANbGqaBZDZ/XMNwUGSo66RyV
	 iv/+5wks3jUDblIJOPKJjP19SXIjKLzLxZXnMXcSodx+14CvFRdkeXksusFoUeZtyq7bI
	 KoU261x19es+ftUBEEQ/LtkQ3G3B1Ayf8C3EAX8F9rn6SXQ+8tabAn4Ecxd0b85INXE/S
	 eSsZdvshkRcxpgCtphm/z9l+xK1LLVpArIhqSVBvRsQozyJlF2vE+ZoBe5qmZsmj+GCMZ
	 AiXJLjFLdr9lqXHQKs/05d30CNtpLudjM+OZX8MDcA7aQBNsXZLyAAelahHQnc7CWtw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168888;
	bh=3AXf7n2AxEhIUzsNSeQWzslHf8qgvmcSAC1t8kmgvq4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HYsY16qBFL653CSol3a4NNbe9IVaCkTymBPNA5y8SlKu9J0X06ZhRbFXb9COeH2a4
	 C/RdNjydqKiKwsYNpLwBKo7GlkY55BDODMf2R0LBK8JVCBaeYwkaCgzXRiJgkmr7Bh
	 R5mQHUgxnEdmTkinlTcDoBtJv+WVRb1uPVbJbqrUhsoAOdj5K0PFC7dHV60ZbdJ7oM
	 zTWxu2URNGE3VPLtDOO+K1T7GilBs8EjW+QSzctvFJaRLftlerRH0kLaL/3ykOsYkN
	 +7cTOnoBkznX/F/xshbZXrNhXR6lcQxeNzha21d3aCI2badUO6n1rCz7CbYwl7g8sL
	 jBMao3XOmayKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25C3660D8E;
	Fri, 20 Nov 2026 10:01:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0BD6E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 928CB60D8E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNMM92wFb_mN for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5455B606A8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5455B606A8
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:24 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4bb606491faso3346765e9.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168883; x=1795773683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=//LYcheSY60Q7tX9CoflS3wW1le3RQ5IIggVCN+fvdE=;
 b=UAJxM6mOD3GbgoNz6EiUt+2SOwf1oK+RglTLjxDBaAkSbKy4ovR0p6OKpzgEg3xl4w
 t09LuVkH2783ymdaImsbIOe+0cfJ/2xEWprQvwi61grjHhLQZ698t7jwdUp8eEZD/8sx
 AlM4tVAxOX/DD1tGpJ9n1xWKkAczPDWI0cK20RbEdqLJRaI2ljVixL5jb3pjc6vhll3O
 XpemrcWNcEmCEz+tOmr/KopaWvYzL4s+CW4nyiTMx9Kbw2OWc2U+SkVhFvio/ChqZHdW
 TskqTnmeBTghAq3WeiplzCjsiWw5w9yb5VJWk3KUDFmpdd7p2dNwB5Oy14mYSnlQUTTM
 fxNw==
X-Gm-Message-State: APuU4Z/PaGUS5aV17KdoHBldlEE5sxAR33MkWyP4mxXkhNmGpTqTWLti
 whTw3Nlli3qbO9dWRVI3gn7aMoVRbrw1/CRWSEd6ojuSHNdkqJMMZ6kAmYYWpb6RmHwjUehyi91
 LgwA7JkEizg==
X-Gm-Gg: AYBFou0ZQaOYQn2SLvv21zspLO/H2kGsW9CkVOopn8qxfRwJqun2bYuKgNCJdZ5IzBW
 jVEpY9eHOBjv2m6XNlIraMmRAT978zu1qMpX42H4sZB495MgZg/Dgk+3ef3ywMfQoDEQrDmu02X
 REv+HTPEkpfOxpAjmrCQlEht52ogJRViUmQE9oU8FEQUEdAZFMpvE9v6ANYC5Q5tKSKebhW+Y4A
 OEnwCb1SgDcjmWOPiicvcmOXge0W0hUEGUilW/M+N8eIse+72xHVecdVLWH0bhm9Pr2BJb+eyVm
 tv6gGsM54dhwd+v4dNICa7sjNhu6nA+odD5uQhMXl78Ndy/L+Hm/xY0Bnmv47se9FaXjI0oDDv3
 bu9XNohthwZTe8RbSm75HkweQ7Uf5RmWhnHKOgBTMGZF1HH1tEY21vGOn6toOE8StqAoGGIESaw
 Ps6wLTnh2wp3lKGFZrGxsc2HZ064/4cjXFNK9uROCd/iyheECp50sMHzpLeEQrkiraB2o0U4R+r
 n1Sp4GJyVoxrvQJExgGM6sowhbdURid/kJeBerU6yiW4oIlu2GGtTKvMEl3dhBA0wKPlSFcmAq+
 ft2jqay4jgvLhMd6BLV4EIs178OwWV1FDIFoPotBMYa2
X-Received: by 2002:a05:600c:1d08:b0:4a2:392:9de2 with SMTP id
 5b1f17b1804b1-4bb8882bd7bmr52341305e9.28.1795168883235; 
 Fri, 20 Nov 2026 02:01:23 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884911e3sm83861695e9.6.2026.11.20.02.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:01:22 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:01:20 +0100
Message-ID: <20261120100122.542931-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116143116.967132-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/dpdk: security bump to
 version 24.11.8
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> This is an LTS release for DPDK.
> 
> See the release note of the new versions:
>  - 24.11.8 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id24
>  - 24.11.7 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id20
>  - 24.11.6 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id17
>  - 24.11.5 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id14
>  - 24.11.4 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id9
>  - 24.11.3 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id5
>  - 24.11.2 https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id1
> 
> Fixes the following CVEs:
>  - gso: fix overflow when writing to very small buffers (CVE-2026-100236)
>  - vhost: check number of queues for VDPA (CVE-2026-86856)
>  - vhost/crypto: catch incorrect request length (CVE-2026-86849)
>  - vhost/crypto: drop crypto session cache (CVE-2026-86845)
>  - vhost/crypto: fix TOCTOU OOB write in finalize path (CVE-2026-86846, CVE-2026-86848)
>  - vhost/crypto: fix write back chains termination (CVE-2026-86847)
>  - vhost: fix double-fetch vulnerability in control queue (CVE-2026-86562)
>  - vhost: fix header copy to multiple descriptors (CVE-2026-86566)
>  - vhost: fix indirect descriptor table double fetch (CVE-2026-93683)
>  - vhost: fix inflight descriptor table overflow (CVE-2026-86565)
>  - vhost: fix log base address mapping offset (CVE-2026-86563)
>  - vhost: fix missing memory size validation before mmap (CVE-2026-86561)
>  - vhost: fix out-of-bounds read in control virtqueue handler (CVE-2026-86562)
>  - vhost: fix VDUSE stale vring pointers after IOTLB invalidation (CVE-2026-86567)
> 
> The license was updated with upstream commit [1].
> 
> [1] https://github.com/DPDK/dpdk/commit/a048f51065d0db7aaf54f151f40796ede18195e0
> 
> (alternative to commit 3c1cb086df0e0a174b6e140f586262a93a0fe7a4)
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/dpdk/dpdk.hash | 4 ++--
>  package/dpdk/dpdk.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
> index e9a22736b0..1201ba45d2 100644
> --- a/package/dpdk/dpdk.hash
> +++ b/package/dpdk/dpdk.hash
> @@ -1,6 +1,6 @@
>  # Locally computed
> -sha256  bcae7d42c449fc456dfb279feabcbe0599a29bebb2fe2905761e187339d96b8e  dpdk-24.11.1.tar.xz
> +sha256  f3dbfac841b2db8e53a97d68a5e14ebc943327a955f0afb97f8c14f544fbc4aa  dpdk-24.11.8.tar.xz
>  sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
> -sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
> +sha256  6be99eb90a152a920c0dd9fe6b8dfb5bfd55fdd0a5fe554ed4adb78cdeaef0b7  license/exceptions.txt
>  sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
>  sha256  cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab  license/README
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> index a422cdde06..bca3a2ff39 100644
> --- a/package/dpdk/dpdk.mk
> +++ b/package/dpdk/dpdk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DPDK_VERSION = 24.11.1
> +DPDK_VERSION = 24.11.8
>  DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
>  DPDK_SITE = https://fast.dpdk.org/rel
>  DPDK_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
