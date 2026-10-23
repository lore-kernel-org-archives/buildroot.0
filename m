Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C25606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=D4R27YXv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=hJROsPTy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 093F4812C9;
	Fri, 23 Oct 2026 14:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SipOXVIGa0bP; Fri, 23 Oct 2026 14:20:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 600EF812D6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792765222;
	b=C/X+xwKP+xpfzUYzDYRKnSI3DnDtz9Lv+p5d84l3QpFI/NWouZcMYs4m613qPzlilDGo
	 sXy7fpPRfpTywK82nCwcIpNO6zh1o7AXAGc5NoAZn1tEfWB8NBECwj7dds17+WDF5S51e
	 iyUh+8VtnbX0c8hF7G/6SAQWHRyYWdqaqixnYJfWGGVuazwAtnZp866yuYRil1G3aUI3Z
	 hHtTTqPjFrmg1zzerxy1OZ2PvAK0O2DsxxAyZEPLmsQNc5GTbxXnXWb1IKco2KKLjysD/
	 t5KBRi65K4Xj+GajXz4OHw/wt9/5ZiXSGenC05vlcVvKiAWRlAo/CAmcjvxHN9pYCIQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792765222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=fsXnIHpOneZcuDrYVwG0/UPc61aE5wP6pNQrQyVseCE=;
	b=dgI0eEJjZAbFaeE5L1yoUrbmqeO+kb/2klxVjESK71dfnxU9ZrAOW4lDFVggT8P+qX+5
	 Qo28Bcpvw1ALLw9C2wye8Mr2OF6oFvHpgWJ4Wjd3gIhgQSn6ihjq4Z3k/iX5oHrWpDz+x
	 CD6PKYkfs1kQpEJxUzKNAWsuf0R6xf+a+Em/FMLdKeM2hN368PIgz+xvR+FUD6aXqVTAv
	 oq7KGaDIrgH/M99BoWmqh4OWIm2hUc3xGV/NZRi2HNMlc4dPQikJOE57JxPJFU3wls/pz
	 D/l/pGii9PCXq4WBmn0pn5OAQW6HykUaXYb8q4gLB+2IgAt6jKXn8mgI7c1gotGToAg==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=hJROsPTy;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792765222;
	bh=fsXnIHpOneZcuDrYVwG0/UPc61aE5wP6pNQrQyVseCE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4R27YXvCVrEPvYFtCItKgff+GGR6eGroj9fXDSv5oAtxbAiv424qsqzYRgxFshjo
	 eJRFF32/YSZtbs0vfvMcZXmeXOMqT56seM9Z62h9XvsKosgl2ra/44ME5Uze3SQ+1t
	 MkUWd3W+ohvmOnFH950PmW0t8SYh3p8GpZV9tPlxrn50nbIiajCCqPhqWfrNcyiQd6
	 DH/t9SSTAefB7TwjvEQFaA3oCRjl2THPUaTHsvsTB7w6GkY/FSyhEm9+YoqVvr0eJy
	 jIJ7zDUVw3nBs3B/lNEbW9uDYEP6mDTiX5roBwhM86aoJA6KzK5lk36DPlO90wR6MU
	 4RTDnb/CQsW1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 600EF812D6;
	Fri, 23 Oct 2026 14:20:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD6D49D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD478812D6
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9O87WaMbNlaf for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:20:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CD520812C9
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::b129"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792765219;
 b=Oq5rJMK4aeFfqljoXBnGgDskkSESo3oVMH/GyBOYDdOWT929E4fgxYsX5ps7u/14/RgE
 lgGQmZDgbxUzsl3WU8kpt2IZYh2dCkHAzORPBV+8glbi2IRC00cAh0kwsxBC9wrwq9zbm
 jhtfZWAmpOC1IrksfiwiFmSkZkhh4ir0hodO9qxHrzpO4Npdtqf+DCkeJuL/W7QdpHCJj
 4mwGlyicJSv3f0Pz8W3oW+nv8uxXDLOEZbj9HZAk2sD4HnsGNz/3mA3WBFYyXD7mbdF+4
 1jnu6Pvz5lUCeAsi3fHINamfTEVLa68vtzVNhskfF+8s2C8/89UmjJ02fVZ8/dQbN9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792765219;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=7tTMAY73nYxsCs7B2MMT6Zptt2D5IkmuRDs7aqfa8HQ=;
 b=hAbPg6D4scSMvCeKZd6NwszTB41Ui21/9vO4oDvLReEUmm5VHF1suAWYngvk1QQ5G4Mx
 gfZdSifEVRbzaM7g2GFl+ciM8i8a1A8F90dcmha5jc0QXOMKgVf+j3REygsodijqLfAme
 RvWEB4RG9VsnD7+y4f2WHNTF9IbWKCSeOGknbUP/WQPy6L9vuD9PMOFgLmpmoBlYEt1Ac
 L8FLao9zfxdg6zRJOfpVxFW96CicCp6VPJvveoVY0MfSzRakVHlfSxmDCJKphqP/4+Cuy
 HlIHuaU7fvRpRmpICc0TM3uhOcx+IOJllEm1A2VE0nP8e8CRau3QdICCV2DM88m7/bA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hJROsPTy; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::b129"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b129; helo=mail-yx1-xb129.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hJROsPTy
