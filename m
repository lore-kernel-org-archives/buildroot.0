Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820CF606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K8nHUDTr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5343840D09;
	Fri, 30 Oct 2026 15:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDRQ-xmVI7CD; Fri, 30 Oct 2026 15:29:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EE31440CF6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374148;
	b=rRcyZTC0sDEt7lllcLZSklpvNmfiicPXBDt+y2Z2dqhLHIt6z6A5ZKK/90DAMQE2ccoP
	 T8OsK2bV76w8Z72cvhyJIsifc/A04i2o26jzX4suXDfcsQhDioAzgxWrJU4R2kYhajx5F
	 CkIFWDRwXVOvhl8r0BrXOB3AhbrL5zltx5YoBlRCK30fgK1IyY+j0lx65lMS95WF4oUnS
	 O1LJfbQW7agi5dHZo4zH8MD1VJUiXNVuCi3+rRAskvW2hq3R5+gUI81/vQdYPD5yAZJtB
	 ZkKhK2Bbk/cgSh21WBfbs1s19446ePX9C1Qbjgg4n7T62GXjim9QfgGCDdfNP2M/FZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374148;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZHj4mguPLFcrY9Vwq8jc2OVgQ9bf6f+n6Xi/rwKq6A0=;
	b=iQ/gMOrUPBEVrXQCZC3GvY/88ssySfPmFY5Aw3/aQWn1D7NVV5/QtL0CAPp9eUKzyhm5
	 92srELWZnp97hK2KB5+FHmY4Gwv9Zo1efCjD5o47DbFaz/pcJ7hijVPOttHTeJ+iam70I
	 lJIqL1lEoTz/qVCIPUXCeDgfboQ+fuyrUQSuBpTEZyCx914OGH5ECJUtfMuyBrZfKjWKi
	 /1o/3h3D3LjgfIL6DF4CgKN6Akc60IjSk8tLfTI1zZbe+iYZWNN85B5YoaD/+MEvnXh1p
	 145VgyjFUx5XB35oTJ78bm21R/VZ6dIDxXlUlgiocbvx3Y796EXcz436+eYDZ2s8oeg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374148;
	bh=ZHj4mguPLFcrY9Vwq8jc2OVgQ9bf6f+n6Xi/rwKq6A0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K8nHUDTrHoIz3SecVKuaGsp6k7+mpWdtI06nYFaUoIwoiv0S5JxAd0cjHa3xut0Ul
	 gRPC1xaz0lIfVYczhz5v8VKZupOoZg72ZZejpMCu8qH6hzqLwMu//ymzgkfDSuDWdD
	 bI1ZqwSIdf6f8oq3/PgZ6LzEzL+FHCyEHB9PtucawAD6x+sUQ3qbJrCp4BAlKmn2DO
	 fvaSZ9fGnAUD394FVrpY1BIr59gCQEBj5610WxsWSW1n6ajXpkAa9fLAqc+1Dy40T7
	 4quI1sjOCmene4PyRqT3VV1kXxjodQDDEYj9Xe12YtCyUHUGIEpgBHvB4uObbJMpAE
	 fymfOhjwfwzYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE31440CF6;
	Fri, 30 Oct 2026 15:29:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A346CD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94FB840C9E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pALsCZpFXpHb for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3B81340CF6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374086;
 b=Y61Z5xNrxc2IdprIr0Azwu8Hfedxc5shSXDYLECVUIWY0lD1YVrQduvNWP8HjSEccms7
 KXvqdSuNKL94zFVtrjoknOl2JZbW0R8TgtI01RL8DqiW4Pp3jKHZs9W+a0OnucF3lJ8H+
 hl0oSx0gMZRTMPNuBuvUM5uZCb7EXuCIvtDGKdLW42c/8BlUL1J9/HK7/8VP2HAYOdtwZ
 aySbOmqQIyWBQSUuKggVziZ3XbF9kqyitc0DEyEDPbILEi4QqRQyzovOvX+QIj6uIkI12
 y8PG7ghYNRwCRSa2MnBMcid1XBQ0Mqj+etYJzeyTyHOfVQ4nnrFMbBD6GLFwnw9FCig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374086;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3K8G/IzlpoxBUDurCWzrel1kM7WmSJMO5FAVVpUpjzs=;
 b=T1LCkBrUkpronux0aygmqD6i6vue2E2FGiqy0OjxbnXs5lSBFH28+GjXRZ//3XAeqvpe
 VdjEKn6Vn6sGc5Ho0vAn4IolyUPYP74+Q2klxgcTAhUf1hVcEuvcaUXf7SvW+BtYA3kil
 sxsEPdbQWFCzuNpgESz8vw56EEaSoXag3o2SKB7YDEP1JptCnGRyj5NP1QKmDpogbhbyL
 Z7H0cdnqcOGsNHkhFGpHUK1KwAprYkDIyDJQ89SPwh+QywA+jpz9WrYBHYjKGW7jawghg
 Qfj7uXmS8MfAz21MCr2Ae3cnxlwEPSVIScdi42VVG51Y3tAR56Vf/CNipRFkrGBZpXA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eVbMDTlE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B81340CF6
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48e0d1c095dso489279f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374084; x=1793978884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3K8G/IzlpoxBUDurCWzrel1kM7WmSJMO5FAVVpUpjzs=;
 b=kqxI4lm2Kl1gEDOpFFJA1yXiC0pLaNYjGJQhhKvvyC10YM7kXG4zEp109GPCRR0ScY
 bH5+WLJ9GGwjNSekLNt+HMQ7HA2cjOyJljaCkr6mRu7xXik3KCLBOEIg1xi1LII6E7fy
 k76v8dgExQMjvLX1lWScSIn4zP1+MNDmsO1rCBwdo3lOtG6NkwIIg2uX12kbKY9JW/2P
 3XC0t4+2kBZ3mA7q2Vqb5YXusWqq1oVbBUlxGEqRa/cyKYGrDcwPg0feIvjHBvl1AiNS
 hdGGA4X+Otnc9aUtHXklP2ZAGrbjIMUIEdb1yQdjq7/JW/gBE9NKr9RmcN4FarqI3w/k
 g2ug==
