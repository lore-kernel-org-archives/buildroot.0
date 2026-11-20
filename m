Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77907606A32C
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JId0X05R
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DB8C40ADA;
	Fri, 20 Nov 2026 10:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QdhFIOcSNqS; Fri, 20 Nov 2026 10:00:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5A78D40CFD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168805;
	b=J8lJomYNL+kzv7jBZLc1Lrn6jzEzPgxWNDJPEXcxbFea0TACNnk51PKAgikS4UXrKkDX
	 WXSclRiHLuEC6ALLxREy7g0VMPfsWKiuJljNYARn4F0RFejoCShvn/63c5dEBGnxmhApG
	 t4DwoaHtdpMj0AVieY2wI7Mx83mAz7Mni65x8z7Pi/+RUdQd+SbugvR0oDCQDlu6UmTh6
	 hGBqzIcyxwyWLMD1hqxNvX0dO+HSKqXutOt4k9XjjkvSafLg+MY3R3ZD/tYJBtR8ecadS
	 yAQZvhAZVmv1X4Q4P34Ynbd6ddMWZUqtmbTeASYswCFqys76neX72PWzffXzL3xjgLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168805;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yeBfTJdj9eHYzf1k3o1LMUIaCG8oBYXXpRw6AapxHho=;
	b=tUDYdqKhonosVl1d9C4lAjvn0DOBS8izO2ADqaDDf9209g+6cj/37DAo6GLpBaRNHVPK
	 WJQJ5/eOS1a9qM7zH6JiwMK6TQwQIu6q6f4c2wFW8baycIFJ1QTXXPDbODwYOvmUuIj/w
	 L+UM84UiI0tI/yQGGtSD7hKa3QPJYsvD7ktYiztEAPDeuYGCwCUBoKntS5fsaK6gI29JG
	 CDoGO+fZ3QFJHwVkQ/o1JrjeH9P55x2VdXzIqNrNvhSgcEtRBsQtcFEqRU2F5SZApP1eK
	 +vgmo+MO8dvC9J39EdF2Db2fN9q4xjm9zFU9yNo/04eOr6qe75IHibIHhMZ0tPgDp1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168805;
	bh=yeBfTJdj9eHYzf1k3o1LMUIaCG8oBYXXpRw6AapxHho=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JId0X05RacFhli48k++DYYwCLSP8lK2PUZVBhKO3TDmyAOKZZ9eVNlaezynEuYheY
	 FVi+ny1vAYwEHY3+Nax28S1J/erWHgkxNBJBl5Tz+1WIpnU3QamsgfmdaJubzbQBjP
	 LwD7bhEeaB6nlT0Nf9o2yqMjMqkUyZfaQX4N/O8ePvce4s6xvG6e0BVelQG5DhorKC
	 6LHTN7TLO0crctJNQYl6e6Bu4AMnB1ilmJYFTY4Ah9hEN31prbJd3jiMhe/I8LSAV5
	 /i75RSinVUUfmJ8GDvr8Lv5vTh4nJWDcJrLgAU1X7Ob/Tu/Prt24YD6MI7fGDR02it
	 3GZbQBwANvlNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A78D40CFD;
	Fri, 20 Nov 2026 10:00:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1CF2E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B810E40D5C
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Glax7qzZX98L for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A524940ADA
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A524940ADA
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:02 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so4838485e9.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168800; x=1795773600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jcyY7wFXGUHFrfeMDIkGvjQ+4X8g88N0XFpz+G4G7Gg=;
 b=ggCJu4c9aIl9a89NCzYMexSQMqLANKwse3YCbIFyYxm8pCbVRkNBs9Jnq170xgE/UU
 /y37Es65vFCqdBrlISV5Qy9hCHL82prIIyfrJli3kmfrK+tr6XqEgZl64BqxxazxjVCd
 KEkmfLEO36bUgRUd7c9ef10dsemSSaLCeoYi4PgyF0wNGhHF0Hmdf8mc2KKJNp+D+rn7
 VZusVRE3+cr1vQObiClBfWgoTrzmrgMziYXnLEVIdlUYzhcGhIMJayGLzga5zMJg5NkN
 Fb7K8RjDVXVCydOTi64Ge0SzuTKc8JQeD41Q0akgOwRkqSDT+PhY70uHXEZ08gpeG8hl
 wB/Q==
X-Gm-Message-State: APuU4Z+3OXl4SxzA7UGfl1ZoprRnhm4ARhhMqVQAUyDW5yUPEU7evaq4
 OU1aXpYNrIUI/TzwUSQUN4MUQfWq6eAFF5vk/cRd/ysQZdbFsDdvrnQbXx6r2hFP6gZew/6JP0/
 FPfAI5qd3HQ==
