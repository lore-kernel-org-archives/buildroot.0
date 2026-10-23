Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951EE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LLkQKQyY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B9960829;
	Fri, 23 Oct 2026 13:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRxszxUWT7Yj; Fri, 23 Oct 2026 13:19:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7DDBF607A1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761583;
	b=D/HNqtURbMW/jjRka1gNYjC7GiDiK4Wkxr9uOMubWowG55ubmiix5XSivRJ2xnTC/OrB
	 NKQRlioXIwNnDbAdOxRY/LNLoklj4fcDbP3iGPFPvx8/hVvWCuUwqF6HIwAchS9hAEAlJ
	 9sBvrI7OeP0xn0kXBt4u7V04Mh9Y7zUZAwzxro4o2iv5cVBHvjQifcaF3e+P4wfYh3hAh
	 6ZPtvzaATn7SzsWy27UHt+JgZR1wWXytw/pT8Va2aUDxifixzK8ALY0JtWT/V/zXuAsYL
	 BTyk8dOqaAFQvz2cn7Bw/qiYDRCd39WB3Sr+wr32ZrloP8vEsfBnm+CKAqfDnXYBJTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761583;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vcP9bpseLG8HNsujhkGAiRteSqmO40JXDoq+xST6HQY=;
	b=ajKugbCFBiwPqddqW1zarCwxrbxShdeZ2D8ePUXT099D72FyCpmSowPc3WNwbM5rIbkh
	 lPjVPKobfPE1ASIWacEvD95akFm5Er7iK/bWGUxApQzCb4AohA0ezgr5AA9sqBcLEYRTG
	 yGAVGsJyhH1x//V2dPaCIWCK4dGfvdKduDt8JS5qhYxQcYebi2sP5hkNI4P0RFPZG2URm
	 kUpNwuY1vmXS0IWRMuFtrhDQN7uvpK9KWEJh/b1dVArQ+UKQVipINQiK8BzJ74KFPsW1I
	 JT7vA4r9k1dLH5CTBKFMRLzneYd2qmWTBP2KCWcaktj66DFvgQxAGZw+HjcjO3M6zmQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761583;
	bh=vcP9bpseLG8HNsujhkGAiRteSqmO40JXDoq+xST6HQY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LLkQKQyY317MO6CVlLKtBmhgGCTpU62ovSLFfV5iwsYgaH94YDt1HC2IYjRVzRIOE
	 SGtBeVwZxEralQ2zDWEJDusdg9NLP4pLFj0gxLqUWZvN9XuSBknkjnvUch/5xWfbkQ
	 P8H3zTM2vruKC92tgWNVmVoyhvfzhGJ6IXSnPia1QMXQX5ht+KspvCSKH0LFze3PgA
	 5n0fW/8trileXRSoNHznXVVTtmNU4RiUhfZwAkNrhKKSkhRJKtMafRB+nVXJVg57Xd
	 C7eEwcJJ5fUExFP6dSDaufp1n9pelk6EpB/BQIYZ79DqRHesYgp+UKUCnogVNqklWw
	 IDOtu2OfkKywA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DDBF607A1;
	Fri, 23 Oct 2026 13:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C63356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39EB681496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQGrnt0T7e1l for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:19:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 640A98148F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761579;
 b=Z2d5zDrDi37zEtSm8EZcEr+Fxx7T5++DuN4cUaYx6VYo5IkkmiFhdb1lW6bjWGyWXLdv
 JsceunEHzZMvTl/N5EnlO03gk8vcCkzcgIGGYLKApHwIm9bO8rWw57hkfyHzZA6fEMl4V
 GCGWm9cxidijD744luONetqsS0sRS4Dmvsfa2o6JoktL+wtb0crs9QMNME52sehA86VqH
 cN4j4dhNepC81com2rLbYKag3WPt6s5lUqCPvSXeilvkq3yzsAgohNUnL2zjaxZUfQLC4
 KP8xaLMCAL14YWMpaZWhnc0dXtETt6HVQqmjJTBWpU0BhucV+7ozsGYpIpN5xYDA3VQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761579;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=PB/eOquDh42RniZIITkGjBFNNjfu6IB7eCvX+a1h8Es=;
 b=VZee1pVx5ia66k+PDLBX84GEHhPbvJrEbHooYMZmk9/4ZzfbRFtHGmIDLhdXVAUIesix
 o3D2Iv+sLUqKLwCrGAzBCyI7QbtVWK8ON5p1cYSkwfPPW4MTyckerCZA+j8j4K6bSJzEh
 gav9S6VIS0FILwGoOXakbIQlgbp9m/dzoF1PdXA99XexLlU9RwEAjTyqZvievdBCQyS04
 jgmudvpuZvWuiubm5/cDhfuA25LbhRYyPcuWP3YyOPgkqmqwTBbd9R6GviHNtgVCqiIxV
 V/1JpfVammFaPp5Udfvx+ECYtxfUfcyg4MkfSndWRdfsVGKezxOrfdTTQGz2bOdB66g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Z1OEAkf9; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 640A98148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso483049f8f.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761577; x=1793366377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PB/eOquDh42RniZIITkGjBFNNjfu6IB7eCvX+a1h8Es=;
 b=TD9CXPqFFfoc9h2QjqMZfaesSBws4FbQh9UgqcCgBQ/C9/bwWhOLgOBD3vcfoGkHqk
 dqPwwMfa6QhECda0kiMePHSmXaecea+kGEJWJQQ1rQ5kwL4JakHzCmiCC5znf9Lymrqz
 B+RVhbhPcUV4t0fw0dex0wKbjv+8TBIqMOu9uAC9AqAIpJm4ppLFm40tnwyo5G94xYqq
 iWZZygYnd0tmWUC34dKfm2B53SKenhYMD3j/Df8ve5/W6hMKGUaoNliqliagR6mDLtuz
 t2Cf+e7drMaVawI/k8NDok9w3mp8Gl2aPSQ9JChCIvpEtDWkDUNilB5O90pLLHALYqaw
 V/+w==
