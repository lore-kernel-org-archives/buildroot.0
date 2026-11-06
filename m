Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD5C606A334
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DIcgaGoZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 633EF81951;
	Fri,  6 Nov 2026 16:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id aAp4I2id7ov6; Fri,  6 Nov 2026 16:09:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5B35281911
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981381;
	b=KDtrlBe6znkBJaVemPFa/QWfXUkY9lQEaNaIQAnG5kuixPXJB7cdgHKPhvct3mcMQE31
	 m2DU3CS9usJLOkQGQfPg3Sj+1WsRu0ZNPGUVbIcKUUFy/JXmQcnu4wWaS+7pccAL2HnCt
	 58r25jw0RFqph64iZMCgVkeGtfOfx5KEeuoSPaPjPwkVY9+EomUW5BQxU+TYo/zTUWr/+
	 jr+DxdHnXkctlA/ZW6BiHfjWB/5xh0ONk1C8NQiDSzNH0uXYd5FvV65f49Cta2q05XmvG
	 hVM9Jvsnv7Z07yXQx/eE03xlsZq97PDhguk3yYovB+o3wS+YF1CC7U+SGsIuo5s/2Cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0cjXo+PWGPGQpcgGN0jX4TlZu+cIJKBIK6DF+Qpdl3Q=;
	b=Ewtzl0ouKC6Z5969KJvF5/hATgjoM8maBNbeWG7bpbk1QCnWxiQ/XquZ8FmbSGp4agGe
	 nt6EGqKcpdh+OXExGaECCRKeFFjMQYrl0zdRELNzBfQ9hKki/zLup4uAXBLu88kvNofYK
	 NMesKBx5mzg0txiAxlKG7FRXFozPyVqPSDYvhRUO+cabCB6Io2NbEnrR70r22LkEtfLmN
	 k0+7BtXzmJViROlpTSPD1MQx+kPpPMYSUlUCNL1MQ3DJwBqyfANR1EY6HWNFRwmWGtxs+
	 cpSI0j2s97BivAQzM1T3AvWn5uBlaBwVCqzEtFTTxti7HI8rBeSgr08YbIKQYEnl6Kg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981381;
	bh=0cjXo+PWGPGQpcgGN0jX4TlZu+cIJKBIK6DF+Qpdl3Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DIcgaGoZQ5A+lgOppfIROJlLlqa9znGI2WnWgPYKBtPtCJ7ruUPYPNbOVGCapw5n0
	 ntwwVxEj8cNIrv+uMiAKgvhhLiD6FP5B9ejdsTRAuFxy1+B9iJGKa/p5LOqhQqtJF9
	 eKDOIInENSUP641UzhoxN2/FwjyAw8+qrDnhTNoearVPIbJuUBBTTpgRhEzdOop1PD
	 /1ayqomLZvw+NUDwp0X3EcKlS/zBWhXL4PljTDyZ7A2GdPAFcv/Pr0Nv6anN6t7kjN
	 gw8yxcyhmbUnVBvNzi/YmvYrG9wBHiDh/r2js9S3+nSshzqgKLD0GHU+uf94gfn5nO
	 h9hH5UorZR5mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B35281911;
	Fri,  6 Nov 2026 16:09:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D9E14B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F14D400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m56bd7kQSFZh for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 46C2A403CB
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46C2A403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so6764285e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981343; x=1794586143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NOoaBhEy03eJVGr3OYl+XHEcRWPGJ2R/vg+BMYPm2jI=;
 b=2fbfJ8haE6b3dj6q7T2FJEULHvYdGSHn7xGlhq7VLd9gd3oeA9A3IVoF7H6UWICEe/
 +pzkUdG6TqeIVrb0VrCGCRrPXABzvN+/ZJXCGy0qNVBdLCwQb7Hy4JsjgXjhi37GYQEE
 dQOEAcWUY2dO8Txtr8tEhq9kp7cdNoaMq6Hve2njn0/PCfzUbJh5LS1pcx83lCTPx4Mo
 nBJN/t9prytjK2pQDbP0q3ZxfxHGPkMHryil2TtdWcF7gPYteIjQ4iRoKGT3mMOSkQtI
 whAJ4HcIaWgsWl5UBzZu2CilRbTNX/F4zpXRbbMuHMDm/kPocCvKYqf80iO99E5gQo1C
 5h0A==
