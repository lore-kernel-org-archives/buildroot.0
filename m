Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53B7606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o+nZvNH7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2024606A8;
	Fri, 20 Nov 2026 09:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAtfJOddt-SC; Fri, 20 Nov 2026 09:59:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B995660E38
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168742;
	b=noxKfr6s2ZgaiYpmIhlst/Jf6+SL050QgRtghMJ7/EGa49bbuj3LxTX+yktQfbcm+Igm
	 iDZfaE4G8UKvovRQNcvWFmnh98c7aag2/NW0iu78Y/gRUKY8A87v1L5kR9L22i2vPbdaZ
	 6IUgJpqDhgoAXO5wB2w4zC49OXjVg5dKtxGpg7CxoujRFxeFEVHpBFBbW+BXpnVbJxbRb
	 XWaA9TpNhfO6wdmgeL3+oGmJP7S51PCvAPBD14jzZFaK44og76Wr282tcT2/uzBrPgNi3
	 Zh2wOFe3yVt8rVDfXV8VARvmdNOiuXdZUYW6awmTwumHcT61UKM/5NHh8Hm2ORvt6bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168742;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=M1/1H/AyGaPzlAPkj4FnwNP0Jb0x9bLhXvJI0oKy+so=;
	b=r+/SSmxfAPnA0qdXKfS+7ZbjIo0HZDoZ9dFEHTm3us91+UA0UKUDDWZwU+ghpMYezJLw
	 LjOlb6IfCpHQeLrC0uKzvv5fAV92P7iCtboXP5W5nZFp7uBNr4I5LLOH1W7ppb/tge9Me
	 G5fufrcDXDU4j8deqDmmtsEPKZ6wHovvsNpSjiVcr5HKiqXRkTUpDKncaR/KAuJSukdRV
	 IV1oLf/JtNKy/e2SieGp2KKzjMdsjN8kJ+mqIYKV1fhyXWREe/8mh5M64Xm8bwtgIFEEU
	 TzdZTK0U/9Zg7JOHU75KrWDugfqIgvyWLnL4ZwL+C7FmHpNT45Yk5PkPkQmRnjF/nZA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168742;
	bh=M1/1H/AyGaPzlAPkj4FnwNP0Jb0x9bLhXvJI0oKy+so=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o+nZvNH7G0EkRWV40VW0/x2TFhLA9eMip/pClNt8pIorhMhZeGEzKS/XjF5QEyuRI
	 48igqPlZJAsHZKP8134WVUveYi7DSbpZd5eylyFd2Z4R8ev5nRFuCLOYP9OF5rBAxi
	 5gtg0r8q5EVgA5iVsx63iPm8pSqGzgDGmbfeypt3sVL+XwLWw87HCo/tOloz8xwuR9
	 M77qdRN9VIyNBUBoi0n0BRnSjzn6zWqlYGqbbExOee5KRV5szgjg3ndjB8oyk68PGo
	 JHMMc6/VK7G/kL3pWF3HFOV35p2zeQau87Kh6ezvD+EelpMW25cgHMY6egiqeYdJUX
	 wVRCftajTR7Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B995660E38;
	Fri, 20 Nov 2026 09:59:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE82169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43DFA4020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRPDyX_sH6jW for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:58:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 250B04016D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 250B04016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so6311455e9.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168736; x=1795773536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kDDJam/ro8LfrI2vtWFMbZO5Fq4P13ugFII9Dun+Jl8=;
 b=mgA00glR/NNqGB0JtkpkyfaVwdi736rCLBzc1E1JOirpepKj9+t4yvDGCmL/nsj2/f
 dMLwKM+gdKn3i3MKpS2vbH/5E/e7OPF5y8dnDoc9banFI54S02PJB/j3adimM48OtKE2
 N+rZKtbSw596VTdVYVW03iFk63oLRh2+sFINvYPs8P7HmeoLCshiBW1F/E1LNdplM+JP
 ANH+ZOdocRXzk9Rr8GvevFSUiEPR9MzMa9pObKfOJkChTX34lwz61EbalEOLql+P+X+h
 Ejtr6pP70sb7dopUDfWFF4+CXkDhhARJJgkG3ptOcAq2nZHNj5VNnV680SgoSMxsnrKv
 3yQQ==