X-Gm-Message-State: AFq9FYLYTDfsJNX1VBUXarHPndX8TqjFKauKrXOWSvCtDCbfYKH6klF9
 SjN4uWYEkGjTBQlVkduh4SoSS2bc6FMyjv6YWY/b2gj+8MItXN3Am2ouR1H2NTSeh7hrLRMwaLF
 wbxKuuEw=
X-Gm-Gg: AYBFou1mIn8HOsjuAZfCzecZOUDGOT/94L/JSkox8PVWU+QDMa2tfDj84M0H1n10w/T
 2cqttinIdRpiQdmkYRBmn8OdKk8gSW32ou87x05m3I8SCKe4+c5nNiQDi/b65MqF0tYPK63dgqK
 V5mhTJv7ki1ez7sb8tIxcL4FKOd0JiBSqrzN56sJ2HbGLffqhs77op7IpbtU4NaUCi6dLv43TMc
 nzv2Lrku1uJb78FgS5adzZqoFPtP5PfO4AplpsumRExCN6kl0Q/vAEn2Zf305XNdwvvab5EM9bL
 cy6zMig8cXTKiMkUhRIrUGnYMVuHYO8tWkLmOwlEoC/dUUoVRFJ6Dh/UKS3fr1WzTFYAemUQ0c0
 bw8GGcjn0rjpeD+BO6RopDqmyaCDCXvZL4qO6kuYoAP34LA6bYCbqykx5zF3MDGhrsVcBeU1Ah0
 vgnusaQH3KWSWmy9c7j3LGfQv3LhkjKG58cVpkvu4BmvmIEWO51QmASwfdTB6yLr2ZcmVi9BBNU
 G/4d36krE0E0w7XQnIYE1g38F4dGvFYdE7YXVilybS5CM0nUWiZgTxi9Nw6Y2nkCSedgYHe1fS0
 LMvhfTmS3Iy4cPypg5Nm+W2rAcwAAH0PMAafi0UdgHRz0hISIcWIDE13wzonqpm/Tth9IVI0