Received: from mail-yx1-xb129.google.com (mail-yx1-xb129.google.com
 [IPv6:2607:f8b0:4864:20::b129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD520812C9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:20:18 +0000 (UTC)
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-67989a2f9bfso885518d50.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765217; cv=none;
 d=google.com; s=arc-20260327;
 b=cq+QmE3dvAcxMhARlJiu+RwY4mFCF+9mxLcZN5F87XFa/aUQTL7P/hdAgbzTs7HTPn
 4A7RSdhgStOoJbjouPxW/M/HMm+Wj09RYtqzP81mXKd2cdjgiHJ5vs27oYmc8gw6iBwL
 8oANqqSxwgWKGeLGhFJ1tv0j8P/mS7uL4B5Oj30ca3i/DSavZLBmfssmTZoJHNB5FDxt
 oOZKLop+ZLRvZnn20SCXYJ9RMIYj/FWFkUlz9rkALC0Yt3QqedDv1UIx7umlNVexZVLa
 VzXf5+P36qAVHVcu34Fr06FSwV/UAylRndQU/rh+lM4SqXeqoPB5AkVAv1qKU8HbIqUq
 sFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7tTMAY73nYxsCs7B2MMT6Zptt2D5IkmuRDs7aqfa8HQ=;
 fh=fA4BZc4t+nOjUuCmw6nDllNtAxUe2wdX/sAYJBCY7Rc=;
 b=pP0XC+zbC0pwrlhuyMYWrqXSSgdxNLLFX6bmwe7pi7/anzc2vZLk2hHggE2Jxj9DyH
 tlaIbYK4dec/mpy/KEMO1/QFfYpLKgzsMAi+V35tsJNmWfzqJT93rt+znjjPnoynQit8
 DDL++i+w0mrDws5RjR7DNIxbZ88FbyqYm1sx63hbexF9ZbPJ9vbq7SMP5SAEdE6n5rcN
 V+hqdUCUw5KM9Zxs0KR1RJULagZ/JH9fRiCZNFjaQyjTvbvKAMgM+uPHm/516W8XioiB
 lkp7ccq1YPkYN+7ZbMQ7iGKMYUB2fDbTqb607AdXGYLNo39sfdMG2w5GhxTCKBERCYM/
 /woQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792765217; x=1793370017;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7tTMAY73nYxsCs7B2MMT6Zptt2D5IkmuRDs7aqfa8HQ=;
 b=hJROsPTyodaAzboo42lTK3/4hL2okDLcstC8YLscBbGEd4hz62EYKe9y++rrbBtWbN
 QS0UnKmzPmqyNn0MLBnupAZPq9LzjvmjR/d2nHwlFUTrmNpCVk7/lGkBsKA3X2ML31wu
 +S8NbpXtcDvFWq9VOzzFoIYaAZtXy8bAszkKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792765217; x=1793370017;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7tTMAY73nYxsCs7B2MMT6Zptt2D5IkmuRDs7aqfa8HQ=;
 b=lxUdNAeDsdbo8EjNnyKN6P+do566NOFwmr0AyvtsDupovZhc06nYpG0L0KjGrs7RZS
 Jxi9pT4qQ+Qr4vaBt/cNIfwb6MaqbJtz3J3NsG4+gW706hXU74oM7BAfwQDeO7otoPpg
 +YxDNz6uFpXGJcRe+JxNPAFuHjb4Ds5njQiF03ohxJPYdIORjsxinBHcoEJC7lplRC2S
 9sofkKTBjoWyvIywhtaT1Q1E8OVTzwn0OVZaXiD9BK0jJR30nv5C7BbAcseVHlbc4X8r
 2kIfcn6fkRYiMwwDlTj8wMtlnKht27DHyVBc1cZaEVd5vReSgYXxq+IpnKEe3vp88j40
 aEcA==
X-Gm-Message-State: AFq9FYJWNywFIBeWqOKQV7OtpPo2HggFnYtVIxp1TIYOPnxvAqq80uV1
 vXxmZF8S1VqZqrS4KDh6/Mdwuhuu0rg5dhUor6z6u8D+Y3wd2UpPrcMtSFPbdR8ogOa+KFIHXRk
 cDV0VFIahlcoe2ngA3xi5N/b7rI0zmqpCu+GYV94vDWkDcYiD7nzhe4Q=
X-Gm-Gg: AYBFou19+Yy6H2LehGP0KeFPT+2lHZAScG+LnOtLnRlE+PM63lIsvtPFmXsc3nSIq1o
 pdrYf2rqNiuHnTX8e+7wgcuCyk2IS7kZItrAxKMYeqv/coRbBlRIYui6jJ0J41/F7tJPWHZSx7K
 W239BvuSJDU7o9l6DRz7/D6cCyU5qIb6CZFKItvk/mvfghTXV06+9+RL7o7rnNscISMh7Bct/3e
 YD+zxBq9m0ethmkc3qWePdikww/WSusB2/kxQheZeVTP9CAOvlZlrhXJs8VqSu/uJKKLf0PDcoF
 o79T0z2VJ5iJh7b+hHfUCIBSEZAXrdJV8Jsj3DsJxahpOmvF1N54Jh2slQ1h88Db1prmoF8uzxU
 YXV8sD909mWo0iBkF3fVHxH8V/rKRc1FQXY2dgo7kn1G3JLRsJWoyEa0qkRjcO/IO1B0=
X-Received: by 2002:a05:690e:1698:b0:677:b17a:d6f with SMTP id
 956f58d0204a3-67a35c5b632mr1323766d50.65.1792765216987; Fri, 23 Oct 2026
 07:20:16 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
 <20261022151358.2260712-7-dario.binacchi@amarulasolutions.com>
 <031537e0-f176-44bf-adde-6f1dcb8ab7f8@bootlin.com>
In-Reply-To: <031537e0-f176-44bf-adde-6f1dcb8ab7f8@bootlin.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 23 Oct 2026 16:20:05 +0200
X-Gm-Features: AclHuK8xeWmpiLNm2XR_1p3e7bL3OtlKJS-f39MNXowmEZDwaaKcoRmRH89hnY8
Message-ID: <CABGWkvqQWYKPJy5TRfynGxNGv5LjQQauDQxVPERbOxK_7MQ=7A@mail.gmail.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, 
 Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-amarula@amarulasolutions.com
Subject: Re: [Buildroot] [PATCH 6/6] configs/stm32mp257f_ev1_defconfig: new
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3552974148921750432=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3552974148921750432==
Content-Type: multipart/alternative; boundary="000000000000ecb531065e82adc5"

--000000000000ecb531065e82adc5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kory,

On Fri, Oct 23, 2026 at 11:46=E2=80=AFAM Kory Maincent <kory.maincent@bootl=
in.com>
wrote:

>
>
> On 10/22/26 17:13, Dario Binacchi wrote:
> > Add support for the STM32MP257F Evaluation board (EV1) [1].
> >
> > The goal is an image built from upstream components:
> >
> > - TF-A v2.15.0
> > - U-Boot 2026.10
> > - Linux 7.3
> >
> > configured, where possible, with the same build options used by the
> > official STMicroelectronics OpenSTLinux Yocto layers [2].
> >
> > This was not possible for OP-TEE OS. Indeed upstream OP-TEE OS does not
> > support yet, on STM32MP25, the STPMIC2 PMIC and the SCMI voltage
> > domains, which the mainline Linux device tree requires for the microSD
> > card supplies [3]. Until this is resolved, the STMicroelectronics
> > downstream version (4.0.0-stm32mp-r3) has to be used.
> >
> > Host bmap-tools is enabled to speed up the flashing of the microSD
> > card, which is much faster than with dd.
> >
> > [1] https://www.st.com/en/evaluation-tools/stm32mp257f-ev1.html
> > [2]
> https://github.com/STMicroelectronics/meta-st-stm32mp/tree/openstlinux-6.=
6-yocto-scarthgap-mpu-v26.02.18
> > [3] https://github.com/OP-TEE/optee_os/issues/8027
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >   DEVELOPERS                                    |  2 +
> >   .../stm32mp257f-ev1/genimage.cfg              | 52 ++++++++++++++
> >   .../overlay/boot/extlinux/extlinux.conf       |  4 ++
> >   .../overlay/etc/fwumdata.config               |  4 ++
> >   .../arm-trusted-firmware.hash                 |  2 +
> >   ...-arm-smc-id-of-the-SMC-watchdog-on-s.patch | 53 ++++++++++++++
> >   .../stm32mp257f-ev1/patches/linux/linux.hash  |  2 +
> >   ...2mp25-rename-the-PCIe-bus-SCMI-clock.patch | 44 ++++++++++++
> >   .../patches/optee-os/optee-os.hash            |  2 +
> >   .../stm32mp257f-ev1/patches/uboot/uboot.hash  |  2 +
> >   .../stm32mp257f-ev1/post-image.sh             | 18 +++++
> >   .../stm32mp257f-ev1/readme.txt                | 72 ++++++++++++++++++=
+
> >   configs/stm32mp257f_ev1_defconfig             | 66 +++++++++++++++++
> >   13 files changed, 323 insertions(+)
> >   create mode 100644
> board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg
> >   create mode 100644
> board/stmicroelectronics/stm32mp257f-ev1/overlay/boot/extlinux/extlinux.c=
onf
> >   create mode 100644
> board/stmicroelectronics/stm32mp257f-ev1/overlay/etc/fwumdata.config
> >   create mode 100644
> board/stmicroelectronics/stm32mp257f-ev1/patches/arm-trusted-firmware/arm=
-trusted-firmware.hash
> >   create mode 100644
> board/stmicroelectronics/stm32mp257f-ev1/patches/linux/0001-arm64-dts-st-=
fix-arm-smc-id-of-the-SMC-watchdog-on-s.patch
> >   create mode 100644
> board/stmicroelectronics/stm32mp257f-ev1/patches/linux/linux.hash
> >   create mode 100644
> board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/0001-dts-stm32m=
p25-rename-the-PCIe-bus-SCMI-clock.patch
> >   create mode 100644
> board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/optee-os.hash
> >   create mode 100644
> board/stmicroelectronics/stm32mp257f-ev1/patches/uboot/uboot.hash
> >   create mode 100755
> board/stmicroelectronics/stm32mp257f-ev1/post-image.sh
> >   create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/readme.tx=
t
> >   create mode 100644 configs/stm32mp257f_ev1_defconfig
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index c188cd301f2c..24ea83e428ec 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -811,6 +811,7 @@ F:        board/bsh/
> >   F:  board/stmicroelectronics/stm32f746-disco/
> >   F:  board/stmicroelectronics/stm32f769-disco/
> >   F:  board/stmicroelectronics/stm32h747-disco/
> > +F:   board/stmicroelectronics/stm32mp257f-ev1/
> >   F:  boot/stm32-ddr-phy-binary/
> >   F:  boot/ti-k3-boot-firmware/
> >   F:  configs/imx6ulz_bsh_smm_m2_defconfig
> > @@ -819,6 +820,7 @@ F:        configs/imx8mn_bsh_smm_s2_pro_defconfig
> >   F:  configs/stm32f746_disco_sd_defconfig
> >   F:  configs/stm32f769_disco_sd_defconfig
> >   F:  configs/stm32h747_disco_sd_defconfig
> > +F:   configs/stm32mp257f_ev1_defconfig
> >   F:  package/aespipe/
> >   F:  package/armadillo/
> >   F:  package/atf/
> > diff --git a/board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg
> b/board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg
> > new file mode 100644
> > index 000000000000..aec66cc7c490
> > --- /dev/null
> > +++ b/board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg
> > @@ -0,0 +1,52 @@
> > +image sdcard.img {
> > +     hdimage {
> > +             partition-table-type =3D "gpt"
> > +     }
> > +
> > +     partition fsbla1 {
> > +             image =3D "tf-a-stm32mp257f-ev1.stm32"
> > +             size =3D 256K
> > +     }
> > +
> > +     partition fsbla2 {
> > +             image =3D "tf-a-stm32mp257f-ev1.stm32"
> > +             size =3D 256K
> > +     }
> > +
> > +     partition metadata1 {
> > +             image =3D "fwu-mdata.bin"
> > +             partition-type-uuid =3D "${FWU_MDATA_TYPE_UUID}"
> > +             size =3D 256K
> > +     }
> > +
> > +     partition metadata2 {
> > +             image =3D "fwu-mdata.bin"
> > +             partition-type-uuid =3D "${FWU_MDATA_TYPE_UUID}"
> > +             size =3D 256K
> > +     }
> > +
> > +     partition fip-a {
> > +             image =3D "fip.bin"
> > +             partition-type-uuid =3D "${FIP_TYPE_UUID}"
> > +             partition-uuid =3D "${FIP_A_UUID}"
> > +             size =3D 4M
> > +     }
> > +
> > +     partition fip-b {
> > +             image =3D "fip.bin"
> > +             partition-type-uuid =3D "${FIP_TYPE_UUID}"
> > +             partition-uuid =3D "${FIP_B_UUID}"
> > +             size =3D 4M
> > +     }
> > +
> > +     partition u-boot-env {
> > +             partition-type-uuid =3D
> "3de21764-95bd-54bd-a5c3-4abe786f38a8"
> > +             size =3D 512K
> > +     }
> > +
> > +     partition rootfs {
> > +             image =3D "rootfs.ext4"
> > +             partition-uuid =3D "e91c4e10-16e6-4c0e-bd0e-77becf4a3582"
> > +             bootable =3D "yes"
> > +     }
> > +}
>
> I don't know the policy here, do we want to have this A/B complex boot
> redundancy in Buildroot upstream rather than a simple image partition
> layout?
> The FWU metadata is also not a requirement to boot the board.
>

Hi Kory,

Thanks a lot for the review.

Indeed, the FWU metadata is needed only because TF-A is built with
PSA_FWU_SUPPORT=3D1.

My idea was to stay as close as possible to what STMicroelectronics
OpenSTLinux generates by default, which enables the "fw-update" machine
feature on all the STM32MP machines, building TF-A with PSA_FWU_SUPPORT=3D1
and using this partition layout. Since a lot of the downstream support
is not in mainline yet, a configuration aligned with theirs can help the
upstreaming work, making it easier to compare the two and to follow their
developments.

It also shows the FWU multi bank boot of the firmware, with TF-A loading
the FIP from the bank selected by the FWU metadata. In my experience, this
topic is not widely known, and the example helps to get familiar with the
FWU metadata and with the mkfwumdata and fwumdata tools added by
patches 1-2.

Of course, if this is not acceptable according to the Buildroot
policy, please let me know
how to proceed.

Thanks and regards,
Dario


> ...
>
> > diff --git a/board/stmicroelectronics/stm32mp257f-ev1/post-image.sh
> b/board/stmicroelectronics/stm32mp257f-ev1/post-image.sh
> > new file mode 100755
> > index 000000000000..c68774cdb814
> > --- /dev/null
> > +++ b/board/stmicroelectronics/stm32mp257f-ev1/post-image.sh
> > @@ -0,0 +1,18 @@
> > +#!/bin/sh
> > +
> > +set -e
> > +
> > +BOARD_DIR=3D"$(dirname "$0")"
> > +
> > +# GPT partition type and partition UUIDs, also used by genimage.cfg
> > +export FWU_MDATA_TYPE_UUID=3D"8a7a84a0-8387-40f6-ab41-a8b9a5a60d23"
> > +export FIP_TYPE_UUID=3D"19d5df83-11b0-457b-be2c-7559c13142a5"
> > +export FIP_A_UUID=3D"4fd84c93-54ef-463f-a7ef-ae25ff887087"
> > +export FIP_B_UUID=3D"09c54952-d5bf-45af-acee-335303766fb3"
> > +
> > +# FWU metadata (v2): 1 image (the FIP) per bank, 2 banks (fip-a, fip-b=
)
> > +"${HOST_DIR}/bin/mkfwumdata" -g -i 1 -b 2 -v 2 \
> > +
>  "${FWU_MDATA_TYPE_UUID},${FIP_TYPE_UUID},${FIP_A_UUID},${FIP_B_UUID}" \
> > +     "${BINARIES_DIR}/fwu-mdata.bin"
> > +
> > +support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
>
> Same question here, do we want to use FWU metadata in the Buildroot
> upstream image?
>
> --
> K=C3=B6ry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>
>

--=20
*Dario Binacchi*
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

--000000000000ecb531065e82adc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Kory,</div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 23, 20=
26 at 11:46=E2=80=AFAM Kory Maincent &lt;<a href=3D"mailto:kory.maincent@bo=
otlin.com">kory.maincent@bootlin.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
<br>
On 10/22/26 17:13, Dario Binacchi wrote:<br>
&gt; Add support for the STM32MP257F Evaluation board (EV1) [1].<br>
&gt; <br>
&gt; The goal is an image built from upstream components:<br>
&gt; <br>
&gt; - TF-A v2.15.0<br>
&gt; - U-Boot 2026.10<br>
&gt; - Linux 7.3<br>
&gt; <br>
&gt; configured, where possible, with the same build options used by the<br=
>
&gt; official STMicroelectronics OpenSTLinux Yocto layers [2].<br>
&gt; <br>
&gt; This was not possible for OP-TEE OS. Indeed upstream OP-TEE OS does no=
t<br>
&gt; support yet, on STM32MP25, the STPMIC2 PMIC and the SCMI voltage<br>
&gt; domains, which the mainline Linux device tree requires for the microSD=
<br>
&gt; card supplies [3]. Until this is resolved, the STMicroelectronics<br>
&gt; downstream version (4.0.0-stm32mp-r3) has to be used.<br>
&gt; <br>
&gt; Host bmap-tools is enabled to speed up the flashing of the microSD<br>
&gt; card, which is much faster than with dd.<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.st.com/en/evaluation-tools/stm32mp257f-ev1.=
html" rel=3D"noreferrer" target=3D"_blank">https://www.st.com/en/evaluation=
-tools/stm32mp257f-ev1.html</a><br>
&gt; [2] <a href=3D"https://github.com/STMicroelectronics/meta-st-stm32mp/t=
ree/openstlinux-6.6-yocto-scarthgap-mpu-v26.02.18" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/STMicroelectronics/meta-st-stm32mp/tree/ope=
nstlinux-6.6-yocto-scarthgap-mpu-v26.02.18</a><br>
&gt; [3] <a href=3D"https://github.com/OP-TEE/optee_os/issues/8027" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/OP-TEE/optee_os/issues/802=
7</a><br>
&gt; <br>
&gt; Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@ama=
rulasolutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a=
>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0.../stm32mp257f-ev1/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 52 ++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../overlay/boot/extlinux/extlinux.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 ++<br>
&gt;=C2=A0 =C2=A0.../overlay/etc/fwumdata.config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++<br>
&gt;=C2=A0 =C2=A0.../arm-trusted-firmware.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0...-arm-smc-id-of-the-SMC-watchdog-on-s.patch | 53 +++++++=
+++++++<br>
&gt;=C2=A0 =C2=A0.../stm32mp257f-ev1/patches/linux/linux.hash=C2=A0 |=C2=A0=
 2 +<br>
&gt;=C2=A0 =C2=A0...2mp25-rename-the-PCIe-bus-SCMI-clock.patch | 44 +++++++=
+++++<br>
&gt;=C2=A0 =C2=A0.../patches/optee-os/optee-os.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0.../stm32mp257f-ev1/patches/uboot/uboot.hash=C2=A0 |=C2=A0=
 2 +<br>
&gt;=C2=A0 =C2=A0.../stm32mp257f-ev1/post-image.sh=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++<br>
&gt;=C2=A0 =C2=A0.../stm32mp257f-ev1/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 72 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0configs/stm32mp257f_ev1_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 66 +++++++++++++++++<br>
&gt;=C2=A0 =C2=A013 files changed, 323 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/genimage.cfg<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/overlay/boot/extlinux/extlinux.conf<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/overlay/etc/fwumdata.config<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/patches/arm-trusted-firmware/arm-trusted-firmware.hash<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/patches/linux/0001-arm64-dts-st-fix-arm-smc-id-of-the-SMC-watchdog-on-s.p=
atch<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/patches/linux/linux.hash<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/patches/optee-os/0001-dts-stm32mp25-rename-the-PCIe-bus-SCMI-clock.patch<=
br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/patches/optee-os/optee-os.hash<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/patches/uboot/uboot.hash<br>
&gt;=C2=A0 =C2=A0create mode 100755 board/stmicroelectronics/stm32mp257f-ev=
1/post-image.sh<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/stmicroelectronics/stm32mp257f-ev=
1/readme.txt<br>
&gt;=C2=A0 =C2=A0create mode 100644 configs/stm32mp257f_ev1_defconfig<br>
&gt; <br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index c188cd301f2c..24ea83e428ec 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -811,6 +811,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 board/bsh/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 board/stmicroelectronics/stm32f746-disco/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 board/stmicroelectronics/stm32f769-disco/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 board/stmicroelectronics/stm32h747-disco/<br>
&gt; +F:=C2=A0 =C2=A0board/stmicroelectronics/stm32mp257f-ev1/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 boot/stm32-ddr-phy-binary/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 boot/ti-k3-boot-firmware/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 configs/imx6ulz_bsh_smm_m2_defconfig<br>
&gt; @@ -819,6 +820,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs/imx8mn_bsh_s=
mm_s2_pro_defconfig<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 configs/stm32f746_disco_sd_defconfig<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 configs/stm32f769_disco_sd_defconfig<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 configs/stm32h747_disco_sd_defconfig<br>
&gt; +F:=C2=A0 =C2=A0configs/stm32mp257f_ev1_defconfig<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/aespipe/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/armadillo/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/atf/<br>
&gt; diff --git a/board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg b/b=
oard/stmicroelectronics/stm32mp257f-ev1/genimage.cfg<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..aec66cc7c490<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg<br>
&gt; @@ -0,0 +1,52 @@<br>
&gt; +image sdcard.img {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hdimage {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-table-type =
=3D &quot;gpt&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition fsbla1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;tf-a-=
stm32mp257f-ev1.stm32&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 256K<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition fsbla2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;tf-a-=
stm32mp257f-ev1.stm32&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 256K<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition metadata1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;fwu-m=
data.bin&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type-uuid =
=3D &quot;${FWU_MDATA_TYPE_UUID}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 256K<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition metadata2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;fwu-m=
data.bin&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type-uuid =
=3D &quot;${FWU_MDATA_TYPE_UUID}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 256K<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition fip-a {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;fip.b=
in&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type-uuid =
=3D &quot;${FIP_TYPE_UUID}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-uuid =3D &q=
uot;${FIP_A_UUID}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 4M<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition fip-b {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;fip.b=
in&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type-uuid =
=3D &quot;${FIP_TYPE_UUID}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-uuid =3D &q=
uot;${FIP_B_UUID}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 4M<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition u-boot-env {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type-uuid =
=3D &quot;3de21764-95bd-54bd-a5c3-4abe786f38a8&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 512K<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;rootf=
s.ext4&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-uuid =3D &q=
uot;e91c4e10-16e6-4c0e-bd0e-77becf4a3582&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;ye=
s&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
<br>
I don&#39;t know the policy here, do we want to have this A/B complex boot =
<br>
redundancy in Buildroot upstream rather than a simple image partition <br>
layout?<br>
The FWU metadata is also not a requirement to boot the board.<br></blockquo=
te><div><br></div>Hi Kory,<br><br>Thanks a lot for the review.<br><br>Indee=
d, the FWU metadata is needed only because TF-A is built with<br>PSA_FWU_SU=
PPORT=3D1.<br><br>My idea was to stay as close as possible to what STMicroe=
lectronics<br>OpenSTLinux generates by default, which enables the &quot;fw-=
update&quot; machine<br>feature on all the STM32MP machines, building TF-A =
with PSA_FWU_SUPPORT=3D1<br>and using this partition layout. Since a lot of=
 the downstream support<br>is not in mainline yet, a configuration aligned =
with theirs can help the<br>upstreaming work, making it easier to compare t=
he two and to follow their<br>developments.<br><br>It also shows the FWU mu=
lti bank boot of the firmware, with TF-A loading<br>the FIP from the bank s=
elected by the FWU metadata. In my experience, this<br>topic is not widely =
known, and the example helps to get familiar with the<br>FWU metadata and w=
ith the mkfwumdata and fwumdata tools added by patches=C2=A01-2.<br><br>Of =
course, if this is not acceptable according to the Buildroot policy,=C2=A0p=
lease let me know</div><div class=3D"gmail_quote gmail_quote_container">how=
 to proceed.<br><br></div><div class=3D"gmail_quote gmail_quote_container">=
Thanks and regards,<br><div><span style=3D"background-color:transparent">Da=
rio</span>=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
...<br>
<br>
&gt; diff --git a/board/stmicroelectronics/stm32mp257f-ev1/post-image.sh b/=
board/stmicroelectronics/stm32mp257f-ev1/post-image.sh<br>
&gt; new file mode 100755<br>
&gt; index 000000000000..c68774cdb814<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/stmicroelectronics/stm32mp257f-ev1/post-image.sh<br>
&gt; @@ -0,0 +1,18 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +set -e<br>
&gt; +<br>
&gt; +BOARD_DIR=3D&quot;$(dirname &quot;$0&quot;)&quot;<br>
&gt; +<br>
&gt; +# GPT partition type and partition UUIDs, also used by genimage.cfg<b=
r>
&gt; +export FWU_MDATA_TYPE_UUID=3D&quot;8a7a84a0-8387-40f6-ab41-a8b9a5a60d=
23&quot;<br>
&gt; +export FIP_TYPE_UUID=3D&quot;19d5df83-11b0-457b-be2c-7559c13142a5&quo=
t;<br>
&gt; +export FIP_A_UUID=3D&quot;4fd84c93-54ef-463f-a7ef-ae25ff887087&quot;<=
br>
&gt; +export FIP_B_UUID=3D&quot;09c54952-d5bf-45af-acee-335303766fb3&quot;<=
br>
&gt; +<br>
&gt; +# FWU metadata (v2): 1 image (the FIP) per bank, 2 banks (fip-a, fip-=
b)<br>
&gt; +&quot;${HOST_DIR}/bin/mkfwumdata&quot; -g -i 1 -b 2 -v 2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;${FWU_MDATA_TYPE_UUID},${FIP_TYPE_UUID},${F=
IP_A_UUID},${FIP_B_UUID}&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;${BINARIES_DIR}/fwu-mdata.bin&quot;<br>
&gt; +<br>
&gt; +support/scripts/genimage.sh -c &quot;${BOARD_DIR}/genimage.cfg&quot;<=
br>
<br>
Same question here, do we want to use FWU metadata in the Buildroot <br>
upstream image?<br>
<br>
-- <br>
K=C3=B6ry Maincent, Bootlin<br>
Embedded Linux and kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><font color=3D"#888888"><font color=3D"#000000" =
face=3D"Times New Roman"><span style=3D"font-size:14px"><b>Dario Binacchi</=
b></span></font><br style=3D"color:rgb(0,0,0);font-family:&quot;Times New R=
oman&quot;;font-size:medium"><span style=3D"color:rgb(0,0,0);font-family:&q=
uot;Times New Roman&quot;;font-size:12px">Senior Embedded Software Engineer=
<br></span></font><span style=3D"color:rgb(0,0,0);font-family:&quot;Times N=
ew Roman&quot;;font-size:12px">M. +39 328 0625246</span><font color=3D"#888=
888"><span style=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&quot=
;;font-size:12px"><br><a href=3D"mailto:dario.binacchi@amarulasolutions.com=
" style=3D"color:rgb(17,85,204)" target=3D"_blank">dario.binacchi@amarulaso=
lutions.com</a></span><br style=3D"color:rgb(0,0,0);font-family:&quot;Times=
 New Roman&quot;;font-size:medium"><span style=3D"font-family:&quot;Times N=
ew Roman&quot;;font-size:12px;color:rgb(241,194,50)">=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95</span><br style=3D"color:rgb(0,0,0)=
;font-family:&quot;Times New Roman&quot;;font-size:medium"><span style=3D"c=
olor:rgb(0,0,0);font-family:&quot;Times New Roman&quot;;font-size:12px"><sp=
an style=3D"font-weight:700">Amarula Solutions SRL</span><br>=C2=A0Via Feli=
ce Cavallotti 25D, 41012 Carpi, MO, IT<br><a href=3D"mailto:info@amarulasol=
utions.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">info@amarulaso=
lutions.com</a><br><a href=3D"http://www.amarulasolutions.com/" style=3D"co=
lor:rgb(17,85,204)" target=3D"_blank">www.amarulasolutions.com</a></span></=
font></div></div></div>

--000000000000ecb531065e82adc5--

--===============3552974148921750432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3552974148921750432==--
