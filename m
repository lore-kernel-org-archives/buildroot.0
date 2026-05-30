Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB32ACD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB8B6F5AA;
	Sat, 30 May 2026 21:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6zabcto1ejy; Sat, 30 May 2026 21:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2768B6F576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176447;
	bh=q+kgdhuVa6MHIkq9DMTT67kEfQsUs0dl+Esn6boHohM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pIFWcPRCxDvsHGjj268bKdJDYmiGuihnxJvBejbCVA8X+vUO/JhyZUVTnI+uJerOs
	 leeMce/3XHFOWVUyNH1QupBFSZRkeTAvkGnwey3vYc9KSxYl3EGTB/Y9AR8Gca5TQs
	 F7Rt+Fn7MxMzZnmTUFP+rPmcvzoyRgYsuiSvY3ZuhLEB2DTVGU/6f82KBFZtZs61Uz
	 3xg1XYqJK2dMuxKIZ/Yb/y1vOIgjSD/F0wnWhrp8ijUAcLC7ryxXF+Y2D/wY6Y9OWY
	 gd+iTtbPfL7DOEoivrxTAy+kdsksJG3Y5mvay3qZJfy+tOAShkv7yRUPxynFbQqWyJ
	 OtWY9jntCs/nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2768B6F576;
	Sat, 30 May 2026 21:27:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA14D12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFF2D6F576
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miPaGG9WWRao for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC7D461B48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC7D461B48
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC7D461B48
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:27:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B9ADE1A3755;
 Sat, 30 May 2026 21:27:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 858D06073B;
 Sat, 30 May 2026 21:27:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33DED10888CC7; 
 Sat, 30 May 2026 23:27:20 +0200 (CEST)
Date: Sat, 30 May 2026 23:27:20 +0200
To: Daniel Houck <Software@drhouck.me>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
Message-ID: <ahtVrc-CD9fLtDgO@windsurf>
References: <20260508235516.3028284-1-Software@DRHouck.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508235516.3028284-1-Software@DRHouck.me>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780176441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=UZO0g4GaqUrtjudrv3QlrJD45dSdONLBLWzwGpHpW84=;
 b=TDk5ZYgOntTbiEPDF+HpZBdW2Eo3ORU/panVuvUzt+43UsoPOuzen7hb71uKnppTlzu+sV
 miecK3nDLJpoo5HDg0gge6AtqMh6cDYlnJkfmZ7OunrBsY7W/kgSWwhraWAPUgF5+sMWxr
 2mTyPB7m69xFMaiif6hvY1yOLxH+YsSoC1f5xeB6qGm7fmNTgVai0Fs2wfH2/Nb+AGiIoS
 6xsbqx4ijs0Ga9uJNVIsQ5g1Vc/Hy6Redrp2v/mbcjI1EPs/NWEblc8GO5HBDP2oh4DU94
 4bCXuRjG38tQ/jaOh9o32JpGUht7Vr1/rL6gEnSt9h91/FlmiuyFrc2t0CZXaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=TDk5ZYgO
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: bump to version
 1.28.0
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

Hello Daniel,

Thanks for patch, and the very good commit log. Nevertheless, I have a
few questions, see below.

On Fri, May 08, 2026 at 07:52:36PM -0400, Daniel Houck wrote:

> +if BR2_PACKAGE_MICROPYTHON_LIB
> +
> +config BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI
> +	bool "micropython-lib unix-ffi modules"
> +	default y
> +	select BR2_PACKAGE_LIBFFI
> +	select BR2_PACKAGE_PCRE2 # runtime

So libffi is only needed as a dependency when
BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI=y?

>  # When building from a tarball we don't have some of the dependencies that are in
>  # the git repository as submodules
>  MICROPYTHON_MAKE_OPTS += \
> @@ -71,7 +64,8 @@ ifeq ($(BR2_PACKAGE_MICROPYTHON_LIB),y)
>  define MICROPYTHON_COLLECT_LIBS
>  	$(EXTRA_ENV) PYTHONPATH=$(@D)/tools \
>  		package/micropython/collect_micropython_lib.py \
> -		$(@D) $(@D)/.built_pylib
> +		$(@D) $(@D)/.built_pylib \
> +		$(if $(BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI),--ffi,--no-ffi)

If yes, then this change is not needed. Indeed:

ifeq ($(BR2_PACKAGE_LIBFFI),y)
MICROPYTHON_DEPENDENCIES += host-pkgconf libffi
MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=1
else
MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=0
endif

will continue to bring libffi as a dependency if BR2_PACKAGE_LIBFFI is
enabled.

> diff --git a/package/micropython/collect_micropython_lib.py b/package/micropython/collect_micropython_lib.py
> index 8dce78337a..5fb74787a9 100755
> --- a/package/micropython/collect_micropython_lib.py
> +++ b/package/micropython/collect_micropython_lib.py

Could you perhaps improve a tiny bit the commit message to explain the
changes being brought to this script?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
