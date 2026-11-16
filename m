Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CEF606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ku4pXMWS
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9296407C7;
	Mon, 16 Nov 2026 15:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAFdWabq63L9; Mon, 16 Nov 2026 15:40:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F359240817
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843616;
	b=c8hxZIorXzFX55SR3UhhBdwEqMbdua4R/jxxfuNPbHl/VLN/h7xP/2zSIqVUBrGeVy/6
	 msXwXqHWAlo/S6llkaO1PlJjPVCJ6rD2CG3gpRVhigjBMiXwO4TygUiJafKITy9uzvXWv
	 uhynXowo5LwDBNO95fxX5rnYAPoOfVwFQ25W6bHiNVde3MvZiIEJY7S5vIRS3ExG506Bq
	 wIg2pMFBKrdTIfXQSfLsIZScZhVWvdNrV67k9lv99+/jrotGOxWu9Vl3DOdMDU4no3LMc
	 Db2LlNBEHDlJCwIkjni3rLn0tvj2iqSRE09G6h4lmSWRiTLgkPZEVaLKbsIx/ZALjew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843616;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jpLL5DHw6GkTd0KOTDceDe4wKJayky4Y8S7ZApPWEC0=;
	b=Z8+sMCMWChlc2ffsEdtKme6s9qAsFMoDSmP3gSCQylL8MEw1G1rGYyLk3oLXU9A6Ew5S
	 6jTRUYmh4zefvtR1Fvs+ndjtubQKauvkRrtbenqbRsXd64bBSJiSayTgt2M4yEUPftx6Z
	 JHKn1sl63kh+LAJ7liblkyAd+UEC2PNXYoq1OOeEiz8Pce+NbrT8pXH60m5mgzi4DaF1f
	 izPZCoHv9yxED1RH66JUHMt1oetHacLv9NNvPthBId1O97fY45rn3reR76uIyX025FZrp
	 dNP0mSJFzxj40ZHQ9TXLTlE3INXwRWp4mhHGd5UY9+2CFaDtVQVvUfxdqqaMGDKYrNw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843616;
	bh=jpLL5DHw6GkTd0KOTDceDe4wKJayky4Y8S7ZApPWEC0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ku4pXMWSGs2PEfY7Z8FEb7WX59AAVDi/G2+u2yQvMGDmo/9wU7wy2oXgyilWrgtH0
	 M53AabFmSl/l/0yTvD7FEBbd+Cu8fwnjqd0xLU7CvNQIPJI/cYVrlxNTBiWOVyAFQe
	 PJRT1Y6GQb6WO6c6sAF4ifRA/4Ppvi5KEPVaUjvYYNobDOvEm2ePPQ+JooYv/KI/Zv
	 562rxflr2VOwHqg1Tr2E5wwe58OMv8ANGxNQ5eGghAlW1jEDnTsgsr1aZUuZZBYjx4
	 BDiBBk4d9jkwYGyllkne0dU86DrXOmOY8ZDIZI4Epg55INnzWANYLDJAaIR9lh8aic
	 GcsscOoA8tQzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F359240817;
	Mon, 16 Nov 2026 15:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 017B7109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F354180F0C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEInL2IoGism for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B9C0680ED8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9C0680ED8
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so29879325e9.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843612; x=1795448412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TOQ5bdMeCAas+YQHCcMHNuZ6JrExbXW2wJdTGuRn4X4=;
 b=MzlEntopIXqpWwqzaOBskV/pnM0cobx+tf8CzkuVk1QHxQ/2hnkukbzxxroVn6bPtk
 UCY1RG1hD7ooSIda3uXgYgcTUphob1oBhZpF4Lwff46fZupObYkoOVcHB3SyQ7Z+vghX
 P3CydeeIjA8fUYPBnuLGmBCCVmOtl3cHgqdYf6XgstBhIdKdv1hAgwnO/KnD5trPIp92
 Eclw61q30kl5ZtVvcKAHUlnpEC8MWPSZyPNRyENUFZO0QadtBnjLno47GHdY08W6J5oK
 DJsjNJ5m+KuLxcxhr0g0E67oGWD5+ZotyEWRluSSQN9RYFBv2P3fgZhjVBnbK32bfmM2
 tH0Q==
X-Gm-Message-State: APuU4Z8ZH54MeBKqrj7Yu6KF8UQFWL0AI9Fpu7vccwNgBtrsARtYwjq3
 AigSI254dAHGjZsuQZvWYZjPVihr6c9q4X14h/o76UOAXXvp4PaX5NidpIjJN9F9hbaEhqX50Xx
 1GbeGM6Q=
X-Gm-Gg: AYBFou2Nc0FmKhaV1/2yKH336RG4OaBWQ3waB4akuhLoT6u0L7bYsRlQdWByCSiWydx
 mxG2pAHI2FMJaawGLIKtS9ow30z8zDoS0bOEf36UEx98hsgjjOGQhU2krGOrGlYfqlfL+o4V53R
 EtFEMcSRsNBdgWnrjYFayDQm7v4hTqCaDCW76J/+wfZGoLo08TCw4zNqJSpzMPW/f0/WvXBUVsr
 G04wse7bKwYY+cQ+oM1ZN0HS3GSd5hviA6Ok3BFSmVldo6ST85DEw9jIssntYKskl72HfBmczkL
 1vI+DNvEhYFTl7XVXkFyg2JdZ7NxX0VTJZMb7QVTtvSPM8dP3mJMRNlUAf/9ojG/aYoyjbGkgzi
 iFlRcaaGF8xGT5LgAvvpkjFuBFgHNViwPpL3a2xMkrcudqfiqsko3U/vvkupiOmoQtgWS9/hE4U
 yHFu2BIDmK0PBHR5X2Clv1pIPAmVJntgCJWH9alns75PbYBoKx7UC5xekgK/t8CGbj2VkT9A+K+
 H2CnLQ0is6isJeNoBJN8vcTlhbjla6ndWGirZ9flhs0pBcljVUdI/F34KMu7fWqYOFX29CIi9aZ
 3svfbfeOPrtQEDxC0UDEg4ICGBG5w4U=
X-Received: by 2002:a05:600c:3e06:b0:4bb:6947:3e1d with SMTP id
 5b1f17b1804b1-4bb6947426bmr115916595e9.20.1794843611746; 
 Mon, 16 Nov 2026 07:40:11 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb675200e4sm130201105e9.0.2026.11.16.07.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:11 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:08 +0100
Message-ID: <20261116154010.725805-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104213230.296551-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.9.16
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
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.16/ReleaseNotes?ref_type=tags
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/b463c358f25fd2d21eb0bc948d5ff23baf64ca0b
> 
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index dc7d35fa67..648c28ae80 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.9.15.tar.gz.sha256sum
> -sha256  1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3  tor-0.4.9.15.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.16.tar.gz.sha256sum
> +sha256  6180e193152f4525bdca5475168419b2a2035b963c3c60162a187f86e6160e48  tor-0.4.9.16.tar.gz
>  # Locally computed
>  sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 3f07cc356c..17a80d5bce 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.9.15
> +TOR_VERSION = 0.4.9.16
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
