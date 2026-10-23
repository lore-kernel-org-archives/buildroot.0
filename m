Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE872606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CEA22VZh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9F5B40985;
	Fri, 23 Oct 2026 13:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oXVYdeTtCHB; Fri, 23 Oct 2026 13:20:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C5A8F4094C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761599;
	b=mUcWZbRgabXBtk8SF29m2BAUzmyiccFqIhe4EKJU2JAGzAR4F91A3cPOYNOb+V5MgQKB
	 vJfpLeiWEDi+TR0CfG/BYIwSKugQe8RXycwgy2CZ/o3sQI+r1kJ9bI5VCKMNzlKDBx3+I
	 rBui6THK58zZXcRgP0q8b9O6GiE4dewrHSWZfT2bVn+NDWO6iyFsXDq4VkM4s105SeIiq
	 34huI/vGLY9SQBug1zryPaDKdmvpApPNUyvTm2jx4+cHf46ebIyunWLR+Qf48S8QIV51n
	 5+eQZDmhrdYIw422BPcUXj6x0Mz3rsKDc7kchaJ7fywL5F1qlXXm376kaBrtnWGAN+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761599;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dD8Ad6LrtadK2jivN++Ua+wx3+e8Kj/QzuYVeQO203U=;
	b=fj18b1ddEcI8FHNUYqlDW9xv0qSVBsC0ygdAgX1r0tH/3zUH/4mEk0JjZ89umdNkXT22
	 JbRK3XBE2SvE+RILfzLGUbQY6Qrm2fgY2D8B5T1ZCJI6WSIbMW6Rm30j+W3RvI+yR7+w9
	 7aebaSpQ9JMnM3Br8eyCPPTCkBubk6HkQKxpQp77Sd+YnNHBTFuq6aLyHeEDulxoSoymy
	 0lYToM4At+TYo5+XwWvG+M1PWPU+SAF9ewkvT9MXioK1xl4qJe7/A5R/rdgoCpH5r7F4e
	 RkX5/WvLVGrVaoyRIvvsUFxqDRkZ+s5pyxN7aO89PGAoERx/k9KAU4DOXw3rmTqL+9A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761599;
	bh=dD8Ad6LrtadK2jivN++Ua+wx3+e8Kj/QzuYVeQO203U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CEA22VZhswGgfiSzK/bFMekpSrpzLxTwp8Ci8cyC/+pmEjo/YeNVDSx5QVLE1LBC/
	 tjsUYuspeb4/8ht+yMvBBN3Ewv4E5IncrsVHQWbMnapFclBYBP1Zhs0fdUXKZk9VnV
	 OICR+qMQX1vFt4mucvqxQ4bFAVCe1oZDb3Zuf2YlycZemDCrxDcdcC16QEI4nA0CmZ
	 P1yF7u5VQaB+JEGDf5rS/nErL+EU4GEO9HQQORcUSTfsUd/om3CwgM6UqXwkNnyD8z
	 QLANgt9yDIRAPqfQQEgRbTCmGyd5LMtHsxBPEScgZLi4JhUCjlSj7mxknmrZcniNyf
	 1D+EhUe5X8blg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A8F4094C;
	Fri, 23 Oct 2026 13:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 935853C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 848BE814A0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7rfvXwdkXLL for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:19:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 45BFC8148F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761594;
 b=AuLwfsjfT71Y4Jcv2ThJFG38ZZdgB4Z9UN38YM9wFOd8UQXPLzHmXPu6YEf47srVj9si
 9SDK7xw6W7K8EWkUXANU9rfFoxs7bpkLdSFUp1bXuDmB4ktKV6+sp2gtXmiXXbe6PAkRv
 6MIiQtwa8L3eVxVWXXM8WNvOCepAX8besCHJHUGP1JbS+TsCtb2K0NGqmrrZu5jhhULfv
 ZrrB79GK8JmJ6YtpqBKLVF/YRYirAPhr7I2M4FJ7ICSyVtRGnfn+rebacvfp7WREr8pgI
 Haz/5j0n2rLhDGnDA5Kz2so5VMWtpcCOq44m1Q399Z4usIjX9jkew7gDp4GQ3dDUDRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761594;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=C0+iYkiiIxZrnsTnv0pPIxIK6laUTxK2YzQl6zcfYxc=;
 b=saYtvDaAZrajvyW7VnkaJLxIb6zDOt1OHhw4acmOVmpLdXeQ4oJjExbWix3GpcDfUAhK
 lLzmwyel8hI+lNHn6b55RT7KPzD3DXKnbI/b5GoBD2MarvbJjVonk28/nm9cMJLpRp7dG
 CWMoyhYB1/4N5lnXdr4BtU5RZwD2flpIW6EHdeJgGVdZPJmQazFqKYjW/EnkXrG3OdO4Z
 0ie8JY30Bm/RuqGb9c4IDmzZzc67Gx4ffMb16lC2eHKhjfFpjy4TT3HIQXzP+fV8ol8wE
 pk/vo8xhqzQDMfUhSYc630pMeBIjulUyrohKWSQGeDsdkbewzKknSceMbQ2iUJU7Skg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=arO0gEwr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45BFC8148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:53 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so589275f8f.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761592; x=1793366392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=C0+iYkiiIxZrnsTnv0pPIxIK6laUTxK2YzQl6zcfYxc=;
 b=NIabHpAujgqVZmff0kbstYpkZiIBISZAGKvPDWfMF+yqEuqeQxpC0mIkjqv/kfg/81
 dFGXGHaIJEookZnEEYX0If5Kl2ozGtVD0jDh6YH6TOS2c/VKmY0/ax5PdGjjDVs0NgG5
 UrLVWllc55C7Ic22DTpwvtOnBqmJ9RebO4F6UyN3CJ/TF5JQKPKaX/zWzyy/RyCZNj0i
 umBCDNtZ2DDrIyevlyr5FavKRAlhIkTzo1p+cJ5w8IaLIdJK55efrUjmJCYyx9HcD9Fg
 26yjGMfrtSWPmS4ILGl9UxKJDC5tyj209OsWqvUU219TQabVWzbhwfNcCnB0IgOg7cTa
 9sFQ==
