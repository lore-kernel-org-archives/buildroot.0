Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AB4606A338
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OfnVCtMf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF75160E59;
	Fri, 20 Nov 2026 10:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6E0uPnbleRkC; Fri, 20 Nov 2026 10:00:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EB29560E50
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168846;
	b=gmE1N/1b/3L+OG5RbYughPhVcuwyv3afzOQpr2mPm9AqXxuYSRDlfqQLF+8cP/kmg1Vx
	 4xZsQNZkYx+zZ0cygS5uXnmIp+8arWn9uXXFd7mMeKiuFY+5AFZoJLh0XVCLSGD+Sygma
	 nCKr6dZ4jRYQH6YBhY/VonxQe0rQY/WFa1GofOfqbr55DJUPKt3YKxGaTeMvQRTOM8ngZ
	 6wHhygZsv0XMkhdx0/maj1UMjf3b6YqNJyVcwI8V2KbdK0c0TERMjnuqLp8WqR5P+sInA
	 FmQNM9Uqy3r/sDnlwx7bIgIKLdl2EtMOBTJLTwcj4Wrhf1Kc3XvOzzk5NRgdrqwryzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3GPWO4/lk6bd2ohql8q4g9QvQIKINQ2nJmvasmsnolM=;
	b=qIA81hcFY4HEtGYh80Lp0KVe1ZmvRT2QT0brydTuAPYsPgfDbsZbalinVF8X65eue49v
	 hZmBi29m7jtT/xahiynbYyCM/fq6QNcLXuhrp28rtASC3cvE89/r8/fON09REs4VD90Rm
	 5xILaytpPtyaZMBXBht1Hki/hIU5/olcoKM96KsyYp87WYRSs1EIVw/0pkKa+N66VLDon
	 VRCJIj1AI5FK3QPIlL5j1IhWhFM3BcYE43/qoc3NXNL2GgelYVqqkITPpAb+H1pUOe4Q3
	 gAQsDaG3wY8DFYkcuuFaNwkXeZFXpNKQv5POS3m/Y9HnUbPzaIF2tsrQjeY9yz1O5Hw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168846;
	bh=3GPWO4/lk6bd2ohql8q4g9QvQIKINQ2nJmvasmsnolM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OfnVCtMffQhDSZfe1BwWR4gU+fWteJw+XpWB6oyJSnfZDHjI8fdIlzR9cnfmRYnfo
	 5XuJHgtQHkbbCX8HVHuSqDGTZfrqnxf/J8xJNvDBq8R4Ihv3fvjNTZM71pyvTJ4T92
	 Z74IaiLmS1Wbjx1fVWmL3DF+XNunGqL0Vdr4PJaycpCGPQazqNIyLJBwwY4NUYmUIf
	 GdX9Vc4e3bhKZ0SHd7KOQ46mD0rXjp4VNrGrJJm8LZQxzOHAVJHcR/IJjYJNGP5pO3
	 rIobeAV0i4e96xs3JAdTJq5Upv2Z2RiGIAJevCQkjyMHOjrU3HMFQPYSUFARIH1WPi
	 jCDVMZTy13ReQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB29560E50;
	Fri, 20 Nov 2026 10:00:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 915A2E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8286760E4E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cbEbkL8Bggw for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6453560E5B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6453560E5B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so6437575e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168841; x=1795773641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e0SP3bqkiMoO0rVU2rdvyKcccGSRqmhPl7DandgbGtI=;
 b=1w3mWP3FrNX6zgGrH8+JVe3q4lUXQQ5VWoGGUZzf3U66qjioWnbbP2AB05gGdhXdKK
 dQmAGkcnkGY4eVZGxGe11DMZhOEQF/pclgCBX3ViEIqvWQ7leNGXOlwfiekwkE3T81lB
 qxUFXjTwFtXTLnkOv+S3GV6OD1jPH4xx6vH19GNyV6KCmSUtkz1ZcAqmbqEnM6Rn7Ap9
 +FrtVwK9fwAFlC/MIOoN3s+p5T0jCLV2SKxt9jcXg9REhUkrh/Hs9uAqz/A3wBtnBWmI
 k8f6DRVXSlv1JzV53cf9XpzEgI/IFCMzgIw67N+Wj6gH3eZJYwJsHmcwtfu8vKMY68HH
 tj2w==
X-Gm-Message-State: APuU4Z8UQswD0hdRWRUH6xULuf4ZJOj+T8eHV/B0oqCOu5hJ46Z4a+K0
 9Ln8Se5egwEv4QNwxaQ974RQpKYnx2OebO4wLFM2AXVPuOqly8puU87qxrn9rFRE+Q/CJn26A5P
 2kQ1DQ0RoPw==
X-Gm-Gg: AYBFou2uVUJK2hHh4Hk2pWTBV1Q7C1O1PX8hj0fBajgTlunpLKkr0OHFnfaq3B9fqG5
 bDHXlFeE/+zvgh66PB5URTXbKBDYW5fhXpeOIaG74afT5bQuaKCAGRmTQwic660JR77a8w25wVE
 Cvh2vztSgbfsBiuXhBGuVJx5VO4QjiyqeBFOuxe+wCZp9VOhUqmeeYrTEfMUnRo9H5aKeChMVuR
 D6+kaYDj4XjGFCYtvKhNsP7BoYz4bsYmLh4km+I5GQXD3964I1FusVgT0fK6OiRTwx+GXQem//V
 itOaZd3TPPmn/51lheTzZm66a+GbelTkgdVSORor0DlRoyOu5567xDM5uk0mcfxA6spL8H9/ex3
 6YckAJjUFwaKNvFFSaHSpp4r2PPhtCbuY+WtrZ1c7fqwaX7YtRwV9oX45HQfTW31Pg292R99QoW
 lMgkuNBYe1Saiu38nuxakEQMxZ8cQaLSHfeD1scGoew68vF8VK9Z/HaQpzIL9m/LIWJpHygAXWB
 et90eQFZvPJfO9KYF0iisJTG/e2SNDIICrHSwDfTW7+fCn+NfOckNXVMu/smdGBekF0u88W38iL
 +KNIaXQsCkW9dEseiHjrguCsJ318nI4CbveruEyXIAhe
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id
 5b1f17b1804b1-4bb88944bf5mr50008325e9.35.1795168841267; 
 Fri, 20 Nov 2026 02:00:41 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853ca452sm106890155e9.15.2026.11.20.02.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:40 -0800 (PST)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:35 +0100
Message-ID: <20261120100039.542110-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114212225.1098201-1-ju.o@free.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: test_iso9660: fix test
 by selecting BR2_i386=y
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
> Buildroot commit [1] changed the default CPU architecture from i386
> to Arm AArch64. The test configurations which were relying on the
> default i386 architecture are now failing.
> 
> This commit fixes the issue by adding BR2_i386=y to the test
> configuration.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158106
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158107
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158108
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158109
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158110
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158111
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/testing/tests/fs/test_iso9660.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
> index b2edcac460..330a39c202 100644
> --- a/support/testing/tests/fs/test_iso9660.py
> +++ b/support/testing/tests/fs/test_iso9660.py
> @@ -4,6 +4,7 @@ import infra.basetest
>  
>  BASIC_CONFIG = \
>      """
> +    BR2_i386=y
>      BR2_x86_core2=y
>      BR2_TOOLCHAIN_EXTERNAL=y
>      BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
