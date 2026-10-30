Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DBB606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aqEtbalV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D9E58176A;
	Fri, 30 Oct 2026 15:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwbqZ_pM4tVi; Fri, 30 Oct 2026 15:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8A0A981773
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374472;
	b=aO04+Az9JLbtsWW6M4A4IbiC1RmhnYEeM/D+lxdXXiqNae9pw+DsPhAvIJOrNjUF/w89
	 UU2EagqUhNkCcqo63Zkg8JXAqWXgRWAI/MPaezFqyg+tgJCk/Fh1Gqefe1R31upW9wkF5
	 A9RwkcSK05RAAzJn0f+Uax7FwbWF/wdypWVTUvBDFxJlBzTjWmdIhySpriiWHrKgGmDSi
	 fKJy20bysU25V4mPuk/TKtfr6unP16JV4bkJJIZAgVQLIcDFQ1z9f2NAv8tT/gDExLr0J
	 DMArf/ytqXosJUFlQHMnQERXEy5lgTX0Ya1ovmuBLwjwBprKzwRqdmEeL0BFwoX7eiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BMgb0v/qEgPy6RVmDw+BMKitQy7gc8KIUbJP0b4d/ZY=;
	b=aXVG+1ODu547uyRxjdkZjgjkdMBz5+SU626bqOH4nKn2vm6Z4gPeUOQFNMjdjkrePLk+
	 3ikvtxt+cI9AIQhTJ7KJagIYuHTLrxIFRlZazfBT+5c4/+/+/f4Uu3C8cGv4M/ujdtaLJ
	 Q3UFYvMux4TrRL34Ok3B9ako9WRbCxvLq/SxyxcZTCXn2P2yk3T7gAix79u3gOFnOVM5/
	 QiRVhXEMawLmCcjhIQwfZH7kBMPCONKlASQ20O9WzKBC072tqMoy+7ESwmknzSGfaZPuQ
	 ngMe9HEGCwsuZYKDxBIxBfN6sd2oJNChF8r97BaXyJwZkRTYS6GNnhzlZ4Wp+7SqtWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374472;
	bh=BMgb0v/qEgPy6RVmDw+BMKitQy7gc8KIUbJP0b4d/ZY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aqEtbalV19mpZ8rUPC/dWFZl5DIrEv10IfjboNuNXLtbeb/YkgM+NbDATsBP1T2TN
	 0U1qAyOYe2rM2j64Cyrv0a4l16kCI9cf7VW2hTqZ0N6OLhe9NoLBXGG/jjeasXVse3
	 9eozCJt2iwK7ja6q90PRwcSu4nQCAltnmi9qwT6XuW5vbbtKhmxjwVmeYmZXrEDLbo
	 r1KgbRFlcKvib8PDR0HARUOgYhmFRMzsDCRmP1AXDABA9nDSyTbd1ISqxSPJrXsCKz
	 HOgUZS2982AGjMs9V1byaD9/xawultgeoK9YRyQu66haZNKLn0GvxP16PPliKt7F0b
	 6YqtN4WUu/Kpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A0A981773;
	Fri, 30 Oct 2026 15:34:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AF95D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3840381773
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6CX7Epl9LRc for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:34:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 271CE8176A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374470;
 b=UjhqUH2YoAlBP18G0MabjPCTzwRX1yLao7ZwscG5u96YSTHxj6ifzq7lvXgxK9DEScER
 fST4Vgd5SjbJ8A52K0PB14ITEQVeZKhY47i1ILCdR1T4WkTrtWUBvOoV6PtXL/0wbH+fG
 lAT4NnU4O0t54lTrRgSsRxLMeL/k9lPw2aWdNHtBNXIr5EYGINl3HEaxO+cFpvXJmh4N7
 6waZFaRX62J/Q59zpk0p8Go0O1oeGqy5VHNsxjXqTSP3XA3P/Y0MXdTqT5eQ1LmoUQlyb
 HRui7pA5cgCtgWq7rpvYRUfxYEfQUue1vdxFmfsPd5ySjm5jgZL7JdWarAW/DS+5Q3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374470;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=4k7Iz4jmfiEHWnSd7W9eXMhOXqciZnd2V0rcDPKldkg=;
 b=YbcTd2IL6VHTP0rkGUBQE4C9JhgXJrY+awUqmPBZGAKPbY2PZCBWb7HCK8MoTXsk7LYA
 ofzHM7CDyQoQ754UOMzIRg/X1s1TBlQtXNPdQXH8BtsaWpk9euaNsq71W6fa7KXzB1gJo
 YyJ8ISJlVODBWhwUrrNYMaIoIMR8vYtl7cfYnp/rhce5YS7iZHEH48NnqTMHMA3qLqnqO
 UBEvmKM7M4/Ib2EEp4mdESuB8bzeOu1EhJ/aKp+Dc7R7T29IPt/IzOWL8O8DcbVDga/7S
 6E+bBGo1P701EX7U+hHzG7zzYPs+6n2Wl7bVJebWvUTx5hVkAfgknhPIbHUUN5/UTQw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cVSfd0T6; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 271CE8176A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:34:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so7765295e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374468; x=1793979268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4k7Iz4jmfiEHWnSd7W9eXMhOXqciZnd2V0rcDPKldkg=;
 b=pE8speyLqurFPE/eJlDixW6t19cTs1+9OZJTYc6qeynVtbZ0wF0U5rMmohNWa4xuAz
 j4smIm84OT4rxgi3z15duk5laoEi/THOQ8YLEXc8vKJnaf+nkKJYDr0X6UG8i20RYFHa
 CL3BUxqMEMhl8nAvd1KsaXJ0hDVHJl2qHtuSRO2le3CjPJa4h09trSTKEuqEtDdpbje9
 cvNWI8frdQ3a5obElkamqrwAcV3G8ItOpPs1BAaNhUCuMkHT73H1CL4Un7TlGNtDv+sR
 hLLHg3gmWdkY3a7yrALDcw3XlkBuMIlm98vxkddphLFmV4wwB+tHVL3viAlbQHzzYibi
 YXhg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwP4bWn5rfj4tcX+G9iDB4ktsLGrnpiqi939xG0dk7rsVc+2nltQ8qqePdcf2iiCGpPr0KNBzQM6vs=@buildroot.org
