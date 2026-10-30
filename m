Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCFB606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AQmKIof1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEC5481681;
	Fri, 30 Oct 2026 15:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWK--Ez0VqZ0; Fri, 30 Oct 2026 15:29:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E9D3581331
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374145;
	b=IuwyjjdZjCwwux6j6O4rk3iV5YmPV4HT4zhBaNAu53SPJjNhIAObkFgwpdi6ApxjjT3+
	 u6ZypMIZnVpjxHTFGd3vSHJWzYWzuoghjuHXZk87Upl4HhISB5oDH+JVHQhQlrbJ3DD4L
	 2b9c+ivnPRrrQN77r6tk4k78mRfbC58C5iJ73L8XhV+csSI17fW5Nv6C5yCseairD7/Dp
	 NOnZLAdhzrLR0CyxLvvhLXug3tcu7a52+JOZGNN9BCCpiOtSR5TbAciW7sNeoZzObvADi
	 vAQaGCQ264X9M6Hj3KWDtqIpM/D3oZYXRwyCxPzjZDYK0pwa5FmH/qUsKTLf9jtEzUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374145;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zo7yfNc0HbxFsMccIaFfowJqDanZMc2GHzXaT5c3iL0=;
	b=bT+EhRe31hj+bVlL1+JTE5GBX54ozwc1nXjAJ0ZfBNXvtczX+s17g+cVzeTfuL0iOuT/
	 qhszgKAe52IK/6jbO3f8w4/dXLT2uixRZMrsR+1BPwE0Qc+ZXnge46LThgtXwVsGU/eaM
	 upnW8U4WMfkWkYtVjABUaTictAS2aWBaVwInZqZUQSkcpfCVeIlOm0cvZEAfTNN0846X3
	 AzQA28X8I3XzR98AupA9srtQpaBVFUrRNILhFwcYlOQ3QPR1lnMLzmkaAFhbJbVXwtQaD
	 vIWmN5CsMcHMPpweKSJO1iNcyTBByGJ8ZkXYQ/54O4Xc53WKggoh5jMm56FpMYYjUyA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374145;
	bh=zo7yfNc0HbxFsMccIaFfowJqDanZMc2GHzXaT5c3iL0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AQmKIof1vXOYf02E3fPIYdRnpZCdYbs78tSbVBfHXTLBUsm5Qx+/CB7M4jKPoUcV5
	 3uh5+arpf16+mbPTa9zQ7SN+m5nta59ydKH8qnloq4tIHGVBAzpvko44VVAWoVCiKW
	 iwJHfaejgSuJjOKjg0sfK+CS0SpFWMPjTNCPkHEkuL4IGtb/P7jjPTgDmCsl+qa1d3
	 91Y69+ERscPix2aI2TlsdlRjM/mhOyJlxD4nqzI977rQK4h+bfMviVyzpjZsLscU1Y
	 DeX/UlFZTCeHcc5MN+tFIIWTixJMESeHuvNWSy+Tc6/1Alom/Efm3vd9kznbLSw9UI
	 qOrb9kwobMeLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D3581331;
	Fri, 30 Oct 2026 15:29:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96AD7235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CD8940530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCjVTpYE9Bu5 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 77DBB40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374080;
 b=heOkw2EXbWbFEUcuziQeQXqsEKGG3lHqvxMtRCmZToHZyAq53SALMEr5o+muVvqmAhbf
 6t5rOu0snQrNV+z8xr5dW46WVTHOek4BZWRfk4O81If9OHs8V+p0teonCp5VvUcViFofd
 LOkrbHYOUu7e0ADQl+7KRUJlQuJd3/n5RUAXQV+Oli2OIEFibM8L7pxkkXdM56F0L0izX
 oWR1SfOtc8F1nT10MLegkH4/ykQT+NIBiHlSRyKJq51fmK6H2JcEg/YiBFPqOP/ypsPg8
 mPJWJ2gsjC3DNMHcvifoDrsGHypc22rAPMtJ1SBj9wZ/5fWEU5z/nEbihWVp3tBZnVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374080;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=GxXdAbpUBwo6jwyTidzPUNbZUhLav5n+6VSLR0S2K5I=;
 b=G5gT/2EdxPJIXAcKuYPQhzj0mqn+q8eNy1Fl5Zlz/VUjU7X7yQ0jienATw11AO5z3GN0
 mQTjTVug9wIF0wbKLnWhX46mrtXBMvvSHbDqICdZhy6grhnBv8894hM1ryJX0/n7Pf2M2
 annnYlNQ4fDKC9D7OotP1g3PiVOuykJ+nC2oLaL5vsTwu4z0QCWWUI8ynjy5sq8GsPUal
 PhsAQ8vrdSOYNJJIz/mYrMP7KAROUzTFcbdnlmzD83lWFxJSJTABs23Sz/8kPwKExsB82
 1Uaha4ULs2auWYfTLY8ItXNSTS71wpZHuOmxn34E6nRexDM8UPBGPvF9uTCt5NR+D+A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F7ZgtcNx; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77DBB40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so5468215e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374078; x=1793978878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GxXdAbpUBwo6jwyTidzPUNbZUhLav5n+6VSLR0S2K5I=;
 b=KtqVE5hBZB7T51FbTl+fil+SpGfPyqIq5r6qxIqhAjqD3cLdNz+yCPJWtNkdLzySJI
 AsNMYQczl3nl3RObjMmiv7H3TAvzOxzb4P5eovqUqoQpgihfNj/kLx6Fkk2u9jkNG+dj
 U2uhCXU5Qee5L9R4Q+xjPqxTyXO+eV1oAU+84cwJ+Az9tV86vgogUNb8KZRqDT/ifqMc
 my7e9EA9QaJP1Y3j2fwzJmazy9RCl4+v7A6XI3Y9kA66Wg1cpTLWPx8+SC91CLkvqiSx
 T/g7d9dEHOKOTlq1GCxs8101zmKwzk13HfNX44zsGvgcOrPeslLZLGVvTahfk/NL14+I
 Zq9Q==