X-Gm-Message-State: AFq9FYJgRtdBiEN5mIOE2uyOxnPG1j8D92u19hpVpExotbJ2WP6m2fcA
 Veqx1xJuptA7Q/a8kXjEn0cPwn3pLYDTlWYXbS+3WRtnvA1mxJzwt5DHXgx/qOaxRY/lRviL1dV
 XewRh5cU=
X-Gm-Gg: AYBFou2ODoVb67bcgiDRC3mlaqLuSIMCGu/XeCIkF6oRYbdksgSjNSTPuY5gdJByDGS
 2NPyKN9kjyb/IpQ1keBtJD3Xj9p7HQLVz6Gx7O+w/O0i5bp6mEMwuLIkzoA0h8vzArxJRepVR32
 yAaIetj6xsApnUQLItflVFrPX/L8RY142U5CqGSR9hZs1xJ0otcjRaSzgjSRMnmpZRXuSx8jiaV
 iB42nEAwgFkyDsW0DXc0X7Xp4rJrpldCDgZPAkUIBagrVGEpPjSZHKH/p8Qk5OzumjNgKRXeHgr
 SP/2OS4karm/Wmstk+S/8qv9LVeuqQbgOw8ZbPYNHF+bfv2w0CERaZFJeNUHNVh6WYZpSKgEK9h
 BBZxGdQ8+DgRoCyCxx6ZRbfmtHuJCxs19jCQyjPwFVmJ4PflVPY7ptLEblaBXkRJjmdMyAAtqJL
 dDDYHOF6VQhlejOsni11IydjkGmcDslURX6qx48lLpPtWGWqrxiE1+G1ZkhCWpAssU40PUvaDY0
 g4eHDV/VjRFuO+XtgvPpe1c9zBEEWexex9Kf+HrKXG1Wp9K1ZRQEHwQ7oDRURs9LkypjUgoHqu3
 Ng0=
X-Received: by 2002:a05:6000:18a6:b0:48d:faf4:54a8 with SMTP id
 ffacd0b85a97d-48e385cd509mr2775016f8f.11.1792761591691; 
 Fri, 23 Oct 2026 06:19:51 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38025da3sm5351624f8f.19.2026.10.23.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:19:51 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:19:48 +0200
Message-ID: <20261023131950.1606453-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014065829.22477-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libzlib: upstream patch for
 CVE-2026-85091
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
> This fixes the following vulnerability:
> 
> - CVE-2026-85091:
>     zlib versions 1.3.1.2 through 1.3.2 contain a heap buffer overflow
>     vulnerability in the gz_vacate() function when processing non-blocking
>     gzwrite() operations with stale external buffer pointers. Attackers
>     can trigger the overflow by calling gzprintf() or gzvprintf() after a
>     write stall, causing an unchecked memmove() to write beyond the
>     internal input buffer boundary.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-85091
>  - https://security-tracker.debian.org/tracker/CVE-2026-85091
>  - https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...overflow-bug-in-non-blocking-gzwrite.patch | 31 +++++++++++++++++++
>  package/libzlib/libzlib.mk                    |  2 ++
>  2 files changed, 33 insertions(+)
>  create mode 100644 package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
> 
> diff --git a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
> new file mode 100644
> index 0000000000..32aaabcc76
> --- /dev/null
> +++ b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
> @@ -0,0 +1,31 @@
> +From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
> +From: Mark Adler <git@madler.net>
> +Date: Wed, 16 Sep 2026 16:26:14 -0700
> +Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
> +
> +This addresses CVE-2026-85091.
> +
> +Upstream: https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
> +CVE: CVE-2026-85091
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + gzwrite.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/gzwrite.c b/gzwrite.c
> +index b217b85ce..512329244 100644
> +--- a/gzwrite.c
> ++++ b/gzwrite.c
> +@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
> +             n -= state->strm.avail_in;
> +             state->x.pos += n;
> +             len -= n;
> +-            if (ret == -1)
> ++            if (ret == -1) {
> ++                state->strm.avail_in = 0;
> ++                state->strm.next_in = state->in;
> +                 return state->again ? put - len : 0;
> ++            }
> +         } while (len);
> +     }
> + 
> diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
> index d71d5d5233..9ce08d7093 100644
> --- a/package/libzlib/libzlib.mk
> +++ b/package/libzlib/libzlib.mk
> @@ -15,6 +15,8 @@ LIBZLIB_PROVIDES = zlib
>  LIBZLIB_CPE_ID_VENDOR = zlib
>  LIBZLIB_CPE_ID_PRODUCT = zlib
>  
> +LIBZLIB_IGNORE_CVES += CVE-2026-85091
> +
>  # It is not possible to build only a shared version of zlib, so we build both
>  # shared and static, unless we only want the static libs, and we eventually
>  # selectively remove what we do not want
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
