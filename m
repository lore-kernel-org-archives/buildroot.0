Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614DB606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HFTOredL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 323E540E12;
	Fri, 20 Nov 2026 09:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgEUhlIDDnvO; Fri, 20 Nov 2026 09:58:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 005DE40E0A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168693;
	b=bNHceRoE7WTaq76CJnKRU0dRM+FwPtSYPWktMoMezusxRdT2eMUB2CSI+If3KcZHRYU6
	 bUOXPMQS4qVDm1u6/Fego4n/vslTmGIn9hxX5CcntBGyiwpCzTsQaAGiKvEMxNRGfeVfd
	 wpIp8oGO4qmhGdrDyimxL7pcHSqOLRSJF8LO2xn15bruLuE/hGAY+XIs04YKQrUQH0T9K
	 4AE0BJBvxZW9HFSiEJttY49RlC9HKK3iHX8pei42CAJZm0D01ABLPD/jkIlbCkMC4tJ0W
	 aLDmNzQJfSVzij+XAAPr2fYXEydD3N8YJORz+DzTFch/pVuHUWMAS3caWKBLlj4JYWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168693;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pa/tPH9R1gi07HfuufJwhtpUTgeky7Bl/SUkPWJ0YpE=;
	b=HN24xyZ+HF+8spAdj89PyN4Zptr1aIxKvr0Z2Hq5AzWEliudfQFfP53gcZHRfZA7yy7s
	 VUkjZFZEws6KrdoviPupMIgtBh0p/EtXxraYC5x76Y5X9XxjTjeWw27Lv+VmxKesB7gHb
	 RKQA9oZ0PFint4EqJCzomV5+lCFw/L++xKwtlEkoM1W1cYFemTSa4NckVjq3D20vqyKmr
	 fiAfKcPagGE9+Rq8ciNcNpoRSV1JOhajFQFwWWHDfr0KxwBJrMZ9O/Os1hchsjjEBX93O
	 bN+BFnEi33iZVt+su+a+gQlxVZpMWizr6gJtg2tTjSf82kB/xazaSjwc0HkknxyI5dA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168693;
	bh=pa/tPH9R1gi07HfuufJwhtpUTgeky7Bl/SUkPWJ0YpE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HFTOredLxNPNJmlPco0tFG4D34W2Z8iR5S0agNvDbedULoo/w5kheOvuwWcBgpZdi
	 rYKH+MkDKEt+7JeK6VgLRQ9nEK2IFERsr/6m2A7DqQ75NDjS+Y9yHqo6oAVmxQIs8z
	 om3ZxD+N5S8hKnLp4OaZvhKNZnuqJBChPbTbyfLL0H6rtIxUykHCmPVbJEevT9jKft
	 nY7nTO+kMa++Ji0VnMUSpBxST4BrC/NglnZdWWFu3oMDqgUIjGkGGFwtNDICMPmKsz
	 VXNZTh3WjDO7kfAF08faRdzlQ1G7w4dmooSihKBuon10dJEqfIYcssnbCsbXMmv5XP
	 +dlqu4sqEmsrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 005DE40E0A;
	Fri, 20 Nov 2026 09:58:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6714FE22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5918F60E36
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHzotp84PNem for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:58:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2ED03606BD
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ED03606BD
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:09 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48e47347279so371803f8f.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168688; x=1795773488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hKvUeYdhhgvye0rWIayxfgVn7z4HhXW8H+QV+UdMKyY=;
 b=ZgMC2LSTft7LQwPsZcYHigKY3wejJ75ui7xGGqKTIwj6Rt+zUt8wsQvdxs0ik91N8x
 ewP0TkP3ipLuBw8PVROd/Bf8qlS/OPFNvAj1WQt1mngoTey88XD9MCewc+up/5wsPtjT
 20amstB8KAniImIHsZnbI+OTfl7chMOl6NW98H2cU0K84HY9vh8ORY4YtWj37PxZU+SP
 K8JV2/xLgAtFSNLVEiSP//iQbmCjXImK+GfMAUVAFmjZ1mAPW3Yw5wN06MepFSbGVvc+
 +D0DuvsOO1gD6ygvHLB2lG46J4tt7hMinWMJ8tG6RjOLtDx0GEiCfQhuurTmz6mdX/6K
 Wehg==
X-Gm-Message-State: APuU4Z+uWKDqtqui5JnTXDTZGmHkn9t4c0D+5T2CtbHCy9Wf8k1ZyC2z
 kSBnwJ3h85xZ7TOqt9CI5XHTO3ZeZa3iXpeGDwUrBwYVEZ7lbKxdL8huPjm3GrIYOKa1HnPsHQe
 jZPimHKlyMw==
X-Gm-Gg: AZFdTZe3BlBh3Nop2jwQxgpGkJ/d0F1c9Cqyuq72O3VvgCEt3MmJkOT3+9ggMEEY8fr
 VjbMHauMTbWhCMnMj5RgokxUmJRCdl+/jNXTFCOY0Te8gVIHiaNV49azLy5G7DTHi0WkPN6X9rH
 SHZPKX6wSBhKkoSrLhoHXnaxK7uNYv23XYKhqEl5QLb5mdyW8sDMPY0SWcplGfQoo3JYFQCTttA
 MmqwIey9Mi8k1T8MgjdZW4+E3i3pyRLM2LT3Vz3fhgWrAciofl+1HvKcu6NAFS8VoUkFXBUDEVX
 d7kHnQ4OX2p2jxC2T4jnzalgdSXzXxn5K/idGUcZ7Le/oiCnUiDLr9S9OAe8kjtqd1KLxtRcUsy
 +pGW//gzUAXlf8Pe+IgPY/6ibN6EcXY9MwHeOOhU147EhfUmE2QYR9JCLqa/X2mtzxQS68BsQ63
 D6UsYmOSVFgdL+NPyG3TahQhyYap4A6MfNWb25tdYAMgKFDvDSdeByWC/FnrNeD43lskf1hCHPB
 +4OKovMdc7e8librFFaJ1pmPzpFXmD01WGkRa8Idm6BkqOhBbVzaKS9Si+eHwPvFqyo5aetBJ/Q
 Ir2FCPfQUYDaW3sUJER3H7DpW+f9Jw3tW3WOo9zblzoU
X-Received: by 2002:a05:6000:22ca:b0:487:1662:cf4c with SMTP id
 ffacd0b85a97d-4abacfea532mr5300846f8f.7.1795168687979; 
 Fri, 20 Nov 2026 01:58:07 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ad6403fdbbsm414044f8f.15.2026.11.20.01.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:58:07 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:58:01 +0100
Message-ID: <20261120095805.537025-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105215523.1641743-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: bump version to 2.44-70-g21442dba0
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 2 +-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 51e29673c3..9deb97a267 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  902d628994c2f3b30af4a7f507835079852cc8ed21d8a7f340e45dc5dae148bf  glibc-2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746-git4.tar.gz
> +sha256  5e09d1c1717d779862645ee5ad4a0a3665f2a185dc0832b1daa7b9f593f195e0  glibc-2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 435a97361b..2c202b1ce8 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
> +GLIBC_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
>  GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index becbdfae7f..8cef67f2c4 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION, SITE, and LICENSE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
> +LOCALEDEF_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
>  LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