X-Gm-Message-State: APuU4Z+2sW+20B30vzAkCO8/H4afRxn8vH807s3uJEzpK8TAeOfgZSq3
 MLYo0E5YLWZF5wbgL4VWZptLkr691NmBNwDaoFjkkpn69dCfOkVNi9KMHaRXuHJGdkaBW2fexcF
 sZo539dDnYg==
X-Gm-Gg: AYBFou0J4LMlfH392mPB99VbD8NEVKcfkqaFCyX7s/bYWmFcRchoJt11KDW4/ed+0o/
 zZWR6DLWRyeJakao3FijXZodGxJE1PymjM9m6m0NtwEBG+IcJz3UdoMu/JFiB1aBEySnw84Amdj
 1Kdo2vxc9y2T9G1p1WKqkcnKgX7bqGCes9cPdqlR6gAZ6IjTMY5WJUpXCRW0hDggH6dL2yyKrBY
 ooz1SQ9Amfdlz5UTlZhAAUxaaENjbU0p/lyBGkzugQm5cO+v9Zn/tjg+XjmuRZAcnKBQdt2iU2J
 ouDgqrbKtTkAhYt8EPve0bpSuDKZ2ydk/Fq0OhHvRsjWuKI66QKiFvHcL6vLWZg+sZcBwK3UB/h
 YkT5DGC3fDC/uxYVkXazKew223kD7vaRl1fzTrRA+zLEllcPZhvqnkH48QZF70r5CMYA3sLJTj4
 1UYrqtnaR+OOgFValS4CgekxS3+rzBcAhtCtJGl4/NMHv+F5+8zpEbdCKitoTzPNH+L9AcwrjZb
 +MzPeV9LneYkffj/7HnSED5Cc4Y++QLTd//3EZc1klJZKwSJY/ZGwwK88l47tSvlZ3ig4vNEw8G
 QiofxR8a84U72Q2Q5PCyTSkNOsFyYVVF9gylkSv1x7EJ
X-Received: by 2002:a05:600c:4f50:b0:4a2:1612:637a with SMTP id
 5b1f17b1804b1-4bb888063f3mr62346115e9.16.1795168736050; 
 Fri, 20 Nov 2026 01:58:56 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849247asm71530315e9.7.2026.11.20.01.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:58:55 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:58:51 +0100
Message-ID: <20261120095854.538329-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110140830.3359501-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pru-software-support: download from
 git
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
> git.ti.com no longer serves cgit snapshots. Downloading the tarball
> now fails with HTTP 400 and the message:
> 
>   Unsupported snapshot format: pru-software-support-package-v6.0.1.tar.gz
> 
> All other archive formats fail the same way, and the tag page no longer
> offers any download links. The package is currently only fetched thanks
> to the copy on sources.buildroot.net.
> 
> Fetch the v6.0.1 tag from the git repository instead, which is still
> available. The contents of the generated tarball are identical to the
> previous snapshot tarball. Only its hash changes. The license file
> is unchanged.
> 
> As this is a change on the TI server side, all maintained branches
> (2025.02.x and later) use the same snapshot URL and are affected.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/pru-software-support/pru-software-support.hash | 2 +-
>  package/pru-software-support/pru-software-support.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
> index c9af9fe25c..3fee6d84ae 100644
> --- a/package/pru-software-support/pru-software-support.hash
> +++ b/package/pru-software-support/pru-software-support.hash
> @@ -1,3 +1,3 @@
>  # Locally-calculated hash
> -sha256  cba9e0bca3abc0041cf7ce6a30af9de440b325cf8c9bcc826485d2f837cb4cf2  pru-software-support-package-v6.0.1.tar.gz
> +sha256  a8a217fecffea91224be38fa64fb5eb0985ba0aa87b2869a27cd2780f1e370da  pru-software-support-v6.0.1-git4.tar.gz
>  sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> index d0259c5f80..de49ab0421 100644
> --- a/package/pru-software-support/pru-software-support.mk
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PRU_SOFTWARE_SUPPORT_VERSION = 6.0.1
> -PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
> -PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
> +PRU_SOFTWARE_SUPPORT_VERSION = v6.0.1
> +PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/git/pru-software-support-package/pru-software-support-package.git
> +PRU_SOFTWARE_SUPPORT_SITE_METHOD = git
>  PRU_SOFTWARE_SUPPORT_LICENSE = BSD-3-Clause, Public Domain
>  PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v6.1-Manifest.html
>  PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
