Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60A606A99C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eNVKwdoi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAFBD81ECC;
	Fri,  6 Nov 2026 16:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwlstaXMjpRg; Fri,  6 Nov 2026 16:11:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A009E81EA5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981495;
	b=rUmhB/+rT5kzoc7qV3CF/SeTi48neCSJWJbp65UUjMpKbrh8SugRi4By8iqVtcDEcoKd
	 BqZCU2cs6Q1RJkMoH6uaqtYtzrP8ArGw+Pz5wiyChcmiolraYbw3g7F0WvSKwxbqLWDLd
	 D6bSxmOKirc/MXdoyHg+mu5A/vrk7OkUgeJW/wnd4DFM+/TPnbh5KXXz9ujGRVVwjZlJn
	 FjNNqhED7oaV/l7JuLSYtRB0Qb4bvFlJHd/vghUfBgL6lhCtKnBHhd7a6PEA/ga45a5Vm
	 mwC4aRGBT89a0P+5GV7hsnM7MtG+n5ZA2QCtXQmLOjrKizCwgXuRQVvknXYOvNQ3GhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981495;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aYgS4qbwwrHuvJPSIRrECvoJq5GW/f0mfiepxsolrWQ=;
	b=D8F7F/ruyMDHQfsXAxDaxJdOmnuvTUuxJINOcKKFQqQzOYudcsHu+op5N3ErmZ4DKH1I
	 Nov3D7Xqi6ZiWFyLZ3T+aS2uc36GP6LwVXwvUZN+nUXqqfCcKn0RpwFhTMzDREY23Akp5
	 LJzUGZb5iWpMmAzBamUwsLt8RCVhzMAyE316Ln4CNcFfrd3ik033o1q5IAA3TS5ywvjih
	 EtZebk2XvSk0Dn0BKyfgnLUX2glZp2FCIxB4xq3xjMam9a8Jx2QiegEKcNztRXBzVwNZO
	 eV9QXdLYbUVWKY+J5fU9uVCu3M/kVfn5JNl0kt6kjgaRw/kM8nxlf0Kkqbr9uAkAAhw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981495;
	bh=aYgS4qbwwrHuvJPSIRrECvoJq5GW/f0mfiepxsolrWQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eNVKwdoi+9vP8Gn6C3ayZofXVkVoco508YQWAiL/ozxJjA/MW1EGxxFQo6Ud9JTin
	 163/KDOhFFBV/jDdZqt6djOcyyVR+L49zBjxmtkF5UK74FG3AKM+wKi8cw1Zaq4zGq
	 e//yBAu9BYosbJzlCVH1WV/JtUrz23Yx8zGQCz0gUUgjGoAV+VGbivP45ulgXqe5HW
	 sKjc18yBfPJv5p03aFNCn6kGC5SP5r+Y0Yqs//c7VhUO4nG5t/kzoS9Yhgx84uHIVf
	 MtQV8HT02U8XBArUD8dDV9WyR9RQ8eib89rJdmr5mSqyowWRzelN07CUk3p6ne84VA
	 cowUlq6ugjr7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A009E81EA5;
	Fri,  6 Nov 2026 16:11:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D978D2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFEEB81E9C
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7A_-qxvJQ0p for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7FD7181EC6
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FD7181EC6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso7533215e9.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981489; x=1794586289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Fz57woYF9M4K64pZrEwWiTv9yau6tkI/ZqyQhcjKoXA=;
 b=hezK4L5Xn41xfFxK8/SylqmBLXe0zLRWRD8Yam4hLjfE8hDZq+HwYFAT5Vkt/YZSjb
 3PtxzAdn/UepdemZGBLZp+scge/XEe8tYsrS1CzrNM5R3pOrD1oNLnRvhHrqLjRH+UHp
 0h/KergIuVXTIW/F9+fvVRQRGz2mbe+x9elsSxRupRgHHlYkdNC3pUjbbnqzmzLdRZX0
 udtejghqcbXmpvRNJD4FSzODDEfBxnFwwMJkHkwwKY9U73mDD12kRono5qSWbUJ9FKFM
 J9zGZpH64fH6Kz4vA5cdCSds74iwvkF1c4cHi82RA0YvOLYMapwg9krgK1Doa+zg0cQu
 dj+g==
X-Gm-Message-State: APuU4Z/+nZz0i5RPZ8lHCZmLvS5tGGULYOl+dRT3l1EqTCjSB/z+ghk1
 SQxvEDqPWMI9+aOSv5FguamjT5utgidAFyWVara6kABTyX/Bv8i4eOq1Esw7MCAXS//m5gJrSQ6
 iybA6Itg=
X-Gm-Gg: AYBFou3rBjsmw3I97pOuk+7EiIq2e1knUaFjGu1ydUY/sBuNezRz7APIWRAKZFddNlB
 M2QQWaTXMcKb6rg6FNvnydVVgEfhUSybbfJYQ8MAf1nuuyzNUuBlzyWWQdccXK7CNyJaqajmS+V
 JbmykbHUJCgsdySBL0Q2UjHjmFaGqO9ZQ0/mA4A9qFfjxgRHf3/y8XB723UV1k7DAlHRRLIVqoQ
 eu3WHCFY58lhLVlG7ckrBd74fqNPZg5e0ZsAekQA9UJyHkcHaUZKuxBmIxsw/QCPl27O1bDVKRg
 bYw2H+V7nrvRnzGiNcfnZXS3cw9Hav42PRQtui74z1fq4Pg1SkKjzFLbHWp5QoQU3KCIIymOKNJ
 Iux+Z1lPb5mb2/odOGzPvw3LDDh8XrQAnGlYLn7cTB0dDx8KunOVQBP6SQly7rxp53poziG0FQf
 5KgiXgtnxoTJIKvIUoTNQ2ISxrqbO84tuoU/q0D4ZyNox+SZjFaoN2rhrrK0Q7kj2DFvHdktmYF
 FI7QYkvqv1qtjAG250ntXn8heEoIOCBxHTmLobf6cxPzP0uEeODz8MF+oq8TxRC3Iu2r/AqPEb1
 Pr1Qun2UW1cT2tpRF9qp2EoO4vLKbeJH
