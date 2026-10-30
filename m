Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACEA606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MVRlXq1T
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D27E440C87;
	Fri, 30 Oct 2026 15:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xg3f80-rUWAd; Fri, 30 Oct 2026 15:27:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E94EF40C68
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374070;
	b=h8pCFIvuenfFM0i/mYiACRHcmd9/JJZ5xAV1gwrd6SLUnJYBNceydBz6ogCjINRNue0f
	 8kXVVgHA43U4rE1Dj7zFN8Ba8qzaSBFWw0MYcin0NTXeNKEE4WqA2xMmJLkySVie7JvCQ
	 HQ4cnt5KIUzXIcRQjHR3Vce+7ZqiblDaudL7KjR660cvadk/+fXqn2QKKF8rCGqKwMval
	 lbF4dECxDvhc8d2pwtpra7HhtGaHshOAWmxCpeu/O0ef9CwJ0+dfx9EU0GELtHNk91KF3
	 RYr81egH/iW7gueTMAur0tLIWyQ0y9/xS7vlUry8nJbNHuNclB1siqyUcu43SbLhwkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374070;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jHtrLBhPRE9Xgf5EmatuM60hOFvMa3avkrbdPG3TaMY=;
	b=RPZ6njpo1G0XEJLAnuZite5cxp/Xd1DMicMZ7tKWNlLi6igdsbRuUGCN4c/O7LRdT1du
	 kQJOnRaHgXs7UWt2MJ3kq7T0UD1xtz4+NT1mQUWIirILGRIvYGcRy+rRA+Dkqp+m3nhMJ
	 bJfMVXRjWEJPkDbhhZBGrDvuPNuuzlUGzIDWjx7+33iXfVM6zGr3owxbXr3n5TAf+eEXS
	 DRLKnSu5Hly8QQuTZFWyDqmX7tckc/Nr1LGBe3N6E1M/l2gufq2QzGlTE8nxVay3pimVa
	 idRrEx4tZo15GHFgP8ge8ZqxPSgNcDbe4CkhzXWFraeYbjZO0CzhXg8KUCfsueu+Udg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374070;
	bh=jHtrLBhPRE9Xgf5EmatuM60hOFvMa3avkrbdPG3TaMY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MVRlXq1TXdvu61glvlbnpA2Ts2b3SY9ITsI6Jz3syiTCtgzMsKFSVVJDrH07cy2IO
	 Rv18dPgeEtsZHrjTlhChguJfZm9vdOgjyrTCgqMSxJKCAqRn3rruaV0vRKWG4CLAt3
	 bMTmrsq2CcSysL5PM+O1sOV9tGti+Muj/EOFhxrw+j4t/SoDW9rTUl/LifT4flYSNJ
	 dKoS/TgKWBIsPF8qPEJCTR8AZjzGJqfXhr1UGiKhuoBiYlGibx1lHrTpMaMyYWM9qT
	 k76qA0ryJ8azIWyZ9//M9UY+thI7sNx31rqSYL9+UURcJwnKbYe9zX/upz7ahFtpES
	 /Yxf2OHGNh2ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94EF40C68;
	Fri, 30 Oct 2026 15:27:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 246E0D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A65840C29
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cja4ro6QVw65 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3CEEB40C12
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374034;
 b=suQf8mc6FWRCuGyGfXfZd7WvMx+HHx7LXSsP5TMzyZW/MO++eHYuxiIxr64XdYsbBqtC
 yUPAygxPMzNRBZFLx00yqmUvsm1O+RU1zfL0PsDfPX9jEXs/vqy9NBu8B+OfdYIiG5qf7
 gkURtCPlA/nygGR1+bM3IvDjgAexFdyQH+mWxXgv2VrcBu8LJJ8kf0nFuhs5lilOT2jeN
 TxCjM8C+iPaq2/4ZCt6qv2o/dUHvXiBc9WdZ8zXzjGWwmu4fXY8smStDhcAaodADTDxVs
 afngYYIeWqAEtMA8xmPsUiBVl/S3zkd0lvWWlMTiBcQ6YhtGWajLFhz5F6zpI7/+oyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374034;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=u+MAsbzGKa73AjFbXLaG9VYrtJl+eXDQNgteU5CT0MU=;
 b=KOzqDFHh1hK0boL1MHCorlPiyszMgACvUpsC361oi9q4fFFOStJuy6mOQCAirEYjKyap
 EugrKWKXT7uqGgY4Gt+srEOQQADWZjERxd316RKdgHUl9Gj+KanUZzd1J93ruDVz3ypHx
 2Qd4UlNrdqYIUnHr+/lHoahJZydxjoy+XeP52EfUkp+LpMXDBwrlp7lkOg6bnEcJgZ8Ny
 acCKjYOfnkLdwFzPIrKfnq3/OzwlpLmZJSZUukGmFeQL9GVvPwc/Y/xCjr6Hqt02xphcm
 iChtzSMluYyTpJk6cVOZ1Ks4q+Rip5Pf6gcPwl7pS81XyjLceM6GWhAeiwP3wh1ojHQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WGtglt3W; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CEEB40C12
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so6856025e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374032; x=1793978832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=u+MAsbzGKa73AjFbXLaG9VYrtJl+eXDQNgteU5CT0MU=;
 b=hQheM/vqP8D7w9KOnIwIQg5lNPb44DrvymA829nwePbAyB2KR00AO7Fvv8w+YJII6u
 fq92tLn+hFrAUcvza5L0H1gt5MdBM89gMgWnBeYn3iotcy7AJOhfh/zN8p+kHkHj6SAm
 HXA9ZXKYGrKV3R7xu9828drfGCs4NMtT6rht+49SWMGaAFRWdrN1+wWfqLmdI8H+Jg8p
 ouq/vPI/bLYDTdZbKIvuEpuT4ISfyDsWMeeasupe+Dx4FLdRn0ASoNIqxmjmFstJ3UX6
 pD0qI3dTDYQ5lJx8wMSxUoCgCurFNniYDavtY+kbGPZiqyvBrpQlMYKkxyL434K73D+/
 af6A==