X-Received: by 2002:adf:f007:0:b0:48b:174:eab1 with SMTP id
 ffacd0b85a97d-48e6e509b48mr5347202f8f.36.1793374083891; 
 Fri, 30 Oct 2026 08:28:03 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d3e9sm4099287f8f.6.2026.10.30.08.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:03 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:01 +0100
Message-ID: <20261030152802.1907105-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022070004.2533972-1-peter@korsgaard.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nginx: security bump to version
 1.30.6
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes the following vulnerabilities:
> 
> Changes with nginx 1.30.6                                        14 Oct 2026
> 
>     *) Security: a buffer overflow might occur in a worker process when
>        using the "alias" directive if the request URI was changed by the
>        "rewrite" directive and was then mapped to a file path
>        (CVE-2026-15176).
> 
>     *) Security: a buffer overflow might occur in a worker process while
>        evaluating string expressions with variables, which affected the
>        document root calculation and request logging in the http and stream
>        modules (CVE-2026-93479).
>        Thanks to Matt Suiche of Tolmo Inc.
> 
>     *) Security: when using HTTP/3 a part of an unknown frame might be
>        treated as the request body, which might result in bypassing the
>        "client_max_body_size" limit or injecting data in the proxied request
>        (CVE-2026-95101).
>        Thanks to Hansol Lee of GOTROOT.
> 
>     *) Security: when using TLS session ticket key rotation, one of the keys
>        was left uninitialized, which might allow to forge a session
>        (CVE-2026-97629).
>        Thanks to PhiNode Labs.
> 
>     *) Security: when using asynchronous file I/O (AIO), use-after-free
>        might occur in certain configurations if the SSI page has "include
>        virtual" commands (CVE-2026-97205).
>        Thanks to cyberlancer.
> 
> Changes with nginx 1.30.5                                        15 Sep 2026
> 
>     *) Security: a heap memory buffer overflow might occur in a worker
>        process under certain configurations when using HTTP/3 with OpenSSL
>        3.5.0 and earlier (CVE-2026-90439).
>        Thanks to Banny Liao.
> 
> Changes with nginx 1.30.4                                        15 Jul 2026
> 
>     *) Security: heap buffer overflow might occur in a worker process when
>        using the map directive with regex matching if the map variable was
>        included in a string expression after a capture affected by this map;
>        a similar issue might happen when using a non-cacheable variable in a
>        string expression (CVE-2026-42533).
>        Thanks to Mufeed VH of Winfunc Research and Maxim Dounin.
> 
>     *) Security: uninitialized memory access might occur when using unnamed
>        regex captures with the "slice" directive or background cache update,
>        which could result in worker process memory disclosure or worker
>        process termination (CVE-2026-60005).
> 
>     *) Security: use-after-free might occur when processing a specially
>        crafted proxied backend response with the ngx_http_ssi_filter_module
>        (CVE-2026-56434).
>        Thanks to P4P3R-HAK.
> 
> https://nginx.org/en/CHANGES-1.30
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/nginx/nginx.hash | 2 +-
>  package/nginx/nginx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
> index 6c3afa889d..646b51997e 100644
> --- a/package/nginx/nginx.hash
> +++ b/package/nginx/nginx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f  nginx-1.30.3.tar.gz
> +sha256  3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9b8b6c8  nginx-1.30.6.tar.gz
>  # License files, locally calculated
>  sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index ad61ef6140..c330e81ebf 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NGINX_VERSION = 1.30.3
> +NGINX_VERSION = 1.30.6
>  NGINX_SITE = https://nginx.org/download
>  NGINX_LICENSE = BSD-2-Clause
>  NGINX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