X-Received: by 2002:a05:600c:1d0b:b0:4a1:742e:3 with SMTP id
 5b1f17b1804b1-4b6e0170a5cmr51619855e9.27.1793981489433; 
 Fri, 06 Nov 2026 08:11:29 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cbe2931sm2562555e9.1.2026.11.06.08.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:28 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:25 +0100
Message-ID: <20261106161127.608112-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102104401.238208-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1] package/openssh: fix build
 with LibreSSL
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
> Building the OpenSSH package with LibreSSL would fail with the following
> error message:
> 
> ```
> ...
> /home/buildroot/instance-0/output-1/host/lib/gcc/aarch64-buildroot-linux-gnu/13.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: sshkey.c:(.text+0x61d8): undefined reference to `EC_METHOD_get_field_type'
> /home/buildroot/instance-0/output-1/host/lib/gcc/aarch64-buildroot-linux-gnu/13.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ./libssh.a(sshkey.o): in function `sshkey_dump_ec_point':
> sshkey.c:(.text+0x6598): undefined reference to `EC_GROUP_method_of'
> /home/buildroot/instance-0/output-1/host/lib/gcc/aarch64-buildroot-linux-gnu/13.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: sshkey.c:(.text+0x659c): undefined reference to `EC_METHOD_get_field_type'
> ```
> 
> This can be reproduced with the following defconfig:
> 
> ```
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_LIBRESSL=y
> BR2_PACKAGE_OPENSSH=y
> ```
> 
> The LibreSSL bump to 4.3.2 in Buildroot [1] made OpenSSH build fail.
> This has been the case since LibreSSL upstream commit [2].
> 
> This error is not present on the master branch as the upstream commit
> [3] is already present since OpenSSH v10.0.0.
> 
> Backport the upstream commit removing the use of EC_GROUP_method_of()
> and EC_METHOD_get_field_type(), which are no longer provided by newer
> LibreSSL releases.
> 
> [1] d2423524b9 package/libressl: security bump version to 4.3.2
> [2] https://github.com/libressl/openbsd/commit/aea3014df333871d02dc263a69746399371b2009
> [3] https://github.com/openssh/openssh-portable/commit/30c746265ebde29806dba77c92fb1fd3803cbf5c
> 
> Assisted-by: LLM
> Fixes: https://autobuild.buildroot.org/results/b99/b994397c0af4a8555b91c0fd4e84f3d69a67ec37/
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...-redundant-field-of-definition-check.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/openssh/0020-remove-redundant-field-of-definition-check.patch
> 
> diff --git a/package/openssh/0020-remove-redundant-field-of-definition-check.patch b/package/openssh/0020-remove-redundant-field-of-definition-check.patch
> new file mode 100644
> index 0000000000..dde0338fff
> --- /dev/null
> +++ b/package/openssh/0020-remove-redundant-field-of-definition-check.patch
> @@ -0,0 +1,47 @@
> +From 30c746265ebde29806dba77c92fb1fd3803cbf5c Mon Sep 17 00:00:00 2001
> +From: "tb@openbsd.org" <tb@openbsd.org>
> +Date: Tue, 3 Dec 2024 15:53:51 +0000
> +Subject: [PATCH] upstream: Remove redundant field of definition check
> +
> +This will allow us to get rid of EC_GROUP_method_of() in the near future.
> +
> +ok djm
> +
> +OpenBSD-Commit-ID: b4a3d2e00990cf5c2ec6881c21ddca67327c2df8
> +Upstream: https://github.com/openssh/openssh-portable/commit/30c746265ebde29806dba77c92fb1fd3803cbf5c
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + sshkey.c | 13 -------------
> + 1 file changed, 13 deletions(-)
> +
> +diff --git a/sshkey.c b/sshkey.c
> +index 73fb89ac27ed..ab80752b8d0b 100644
> +--- a/sshkey.c
> ++++ b/sshkey.c
> +@@ -2705,14 +2705,6 @@ sshkey_ec_validate_public(const EC_GROUP *group, const EC_POINT *public)
> + 	 * EC_POINT_oct2point then the caller will need to explicitly check.
> + 	 */
> + 
> +-	/*
> +-	 * We shouldn't ever hit this case because bignum_get_ecpoint()
> +-	 * refuses to load GF2m points.
> +-	 */
> +-	if (EC_METHOD_get_field_type(EC_GROUP_method_of(group)) !=
> +-	    NID_X9_62_prime_field)
> +-		goto out;
> +-
> + 	/* Q != infinity */
> + 	if (EC_POINT_is_at_infinity(group, public))
> + 		goto out;
> +@@ -2812,11 +2804,6 @@ sshkey_dump_ec_point(const EC_GROUP *group, const EC_POINT *point)
> + 		fprintf(stderr, "%s: BN_new failed\n", __func__);
> + 		goto out;
> + 	}
> +-	if (EC_METHOD_get_field_type(EC_GROUP_method_of(group)) !=
> +-	    NID_X9_62_prime_field) {
> +-		fprintf(stderr, "%s: group is not a prime field\n", __func__);
> +-		goto out;
> +-	}
> + 	if (EC_POINT_get_affine_coordinates_GFp(group, point,
> + 	    x, y, NULL) != 1) {
> + 		fprintf(stderr, "%s: EC_POINT_get_affine_coordinates_GFp\n",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
