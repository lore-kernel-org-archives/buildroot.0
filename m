Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419FC606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ABUScGvb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18CDA81A58;
	Fri, 30 Oct 2026 15:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNPynEAaoTB6; Fri, 30 Oct 2026 15:29:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 20DDF81A30
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374186;
	b=c5NfwC5cXLbp9n84bvtnaJvQ5sI+C5EuGOBWAvznbwwEgt4tLvuIxBrOn0+M2gO4r8eN
	 btk15QTvYfo10Hx/xtC2eKBHvt0dKN5+qsrQWjc14eTlalQh4VoVkKq+oZdjZ7LdKNEzo
	 I5GJyIDpMFPEcBBsC9tcXn8jA4Ws7AXbinAFr3tLtB5fed/NY3IDNaUbfFxq5y566t9ep
	 M+THIobmFJ3Uccn2VWXNBGXE0mkrWvMsOGXU8ugGMIOmW/CC+c6hQ9mPQRpidVlF7Hp4o
	 hyuzlNR7K1NSa68X6S3PUM139mnqZ8+RVPu/gGF7PDEOG3I+pDe4DJh7BXIakb8D79w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7dQpdpQ/EIW3nuKA5OwjFuGgDNsWu9ov0xISzWw4kt8=;
	b=S1XalmoCjFAt57o4FWUil/rS7R2x9RVk3E9xxD+IcI6OZc0T8pXKTIo/3IGmuqUFiXyO
	 S9o6FzBzcX37ThELuKGCdcYqjrxVDP0fOHFhzHwHmvqgf0WsU76M66UfblhD+rAtuVO1S
	 /uEbGLFKPoRWCIL/FDCFFz74UWEi509lzXMyeLV80GhCYUIlb7TchLLTWBLr9113YHqzT
	 WzRujgWOdDLte3H9ZLuPlw0Q5BZnK8gfGahZcCFEm8dHEJs98uq4Kkgvexcdgo1x1KlPX
	 iGrGg/rouJsT+sZpUVT6PlG6Cy4YRWMs8S7ZZ6glPs7cGE2PWE6JExyFWsDZaNDz4NQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374186;
	bh=7dQpdpQ/EIW3nuKA5OwjFuGgDNsWu9ov0xISzWw4kt8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ABUScGvb8YM7O2qKVIfVlyVHg1lIJEZQLrm5m1G2dLQzhdMuhthD0X4L5ZG5yfAoU
	 /abJNfk1er8/1wMI7wOe6g+MB6BthmcZSg5z+Tp2KAppQJ9Hseala6cvxPw36sMf96
	 FESMOVRVNrV2YrwTxLk65u0JHnR+kfwYwFm3qKRPgwrlvwG3XxEdpksVUnqqWNyrJM
	 LeqGmuDlk3973mIiEy0GtcN+pzbL0P29PDgVXvE8qoPCJ5WIbjqn7J/TBmNbyTvW6u
	 orbMpSkB84ZylBMcsKAUHcPeJ9suMF8BdYP6c9b151zXR/36esPAPv78HjbMtE/cF/
	 QEKgGtXcHmDRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DDF81A30;
	Fri, 30 Oct 2026 15:29:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37D76235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E10D40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xume_AdMQL7 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0D53940211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374153;
 b=c/rDeeFfEc+DqJhZWEy9KKGCFILKkPrLttqieP/IM1/OMPgxNSmgFYeFYML2aHRCuLjO
 uhaZFILCWK+xYc5fK2AEgDdLIDtmOgCM8+Bkn3NXshWGVYCDsCbEOMoEfjBKRmrgQ63zE
 5grubWnJc1CwJkyYS0qZQC/LNqCUs8wb7MjGBCbTVfZa7yu/CS2hj9xmT7bai1YOOWhzl
 HZQAehlJQRrFxyQ/2Is/2Ud6FtFRS6b+3KV8Aj90iLTOUdB6TR/3ppZ5qsPMUGhGn+UDy
 rjJqVz1XaryejwuWXq7EL3ZewmFQdKGCEMyWFx4KFXqz6l5rPAz7Npmf+zmuX1djMxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374153;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=sCQbQdD5LJinQdY2HhLv3ECfLIubHue3ygxhuaiua+o=;
 b=m2iX4Y0+cOpiCU4FUQqv13aVxr6geIFRzc/g+Q73yzOjStgDlJapko3P2geKzS6cLlHL
 E9TAx2ibzAhoqbYPkB4SgkXDuAoer8jbOzYAWaLONzJogwEaEDWjTQ3XrBm9GkQOIM7Dp
 BaCu2Sui1/Z/g6F/bQBz7JOHhUCAQhdPQab/IIQw8N7ZB+aJKTKP5X0AJX31qxB9pCnQA
 y4s0wAeYIy7sYwlSSMskXBqdycYphcOTLkG0KQyTu3NNfAD2ei2rHgnkY2oyL1cSn5pj1
 kibsLCBnsHdTYLkXPB8cD/Q4WJHoch2SQceNlj9gBb0hCtvtJRGcIvMCaQjPgsDdJ9w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="QuV6VaW/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D53940211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so723668f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374151; x=1793978951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sCQbQdD5LJinQdY2HhLv3ECfLIubHue3ygxhuaiua+o=;
 b=YEYROofYczcd0Je2YEsgmn0ZjZFRiqsgZtPmL3j3SJtGrFsjl5Dxb+BlnfRIWStxfU
 pA/LRKcM/QxGPWkPMuRUsvSHnm7gefLcQ0r1iVffEQWeAMnx8Qehr2e80uq5mFGqvteR
 TJAKEMQpMKlbUPHk2rldpVgN1ddSG0z1Seiyud/jX57DQsW20TuwyrFSyQz76FPj9HYN
 LSussoEsTeO9xPoTYObDlqQAVo6vI5xoTkajdYUNRZ+aKMtt2kg75GGSR6rELIeT+ecP
 rxR4QZLuJSZaNCb8ejM5XafAdKlAFMbxf5SMSVm0ne7sDAlQpGQsDvI8zDjIeXBywEEp
 aC7g==
