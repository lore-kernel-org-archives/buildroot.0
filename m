Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6081AC982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59BCC60830;
	Thu, 17 Sep 2026 07:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9L07Hubk1DRa; Thu, 17 Sep 2026 07:57:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A77FE60659
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631834;
	b=OhJu2+tg6M/VzApax2SLIDqNfCzXfYsET7UlEr9sHpywllamAQyoWAedr5XEXrtm9tfE
	 bwS1arVqgHA9bO4zbzzNNtjsfL44jlvSMuE5Zr4Vz/U7Viw3Sur2r1tsQRivJCDjLi3LM
	 qNuUe01eJZ6zCVvR155ho0D70e6Q8W3gYDTPMY5ayK6VMHsbkn/Ut9tA6S/Y9pOmRDOoJ
	 +fiZQ1gRGPzkG7cwE40Ubsp6JAwA+GRNKX7S9oL6rgOkKBDKPSng/iN8X95IyL6UAp+gB
	 hkUfrX/itV7XXcC6biRC37TJPN310HgUaDsrfqSidbsarhxN0bZj5iTD5JO5Y+sDatw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631834;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7BEX1B6eq89xUPYO3J7quy3Mz0hw/sgXRi+32HJIxzs=;
	b=Jef/zzQaFAEgt2DX/07iAQ6teAHNOvIExYESrCl3UDcNrS2YV4ZU1iFKnvailQt4Zwra
	 5H5s7CxO60OPFXGTZtIcNVMwy4ghrdogHhHpvmjdlrRcRxKgfXpxFcJO3pz0N10XPvXjq
	 DAXlAZyeFM4DAlgxtF5QB/0VW4hQto0Sh9XIS+h/8XYI9K6qH4toO0Kx96jur28shWQuT
	 WAwLn74CaYeZGOx2p9vgsY8w6X86VgyZBFnmU++ICB0GQ0cH+LWynIOQl3OXVa2aQRTxN
	 X8vYJ1u6GEBR4cXnfbWZfXfXT3dDlSvbf7S9WNkHmvI5XdNCiAYACpz8KpnJASLBVsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631834;
	bh=7BEX1B6eq89xUPYO3J7quy3Mz0hw/sgXRi+32HJIxzs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GP/KIk0JHr2oV8POrbNXqS6ZBpqQthJqebJiut1xHKzIZ6Fe/CbSURZ2BB76A7iKy
	 eolGNcLXISx/coFOtxdOcDWvtkkH8fSAtrc6IlkogPaxz6CSEfXxlz/XJHYpAXDw9q
	 04EIuBs64jhpkw+y92hvO70EQjdwGWsHy64qo7eqlkZz1cpLrMr78fFus9q6kRbyG2
	 gQXoItE+ovGd75AeIhJiSFELTHTVXOG6IaesTH9v2m/oBkNXO/PbB8C1ypUU6eS3x8
	 n+zNtH4kxPPGdNJnVcOf7xRqywhoUvdjHFLttosm4eDgUkdfwBeYyofMDMjI5HX/vr
	 tuUQVuFRobElg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A77FE60659;
	Thu, 17 Sep 2026 07:57:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED3529B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0070400F6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3cfQkcy77eW for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:57:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 65A4E400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631831;
 b=bPqCRqIaRSKjTXCJq3JZhw/Z7qJXcjBtDKg330LJ9Mnsz/rwL6249obxkL/E9kHQdqn+
 temeaZYZZ7XMj7wswR+TmbgYghqlrDmxObyb+CUceqwc565y+2ALV2KHQRzMlRHzLNd61
 XH3gtFhxBUW+EwOESv5bAhhH739JPvT5an2oRd1Srnn4QTD49D9bo87jvRdlc+DCC9Ahu
 wk+i9nx/AJMD4NC2fpDFHq4SG7CHU3mYIfcF4BqhCzYSW5V9+26Q0hqclDCbRppOsM9ph
 cHvnU4uOlVU4Soru64yYNsJUpMctNxIfWPPkwCC1TkQq/rAsRZ3fqt/ejpzjsD+Aezg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631831;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ymH+R3+57Hb6+wzvwvHQjtGRcuGfeEw5KHK9Zvf+MZU=;
 b=RlzWLlOmblVdVYXux8FxFzBYNq5kD7Db5l5WuZKN5VdlMGFp+n7TJcTS04KSZA91k/Ow
 RbWry6WHCYRXpgyy9C3rbmNHjI2hoXowERnqE8AqweYanRvO7E+lWpnpeQ0yflk4MEIFC
 gAFfke4zkS9r3lgnZfK5XjVXe8OB07uccqC4m4tVLE+90AB1ho+ULQ5e7uHYeX2MGN6ck
 MNa2d/IyOIIovjtlB8cCr/VX5sATomDGk/irzAP9oU0gJXlbd/kMa3rrjius17kFh9MiO
 XsphHxv5QcdP+lvKIXDlTuHdU/3d18jBt2Dm9DrOObwnpbovEaUd/bAZMM4GKho+txA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QF625gXn; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65A4E400F3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:57:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8BB4C1A090E;
 Thu, 17 Sep 2026 07:57:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6002C5FAA3;
 Thu, 17 Sep 2026 07:57:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C59511C7B062; 
 Thu, 17 Sep 2026 09:57:06 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:57:06 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <aqudBuB_ah9WcU9E@windsurf>
References: <aqZWi-3XxmbWmJbA@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqZWi-3XxmbWmJbA@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/chawan: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, Sep 13, 2026 at 09:53:47AM +0200, Waldemar Brodkorb wrote:
> Chawan is a text-mode web browser and pager for Unix-like systems, with
> a focus on implementing modern web standards while remaining
> self-contained, easy to understand and extensible.
> 
> It includes functionality such as CSS, inline images inside the
> terminal, and JavaScript through a small, independent browser engine.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

The AI-driven review reported by Gullient Dowan made valid
comments. On additional comment below.

> +CHAWAN_VERSION = 0.4.4
> +CHAWAN_SITE = https://git.sr.ht/~bptato/chawan/archive
> +CHAWAN_SOURCE = v$(CHAWAN_VERSION).tar.gz
> +CHAWAN_LICENSE = Public Domain
> +CHAWAN_LICENSE_FILES = UNLICENSE
> +
> +CHAWAN_DEPENDENCIES = host-nim brotli libssh2 openssl
> +
> +ifeq ($(BR2_aarch64),y)
> +CHAWAN_TARGET_ARCH = arm64
> +else ifeq ($(BR2_x86_64),y)
> +CHAWAN_TARGET_ARCH = amd64
> +else
> +CHAWAN_TARGET_ARCH = $(BR2_ARCH)
> +endif
> +
> +TARGET_CONFIGURE_OPTS += \
> +			 FLAGS="--os=linux \
> +			 --cpu:$(CHAWAN_TARGET_ARCH) \
> +			 --gcc.exe:$(TARGET_CROSS)gcc \
> +			 --gcc.linkerexe:$(TARGET_CROSS)gcc" \
> +			 PREFIX="/usr"
> +
> +define CHAWAN_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all

Pass $(TARGET_MAKE_ENV) in the environment.

> +endef
> +
> +define CHAWAN_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> +		DESTDIR=$(TARGET_DIR) install

Same.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