X-Gm-Message-State: AFq9FYL51xQjivKDD6bKNrkODjTUWs3Ue+RNNC2jmTV/2W+9lxgYPzbv
 Bsb4gm6kigByJxQ7WQqShudcBeHkC3pGAQbYUX0vIIl07JDUcnzYmdaf2GDhXcCKQ21mmUx+kdi
 rHXLldeQ=
X-Gm-Gg: AYBFou1NdCrYYM8VIa5Sxry6hVrpWy3HxrcuwhCwqb/183eb7DlwQjDmZ65x7bKOikK
 l46D0XAU8n+Wr705uDaxNgQzbNYpeBF2w9lao9S3yU6HoBWurx+H2SFVniP3oVxospcWAWqBgmR
 2l3esBJN1pSW+97nqrBgmsTLucZy5N4t31N+O2XMTvANt7tXFec+OTNVeseNAXXDLCgD6bSOyzM
 uNYVLo5A6SyV7f1NE4pUX2Y1VGdiU/h/dC2Js2onalKRYPNCrwL5SMDk2tMvncBoPcvFTh0T3mV
 GvByAxo1yI+v9i8FfE/+rqpL/ubZfr4CDhqumKQyqIeA+ovi7y8ovXOY5vPjCxWfB6Y1JehOa2v
 +TtB+UP+HozPX3hLFtYU4fcDOI8u6NcBe5aCbxMRlrG+Do6xLGDj3BJ9IIwJBIJqYQhm+ir+JPp
 yGKu1VlCNkMWA3/+9G+otL3oJoYUTwWrEBjf6R01JwSM6+ZU2N8spV28igLrkL1h43Di6rx6KeY
 pN0gEYl5bVOTb8NziR1uiO/gWEque3odwXxLdykksWCvSN1BLUfdnrlot9YbdHLOmLAnPV7WyvW
 NK1kre5l/r73zQLOKHutXfhy8NuNaEZbmBAn67Rww4UMsKZ96kGscFxLXpBcqbf5SLu9kz+F
X-Received: by 2002:a05:600c:8b6a:b0:4a1:e6c8:ff74 with SMTP id
 5b1f17b1804b1-4ac17e10acemr55324395e9.29.1793374077996; 
 Fri, 30 Oct 2026 08:27:57 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa80f04723sm163809585e9.5.2026.10.30.08.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:57 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:55 +0100
Message-ID: <20261030152757.1907049-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021203410.3114473-16-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 16/16] boot/uboot: add
 host-python-pkg-resources dependency
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
> Older U-Boot Binman versions import pkg_resources, which was removed
> from setuptools in version 82. Add the standalone host package when
> BR2_TARGET_UBOOT_USE_BINMAN is enabled to preserve support for these
> versions and vendor trees.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
> Changes v2 -> v3:
>   - Restrict host-python-pkg-resources to BR2_TARGET_UBOOT_USE_BINMAN.
> 
> Changes v1 -> v2:
>   - Tie host-python-pkg-resources to BR2_TARGET_UBOOT_NEEDS_PYTHON3
>     instead of BR2_TARGET_UBOOT_USE_BINMAN.
> ---
>  boot/uboot/uboot.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 99330a2f15..a7e831f6c3 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -312,6 +312,7 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
>  # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
>  UBOOT_DEPENDENCIES += \
>  	host-python-jsonschema \
> +	host-python-pkg-resources \
>  	host-python-pyyaml \
>  	host-python-yamllint
>  UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
