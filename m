Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8C606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q28RgSt5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95DE0607FD;
	Mon, 16 Nov 2026 15:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99GLV66rqZ6J; Mon, 16 Nov 2026 15:39:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2571607F0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843547;
	b=MHlWC7qEB/l/slAAqI9ckZIDXx5XIM4NhknrN6es1cGSUORpQjDsydp7dj+k52XtCH1h
	 Ba51ANUDOUrwyJB7+Vfikhm1CIoSD51cX405GjF+cZ1Qp716t3sNN9HAlWyoRjuK6jpPo
	 jMjEpGeF0wTEM1ChROesRxdeVjbzefydlasQzDZVGhumPvazxzVvseMJJD5gFASxuJhi8
	 yps4eIA/UXRVbO2y7/ZbhADgEnhzOJmwKGRDtiZW3JL+7Zw530izO6FjcD7oo85ID1Q38
	 OQKsMT8XqQLpxnVPqpgAErBgWsK4ETwFq7IRcv8QA1FpcsI+Wgr+A++QYNRftl45gLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843547;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mkUEcVH4lCbsKt83nwHFmTANio9k6//nfXPISBFWVcA=;
	b=Pmr0FQ+uJ6NW88b5i4hJU9QghzI8oYdd0N+IJTmYFjT4vOLzm4C/OuRQlHc/m3IoAOwm
	 6l4u13dl4R9kJDNdX+MD2lWwMbI6ZoZWt61rVQcn6G2u+eJqEXzXHLMkwmD3IQSD2FLCU
	 93Bd+xHlveKVyTU4V0LcUZwhf+yye2nDRGKOpreTBvErW2TL13P9VXhRiSlN96BShO2+g
	 9YD10XOw6rWgRoFrg5IglRE6b/oU+sB1USQvnBCfdA4x+c3G8zvc5umaGjkZu5CiOioEu
	 KLDkfu7eP7lt5u200u3DYj62W/zo7CEhvKdebJr8X++/g23WwQTon1Wfm57fTIaPg3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843547;
	bh=mkUEcVH4lCbsKt83nwHFmTANio9k6//nfXPISBFWVcA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q28RgSt5AmbZvVMdmwKtxM61uUHKHD3vskRhsdHcNYDjPfIloF0H01DhaMyyUc0eR
	 Hl6wWxe4T+K1g0SlvrvIVBAZrrUaPxshpZt0zZCYcVuKR093jL5mgeG2/Zrscke0LB
	 0DWYUnJyDiQ7/YYQoUwNKmToimII3UWJCqDluCXVzL+AZNu3JXabNc7WzVb4Ft3ybi
	 vvK3N/miyPrurEn52hpID/CRKFn4tz6VvABixPD2HCf/0cvqQmBVLAIH6uiXFI+1K0
	 KPZRO2Pumgseo2lrPvBeSo6N2ESSqFmG8BzCd4Brwr8+ep7sJycyVqTdEkI+KqyuqR
	 JLbVre+PSqMag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2571607F0;
	Mon, 16 Nov 2026 15:39:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 635B6109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5354840282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dI9v5O8MZyii for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 71E514009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71E514009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so23149665e9.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843543; x=1795448343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bh6QmeI0dxe89Tzycy10rufge4sworAleHirPsP1uhc=;
 b=J8KfWb48MuAqetLPaWOwHZI/sNyNWvnxFzTJTLvKWw2832O9HqraGuTETxjyDmd0Am
 LZfnLh+3BvBV+j17vFUL8NG9ksVmmhDf125kUIo3MQgx5l/TnXN6mMqzLs/NTzNwj0pT
 QNGPTk3e7dDozRoH6AF5/oDezNrR7mGnTi9YXceQ4DPt+Hy6H62ewHXl/eeCkEyZEo38
 4Cr6eNkK5FrsSnAJAUxRoE0wg3djewiPIyyjnKN5MMlY57xLAf+PlhiZtvDxq1LiJGfl
 ia9s6aj39SSjwARWK3h84BjWy/FD2wpI58qManKZh+AZFgxkjodpOL6pQrOey7HwezjY
 9/fw==
X-Gm-Message-State: APuU4Z+l63X9SsEMv8gCj/ZwAKiEc8wDh1ANOHGZe6SYM8FQDemfCraE
 now+HLHnE5Q2g2E8gnAgpZULiCQgoMPxlZJJVQ5gcygRxZK/uekkB58GVNoI10KnsS4Qk0S+S0A
 VsnbL5Tc=
X-Gm-Gg: AYBFou0A9oiLGzLNs9T8lSiT/IdX515LM2exVp+PxzOvTXp6bBr+jjfVxIrEIjP/O2l
 6jEh11U11sAZ9oU70r4aItE4To04JaucmkFWn50Pb2qvSOeDfQ98Os96QW+v8+1DUMTN4mBbcOb
 CK4lYSpV6FdfY8A8GDtY8gncqRtqLBUAwTrYb5vX0DWcCk8O+1XErV9SsmkBd3OFI9BERTUnZ7c
 1DsFQQGj8MnXUQAu/UZVdk760tu5IvFRw0tcQAS0qPmffvRPbNUVXRKrkY5xi4yYOxMtqUasnpi
 XIPftssksYL5iM2bNLSdp8O8b1/Bk8LJf27rv5UKN8KnMIVXj8/BDMjFRsLu9yLPDq55QjDuyBG
 Yml6r5zbO8y2ZvpoBjS95zQW+MsiVVo34qnr2lmNkg+QidEOn3nW/JDRROK6dYSMA/7ebL//GBv
 rpPAnJC9Z1bl7xDcasxTqlsAvHvTcm1vFaBW8z1U73ob4SVG4Pt1N6esoG+4N5LX30hPLpDcLgH
 9DwJ46zq9fSMF0017YSCRVGnY6LwWRxCMmYJqtrjHH5s6wi4s42xrZt1xOKPvKLt6azYrM12gWE
 raLjjIKEArgZ+wC6aJemibjwGnOasJg=
X-Received: by 2002:a05:600c:83ca:b0:4bb:53e4:a7cc with SMTP id
 5b1f17b1804b1-4bb55a74c2emr225868105e9.30.1794843543424; 
 Mon, 16 Nov 2026 07:39:03 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c60da0a03sm18428828f8f.53.2026.11.16.07.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:03 -0800 (PST)
To: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:00 +0100
Message-ID: <20261116153902.725123-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028113331.2960539-3-adam.duskett@amarulasolutions.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 3/6] board/mender/x86_64: add a udev rule
 to create /dev/root
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> As /dev/root does not appear automatically, add a rule to
> create /dev/root. Without this rule, even running a simple command
> such as `mender -version` outputs the following warning:
> 
> ```
> WARN[0000] Could not resolve path link: /dev/root Attempting to continue
> WARN[0000] Could not resolve path link: /dev/root Attempting to continue
> ```
> 
> Note: This rule is only guaranteed to work properly with the
> mender_x86_64_efi_defconfig example configuration.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> v2 -> v3: Added a comment that this change is only guaranteed to work
>           with the mender_x86_64_efi_defconfig [Thomas]
> 
>  .../mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
> 
> diff --git a/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
> new file mode 100644
> index 0000000000..7d2ae8cb89
> --- /dev/null
> +++ b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
> @@ -0,0 +1 @@
> +SUBSYSTEM=="block", ACTION=="add|change", PROGRAM="/bin/grep -q root=/dev/%k /proc/cmdline", SYMLINK+="root"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