X-Gm-Gg: AYBFou0zSjL6XmIaJb8zS05TmpGDh8fyaJeJvjzFa+N+qDrRjJqwTulVLV+99T/ca2x
 ZBPUACnWo8v7ediZ55rBez+T/IYuQpMZ4NidS6gynU8lrXTCMfebctaE/nJ6xC61RW4dDi4GOji
 g6gz5gI4tiXqJ/SROD1nRId+HU7DIk6RLhnsOx0t1Zi2DHL+hmmDoRIMNATwxmJ2tFpi3sj1I5e
 lueB3nHI0i08Vud9hNpI58Dz8olCDko7NGoTAzeDZmanjlXmvhGUFErj1qzEvXZ2bpINqDd3YCi
 6Jm4orvhZi786O5RWoTwanCQ5C0qYyJUcivjFU1H9SXo+VBVRjCfInuixLOQxkoFvRR5NskBunH
 m1rCK9kyl9yzQQJ8INGkIR5eTfdAFhwIH1lpbgbb6KAmQmO8F8+AIBjC8MYyHYwCS6C26x+0PXC
 +qBSMC9j5xH0ZepsInbDUqIQ/dGSGelYN8ZRsAhv9i3N1qramyWvAdB5e25DBoPvQaaoWXHFDlh
 t8UeeosHMMANFJ+0yD3fUTBnQMLul7vKDslEavp5okY2fQWJ+hM5QIBj2jDz/ok8sLxsfb1F9BV
 Lh76W4laHrkXZ4c6fK3iQ2xn/4ojrfv/C19WN6HIquDYrnBSF/w2trVKQNHhE3C68Q==
X-Received: by 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id
 5b1f17b1804b1-4bb88812200mr58760575e9.17.1795168800492; 
 Fri, 20 Nov 2026 02:00:00 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a9687sm117014695e9.10.2026.11.20.01.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:00 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:54 +0100
Message-ID: <20261120095959.540919-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113062729.8725-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump version to
 1.27.4
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
> https://go.dev/doc/devel/release#go1.27.4
> https://groups.google.com/g/golang-announce/c/iY8TY0wWgbM
> 
> Fixes CVE-2026-97033, CVE-2026-97034, CVE-2026-97035, CVE-2026-97036,
> CVE-2026-97037, CVE-2026-97038, CVE-2026-97039, CVE-2026-97040,
> CVE-2026-97041, CVE-2026-97042, CVE-2026-97043, CVE-2026-97054
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/50f221e8462c6d8acf73a86dd200c835d2930bcc
> 
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 828f809395..57cb5fe2f0 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb  go1.27.3.src.tar.gz
> -sha256  cfc243057c03dd131413b91269d16b5061f87f312059c1ed78681cbb95d6afbf  go1.27.3.linux-386.tar.gz
> -sha256  65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40  go1.27.3.linux-amd64.tar.gz
> -sha256  a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49  go1.27.3.linux-arm64.tar.gz
> -sha256  d6f4e11dd7157030d7ac11c51c8f73201a2db932d593c3106b1da11cc32bfdf8  go1.27.3.linux-armv6l.tar.gz
> -sha256  f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5  go1.27.3.linux-ppc64le.tar.gz
> -sha256  62e109a6280a073c9025e1b51ea298ec1d3575d3ce62238721311f5ff2c854e6  go1.27.3.linux-s390x.tar.gz
> +sha256  73cfb8571aec0c01177687db87163d46aa20e9779672772891aa17654d9a6099  go1.27.4.src.tar.gz
> +sha256  6ecb45737d2315acb0dbbc97ea8e13e7c19d4c796abe8d68907c40bce6f50bf7  go1.27.4.linux-386.tar.gz
> +sha256  7226736c2339719cda28fbf3a54d71aa63bcefe376e98cef00034268dab24840  go1.27.4.linux-amd64.tar.gz
> +sha256  3392582988a273a87ab5043ee1b2c9c17a2c3c00580bf9326c47a2e0aaaeac92  go1.27.4.linux-arm64.tar.gz
> +sha256  e50964c41c6e187375387939e2f380de7250eba44e2259dfeb75c540d9d585c3  go1.27.4.linux-armv6l.tar.gz
> +sha256  f508314644fa6f466d1935f8a34f01e7980092a4730bfb9d7fa3ffde81910d20  go1.27.4.linux-ppc64le.tar.gz
> +sha256  4e56b1b9f26c649c1f3dc61fd16443d0154bd0860e59a8032b4cb05ac42f283e  go1.27.4.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 88b4163ce1..b7e61f9ebf 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.27.3
> +GO_VERSION = 1.27.4
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