X-Gm-Message-State: AFq9FYLg84+anTuRDG/Dl6vSofofStdQf8S+BidVk7Fs5XsIyKvuSdTo
 Pd5dpCsGKEwJvlHVGWSDYozzIA7v/8xqluHALAiWfdQX/HcegSNCQGBG1iLBDfxI3kMRJ2+qIjd
 MQd/czk8=
X-Gm-Gg: AYBFou0cbqaYVGhTOGVymc3Z5YwwShYbGC96fu4CJ90gcaawTlFswnspdJqdpVNBOvB
 I3c9bzhTCMfkgsPKSsUrQrFzCM4DoBi6V5aCsEffkPUYVzct5AvKcM1RRTEnxFbnyYdLmkwHjO5
 WqO/2ZwF0lYBjEGpnf5v1gzZLXFBZpl3x3XzP3QBzNj3Uk72uxdbWd7TzADbOt6mDVmf27/h8u/
 ia5A0K9ScaVL4zY+Z4Cn2NBpN8lZ06GiEyVreQ5jwwBRQmS8K3Vmv7sLCrVMmn9KdfSlvTQpn8J
 tt2knlUTSZ8Dxf2QlTPM8SKUM1eMEy4nZtQhYlAQQUrD162Zjl2yHW4PgiiCAtJNf/9kmI2Q/LO
 AjPirOR4dJyFWZsw1BrKPJtgFaHigYpK9/vsUjjnexcybSm8eHGMYbNfZ+wQO0o4Ur/fafD09z9
 pGpnUrtDy8H3J6lxakD57Tp1xuETbqf3PeYGkGtXVcUbSEOmAc4ORzoUxGDgfJBexQg6mryPyPP
 L3yLKs0YeKQjIzu5vZUHPTvFWzgWfgL9qioxIgDoc/1h+yWHJI0NssFsQ==
X-Received: by 2002:a05:6000:200d:b0:48e:2b3:5269 with SMTP id
 ffacd0b85a97d-48e385bcd1dmr4006219f8f.45.1792761576910; 
 Fri, 23 Oct 2026 06:19:36 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38053821sm5075257f8f.41.2026.10.23.06.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:19:36 -0700 (PDT)
To: buildroot@buildroot.org,
	Alexander Shirokov <shirokovalexs@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:19:33 +0200
Message-ID: <20261023131935.1605855-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617161331.141666-2-shirokovalexs@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [v1,
 2/2] DEVELOPERS: move aichat to maintainer entry
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
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  DEVELOPERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d591c62805..61a7fc4104 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -87,6 +87,7 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
>  F:	package/cpp-httplib/
>  
>  N:	Alexander Shirokov <shirokovalexs@gmail.com>
> +F:	package/aichat/
>  F:	package/broot/
>  F:	package/kibi/
>  F:	package/nnn/
> @@ -131,9 +132,6 @@ F:	package/openpgm/
>  N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
>  F:	package/libest/
>  
> -N:	Alexander Shirokov <shirokovalexs@gmail.com>
> -F:	package/aichat/
> -
>  N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
>  F:	package/mini-snmpd/
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
