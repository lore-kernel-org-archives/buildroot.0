Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2836A606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n38zMe8R
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09464608F3;
	Fri,  6 Nov 2026 16:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-cM8MERDaO2; Fri,  6 Nov 2026 16:10:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2D6B060A38
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981409;
	b=XRv6B8Imz305uhjhvVZ2HKTCbToy4R58VE68GTRQt+NIv/Ix+O2Fz+P+t7/LrF6HkobN
	 IHb2IXlpW8vuIBLDujO1SIYOZLSgZrHlPDNIbZwdvFWTitNfpZ2jEt6CklJZdXVxmYUWc
	 LsEySqfJf4WoZN9/JMtxe8nnbq/2eEuzx2vhfRorxFOa0vKPfjxK/JHWAfzoftDZkP9ky
	 EJ083iuqDUhmHlQEXGP4rzIonuCJQTqtENAoblTUs2Kzp4p8/yjC6TJJRTN+xppvW5kKi
	 ms7i60N8nRl5Jzs9gpF760aLx30TXbOL9i8VWFYOD7fDTqX0feZK24GYrTOmodPHezg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981409;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TKkLcP9Xwafzd3s60/RNNGmTnzMgM/T07ujYwYUox3g=;
	b=OIZFJ+PaJBjBt5N24FFynxNc2bhoPp64ba9Bvp3Q2tWZDLDTb9XC0AkVoW3bPVBnMpZU
	 XJCmcOgqKwzIhJi4+4X95ci8nhTvMC4dPEW69kicoVfd3sgR9JMjQA8hSFSdTzNzVqoNh
	 NxmYzgIWjKqd2DHGpb1p6Z8SHkIWrnmikYyvfCmov9hevADjrNa4pbM3cAqk+aPJ2XAEY
	 HoFcdCFv0E7W2D4zBp1Df0Zja9/TrfO5cpujdmMppFP9j8SV3BBIHOQWdWUVboVcvN6Ek
	 s9AmiXu7Jl2hFchAm7xqDwVYrKP74019m/1jiN2WTkwJTIqudRstdtXalyKaNZW7gxw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981409;
	bh=TKkLcP9Xwafzd3s60/RNNGmTnzMgM/T07ujYwYUox3g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n38zMe8Rv1xGMuYezw7hSQTyWLwhSteJxhoqILxTMxGJMc1trydyvfoblCjsmSAX6
	 BJCEl6ZJGBcEdauyIQCnevnfxrwexAkteL6yYuQPWb1qAdH2nMuGxfVnXeJcipR0yU
	 RUX6xmHL+BvviQ6wHzItFOeY5/i1ETETYokCH00L3qmwBHVGFT9e0XyqD0sGZHz6W7
	 wpyJATQM2AkhxcwhfNxbIeXDYxQ1ZsY7ci42MwBRfDatVYyYIJYgxPEx42RUZ152lE
	 8K/D/RIbl6OR1ogxc6auE8RvuaKxlyg9Rjz8T77AcCHLpapWquY7YoFO5eA/Mj7qni
	 g9ZWRIATKNyRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D6B060A38;
	Fri,  6 Nov 2026 16:10:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFB952E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8355240917
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJ4C15WKNKS3 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B6984090B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B6984090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so675620f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981398; x=1794586198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2LfnyxsaXKBNGciIsLsl3XV26Kun1VhuoRqum5HKhTQ=;
 b=QYKca5NhaliHQ62h7ZaZNUTmMNx64AExsMI0DGYDiobzCjzC8LPgUSt91eVlPHZrYH
 4fKhZIY+Cx8LqmTIWUBpm9bUBIENokCAJRS/iG8on1ztAfkv1n9LmPD5SJIdbIYoPQBR
 7uNPsPzkkBaPQRgc3zM/CPYv7FEAVhXiWObmtN4fO0gN7Dnet2NdPY2CbH1c9rmnm9Q9
 OO9FiQifKytoPkqtYS+02HxJEKh+JDKhXi59R8dvrM9om/DKoMLDiEk8bGPKiPH0qzJZ
 SSazz4bZjBC6QN6w7/QUNyIfWDiHhdTsOOVnecSHIk/f5W5dCI6EduupU2TrdYz8hNga
 X01Q==
X-Gm-Message-State: APuU4Z8SzY25uHVivb/9AYz9KJhQJUcQcMFmq7i7VgWpGtw3vQ7mNz2S
 /oKD0UkhxPq6ADJIDLjmkHM1LGL9H6C96lN54RY9vaRk4CvY4spZx8KSk5Zni2Qfx15EisN4iof
 7stFB6C0=
X-Gm-Gg: AYBFou2FsfFhfDV4FLo0+t8zY2OGBSzbAtIE2hhKuNpWjxCcS/MYfgqw0J7Z1wTOlEn
 wC2mTJfFja9awxaQYmx9hqrzOsIYjDQOuoP5sxgIKzwkycf2hpQnI8woe6xFHpBOclRwlixpcGA
 0n4WNndTN2F3wGZ1svyDDnmbDd0iBpzsKanvsuz3i+Zgm1PquyR2vjlFlDL+xND8UO7yV+qSHLA
 GTBp3LTTpFLMrSIV/G1QXeK4XBYkqp9Zkhast8tC7zYIt3h8sQGMLPHRz2pAVgzG+XD2EKAD0Np
 UH7vU4VOdsSWlpqoyJ3ku7sMBS6QEjqcq9VMnnXPyMBS5zcFTmGrko3MF3l29YNhUNvBQRGKv6X
 2RYgJcw5OOXup1F9u/SgsuLFrjZ1QdWyZEQQwg0Vt+nM2zSDjaJdwLVs882dZAymdd0bNgtzb+1
 Au37qG1bHSvvcn+2JCxO4QBYLTRedNQakBqnLnuYqzxb0JkAT84Yq8XIG9GasTpvbTlUJEAkIHp
 AgNoBh4Wd+ibrZb3NBX+HKybPmlBx1Rx4TIUmrg7BFH0ddu5OgL6gg1/gLXskBGhh1wNFmn0Ej3
 weSReL/+cWhTjJtbT+Y+kau3+vA3pUs=
X-Received: by 2002:a05:6000:2085:b0:492:f82a:3c18 with SMTP id
 ffacd0b85a97d-492f82a3d8emr4919956f8f.23.1793981398158; 
 Fri, 06 Nov 2026 08:09:58 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d6d63b62sm4251019f8f.13.2026.11.06.08.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:57 -0800 (PST)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:54 +0100
Message-ID: <20261106160956.607403-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027145351.1527631-2-giulio.benetti@benettiengineering.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: fix build failure
 using gcc >= 14
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
> Starting with gcc 14, several C diagnostics which were previously warnings are
> errors by default. In particular, -Wincompatible-pointer-types was
> changed to a permanent error by GCC commit:
> r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
> ("c: Turn -Wincompatible-pointer-types into a permerror").
> So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> V1->V2:
> * rewritten commit log as pointed by Thomas Petazzoni
> ---
>  package/rtl8188eu/rtl8188eu.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index 5f378e0b6e..6ce398933a 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -8,7 +8,11 @@ RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
>  RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
>  RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>  RTL8188EU_LICENSE_FILES = COPYING
> -RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
> +
> +RTL8188EU_EXTRA_CFLAGS = -Wno-error
> +
> +RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m \
> +			     USER_EXTRA_CFLAGS="$(RTL8188EU_EXTRA_CFLAGS)"
>  
>  define RTL8188EU_LINUX_CONFIG_FIXUPS
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