X-Gm-Message-State: AFq9FYJSaSvuNYnOAeDkYGZzl5/MUHKJzT7Je2Wzsoc5kVOFP+UuExEl
 idOfAugSfYXVx5Nji/YdC9KEU4f1ROq7a1RTxndtHFT6B4rBJOJsga48PWkE+LKWbB0hpd0lkfm
 cWB953zc=
X-Gm-Gg: AYBFou02G3CJSvt94J5anjru1wEf9X+kgCOdnNN5MRu/vZe/jwTL8u1/gNtqm8gPWmR
 WsynQB57Hj8nJWYx1Oug/VCUvj7IsnL3ptcXdSBpsmwRORUKtLBFvCLERTnMynmNJvrfA6eN3ma
 TKK+Cl/AJ6NqtnHdg4jBNi7DPij9W1cz6SOMgOfiXrEfKA9J2KZ7TwiHV/yZFFQ/QQJustY/Sav
 lVFWjioJxnF9a5+he0KXjpO4StkUcxdhFsfsUaNeTJpa0+6HYCNw6bNyQyQHRXldUgY9+cxzS/n
 IYD8j4qIsJ5OHZXKGNnFs45Eb+emVhMHqkK6zPANP637T2y76ukPxGM5kd9rCWAbsyv/AFbArOf
 YwbBp3iIc8uJIyReAfFGQwSXq8G3OZd45Jms6IlTvhbeKJq8pzr2JPaM7O1UPrvyRXBxUnj3027
 p2CL7UzU/uxlCCqjZkd2zXdtfzWIrfSDuOOZ5cN5Uzby+y/uxigBA9//cAr8eF69B9XJ3VMANWt
 mAB75SuOTraT6z4iZO3krTgmmvz/cA2U+DGU1EiQcPsfe4BfnUlDnZ3U3CrGEPeGB4lhR4Nn0mV
 y9TEB5deYLfrG9x6B6i5/KgTanohgWGzqIcz4sCEisBzC+qd4v8TBonBo2X8trsSckLm6IFv
X-Received: by 2002:a05:600c:3d05:b0:4a1:faa1:3813 with SMTP id
 5b1f17b1804b1-4ac187a6960mr59731275e9.27.1793374032121; 
 Fri, 30 Oct 2026 08:27:12 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf6e63e0esm88552115e9.12.2026.10.30.08.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:11 -0700 (PDT)
To: buildroot@buildroot.org,
	Florian Larysch <fl@n621.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:09 +0100
Message-ID: <20261030152711.1906597-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020131404.7333-2-fl@n621.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to version
 1.27.3
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
> https://go.dev/doc/devel/release#go1.27.3
> https://groups.google.com/g/golang-announce/c/66pojueaQek/m/tmWX2Pq9AgAJ
> 
> Fixes CVE-2026-111943.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 6a4b03ad35..828f809395 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62  go1.27.2.src.tar.gz
> -sha256  93dae4b7f463ed1e9c65e05561ce9fc5f7cd5c4ffca5e336248d48f3a2eab5fc  go1.27.2.linux-386.tar.gz
> -sha256  ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5  go1.27.2.linux-amd64.tar.gz
> -sha256  94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8  go1.27.2.linux-arm64.tar.gz
> -sha256  e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95  go1.27.2.linux-armv6l.tar.gz
> -sha256  059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa  go1.27.2.linux-ppc64le.tar.gz
> -sha256  dfd01d1e08e4dbece2cd91e259953f87b858752037fd151da2f674c4fa09aeef  go1.27.2.linux-s390x.tar.gz
> +sha256  6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb  go1.27.3.src.tar.gz
> +sha256  cfc243057c03dd131413b91269d16b5061f87f312059c1ed78681cbb95d6afbf  go1.27.3.linux-386.tar.gz
> +sha256  65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40  go1.27.3.linux-amd64.tar.gz
> +sha256  a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49  go1.27.3.linux-arm64.tar.gz
> +sha256  d6f4e11dd7157030d7ac11c51c8f73201a2db932d593c3106b1da11cc32bfdf8  go1.27.3.linux-armv6l.tar.gz
> +sha256  f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5  go1.27.3.linux-ppc64le.tar.gz
> +sha256  62e109a6280a073c9025e1b51ea298ec1d3575d3ce62238721311f5ff2c854e6  go1.27.3.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index df6f0049bf..88b4163ce1 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.27.2
> +GO_VERSION = 1.27.3
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