X-Gm-Message-State: AFq9FYLfGkwV1+zUMKtdQZiv/sW8J5mf+lYIY2QOhdiJXNtOJuqWT7pG
 iscewNeyNRUQ6rdaAbmV+ZGp1kYxXpnHTteb7QUoXM82o8FHW+maEDwW0ScZFmnEK/4=
X-Gm-Gg: AYBFou0jXfMjGI1rzlYdfYc1gVVKTo2JG9mhn9Jw1Jwj25BePOJdfEB7mDW08jstBDb
 uUwY7k/Ze6CN4S2ROfBAt+jonX8d37XLEvTeHNnNTijqKWoaSzAD7NnwZ7LQYw25rd2rgHxzuAF
 ZYFLnu0aocoK35o5BKYEoMp39QUqlgh9DxaYrnCfJXu6waCR3JZ3tG+K+f6ZOmhM9IJHhjLPyzC
 mjCwst3gdhtcVeSYyviXAyUQdQYrZUaUBpS4Oe3e5lCaNveVg6mwX9xa1Idavd6+Uxg2gKm+Hy9
 bQOhYCp+2SXiGih4GLYKubWSfKvuBInb+wN0ZU/i7bCWEsEwGw4WXrU6zO9zcMfkjck8SGbbAm4
 i/7lD6lEwFiuToKf7rGY8WUop0gDQUa5vCf3ibvRygSG0QFeybrTn+EM6SRjOicQPG3xykvw6Dl
 00hrCGMJ0y7JZdhilnv8VMJto13qy2a133xP67DkB50LL88carj3fpBMUHUFLemMlZCAcULl1RZ
 UjchHwFw/F/MsmxBoWkIfFM0oGvlCeGHjRoEatGkoTGxmoZRuSeXY3VNvaMSbBH8XydiL4y9Jrq
 xm5PxkgUPcyv6JoXdoNtDg==
X-Received: by 2002:a05:600c:c87:b0:4a1:efbe:529c with SMTP id
 5b1f17b1804b1-4ac17567fe1mr61729505e9.12.1793374467664; 
 Fri, 30 Oct 2026 08:34:27 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f3229dbsm143397175e9.1.2026.10.30.08.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:34:27 -0700 (PDT)
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot development <buildroot@buildroot.org>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Date: Fri, 30 Oct 2026 16:34:27 +0100
Message-ID: <20261030153427.142444-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <843438d5-7e61-4c15-9629-e6d4e56f105d@grenoble.cnrs.fr>
References: <843438d5-7e61-4c15-9629-e6d4e56f105d@grenoble.cnrs.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1]
 configs/acmesystems_acqua_a5_*: bump to Linux 6.12.114
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

In reply of:
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to 2025.02.x, thanks !

Best regards,
PERALE Thomas

> ---
>  board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
>  configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
>  configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> index 6ce8a07bdc..205c68a00a 100644
> --- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
> +++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  a62b6a2d207ff72510e5f47156b7078e1e71797357412411b8e4fff97fc8f4c7  linux-6.12.98.tar.xz
> +sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index 71a559df96..683b7744be 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.114"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
> index 32d7692ce4..7fc8083a9c 100644
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.114"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
> -- 
> 2.43.0
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