X-Gm-Message-State: APuU4Z8rcYK9GTlBRP5zkgG3zag4qQvAjNgmyvdUO9okQmRdrIT5MLFL
 t5wl0CR/HjC9peafVLc4NPTB7NFHagDp2tvigvkB3uAVXyhBv0Tw0PTTtOHeDlq3RI/gEENXtG+
 Kq7uA4kU=
X-Gm-Gg: AYBFou2YeA7V8ib1q4Y/GhThWD79sESyDD4fAclzLXkYdPYW4bEGIm3Ov2Zo/SuugXq
 HUwz8YCPwjSdsWbDvm1p5ye8o6gAhCsm/jM8BBzCOVIjfeB6SoFCxit22BpYhUhHgH70oP4DaKB
 wGSZHTGrF08egFqfqwyIP3WtDZ3zMHbxd32akVoskAGjsZDiHNhmcbEVkR0lGVMlDUAs9o41N//
 pkOIZ5+8BdN/uR1DnkUc7/C1Gn/jiR1K5m6zegog7Xe5d2uUPjaLpsFSfghhcsZdgxxzEB2/boQ
 j/RT/Kz8gjvegwPJqfSdzxthGgIN+VGKEzlDgt+apFv4LiXi8weP7ansmesCW/rH170PKbFQSwa
 362IdFcG1rrVYpSaNxB55zzxsPorO9kOSIppSZuS95M5W2rPLnKo6sZWqjYrcKAsoHt6h53TBYL
 /YoyqDl3uv6w1SqPE3C7IZziMdS/4kRtZIB7Tn3mkRPVzgJkA+WENBao3OFef8n/g8eGW8ASxwc
 5rDR9ro7FMxNhC8C7c0gtflOm50aBW6CN8BM9UC5b6xWMi/uW9cNUlK3xzQGNBW1H3QcJVZfqDT
 hpJ/tOtmgFyBnO9+cv4IuH4MQDNftNQ=
X-Received: by 2002:a05:600c:1989:b0:4a2:397:73fd with SMTP id
 5b1f17b1804b1-4b6ddcf58d4mr50588765e9.12.1793981342799; 
 Fri, 06 Nov 2026 08:09:02 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7626a2804sm32212995e9.4.2026.11.06.08.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:02 -0800 (PST)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:08:59 +0100
Message-ID: <20261106160900.606906-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018182507.536698-10-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-platformdirs: bump to
 version 4.13.4
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/python-platformdirs/python-platformdirs.hash | 4 ++--
>  package/python-platformdirs/python-platformdirs.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
> index b9051298de..4948b75cd2 100644
> --- a/package/python-platformdirs/python-platformdirs.hash
> +++ b/package/python-platformdirs/python-platformdirs.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/platformdirs/json
> -md5  5872f9a2772efb2608f4444b5339f833  platformdirs-4.13.0.tar.gz
> -sha256  1aa0b0d3f224c1f07c295121e312a5a24a180d6ae5a8425ea1784b3e3863e9c0  platformdirs-4.13.0.tar.gz
> +md5  528f5df1ebe17cd5fc2ba3ff1d11fb97  platformdirs-4.13.4.tar.gz
> +sha256  dd96496961684a7f42041923f842ec7494e09f5e87aded99117e1109cd40570e  platformdirs-4.13.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
> diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
> index dba59abfdd..2e543d68f7 100644
> --- a/package/python-platformdirs/python-platformdirs.mk
> +++ b/package/python-platformdirs/python-platformdirs.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PLATFORMDIRS_VERSION = 4.13.0
> +PYTHON_PLATFORMDIRS_VERSION = 4.13.4
>  PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
> -PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/80/a8/66d45abadff219e36e2a824181b8f6a67e7ed4572934d6252c71c29d5731
> +PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/b7/89/dfd269de936e76319cf27787d9eaaca513491f635d49b0fbe7cdb6d3bf6f
>  PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
>  PYTHON_PLATFORMDIRS_LICENSE = MIT
>  PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