X-Gm-Message-State: AFq9FYKrTQTMVSbA+By0NjuhDfMnnz5M+ODmH9KMJ1Q/tRv0GjRN3I4S
 G7GqEunJhmuI0a7z6Jw5dK3R+xFmSr5Ziql4cF/Xme3fl9QVxjA8sTaX2nZ775ZdwDJaHvGa2iA
 tlkZuuuo=
X-Gm-Gg: AYBFou2zcjBw2TDH+8ocgzTyfc4Mxfw3E/hb0wRLYwMHqKjIspUMpJ49srhatNE+qC3
 wCek6u5kDuzI8kety+sURfb/+ZM0BGPrvAyHL+uN2ezFZWrPAbajDm2qnS4VIf/Z0w1Lslv8Nkb
 RyoKZtcSIPFhxr31tJSsJYp0w1dkxSExWj5gfls3TOE4YG+1QsELvNw1rrtwk1fJSjblE23kLmK
 rOOCCnPRz8YM20vNAqotZaxrvwj8HXMwhG+diwhROm/Ybej62VuybBaLAPVKNpXNCCZ5/ls7Vsc
 IH51Ngu2MIX4L+Q44ilCWtKn2g6rK22Xr9GVw7XrDi15P9qHNS1g2tdoRxS01ksB+khY832A+wb
 bmqqETtNvX8M8BVBq4xzsi8Ytks7g3xv/OYcufCmhHywuCnzoIGtyco8LqsfB5ekvHkW/QHbwjd
 /2VUoq8Kl77eklmAAkh/5a1CyyREV5+QoaRIr/ToBeCa3138MX5+Uxm2QSIXT68dh5wZ0iuzJFP
 0nCFCQ1ER3I656e0T6R2IQANqmxJIVCpYLlWz2S+WYqSqPABZ2ep1e4T25aqmrKmC5Jqxjtbxq4
 F6y0goUCVYVStP15Q0+1brn2h8zTYdAG35pPIhQf6uj5K2hQxzuOJr4MafOR0UrRIT0GmHxraup
 NlsfjynUWAvq0cq9yJQ==
X-Received: by 2002:a05:6000:2884:b0:48e:6eb1:3d02 with SMTP id
 ffacd0b85a97d-48e6eb13d20mr5527126f8f.0.1793374150910; 
 Fri, 30 Oct 2026 08:29:10 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d3e9sm4104614f8f.6.2026.10.30.08.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:10 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:08 +0100
Message-ID: <20261030152910.1907753-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023211622.2096562-3-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 3/5] package/mesa3d: crocus Gallium
 driver needs precomp-compiler
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
> Buildroot commit 59ed1137e9bb8c0157be3dc91a1cc462211dd3c7 bumped the
> package to 26.0.0 which added upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/b72d347d1c3b9e829971fbdabf993b68776083c1
> requiring the precomp-compiler for the crocus driver.
> 
> Add the necessary dependencies to fix a configure error:
> 
> ../output-1/build/mesa3d-26.1.8/meson.build:945:3: ERROR:
>  Feature llvm cannot be disabled: CLC requires LLVM
> 
> caused by
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L945
> 
> which checks the value in the variable with_clc.
> 
> When the precomp-compiler is not provided by host-mesa3d the meson
> configure option mesa-clc does not contain 'system' causing
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939
> the variable with_clc to be filled, among others, with the content of with_driver_using_cl:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939
> 
> which contains 'true' when the crocus driver is enabled:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L925
> 
> So we need to provide the precomp-compiler also for the crocus driver.
> 
> Fixes:
> https://autobuild.buildroot.org/results/baa718e140264a9aa64c3a8f4114ca1b05f740e3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> v3: no changes
> v2: no changes
> 
>  package/mesa3d/Config.in | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index feed6b68fe..e18d25eb8e 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -110,10 +110,18 @@ comment "Gallium drivers"
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
>  	bool "Gallium crocus driver"
>  	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
> +	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
>  	help
>  	  Mesa driver for gen4-7 Intel GPUs.
>  
> +comment "crocus driver needs host gcc >= 7"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on !BR2_HOST_GCC_AT_LEAST_7
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
>  	bool "Gallium Etnaviv driver"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
