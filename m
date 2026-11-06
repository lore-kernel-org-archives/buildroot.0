Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD462606BFB5
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LiSCjrP8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B650860A50;
	Fri,  6 Nov 2026 16:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UN0BFoh06yvj; Fri,  6 Nov 2026 16:09:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E6AEA60A57
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981380;
	b=GW9KXe35QGubrOYKRg/jIb98nkwr1zPjrO+2MAoS68u2Bl7SBRpPIVed9zVmcro8AtBp
	 A8k9b0RfiI0VuNt3Tt7aosOZnM62PmXQFZv+n5lmRabvc4ovqy0EPygybRC7X07VW+q6P
	 nTAKmErbumIr4p8BOtoXqgufhX0Em/pnWw1BOOhOVDSRD++y8STwjMQ+hA/u7WW9d+8fR
	 U4ssWW8qAhKO7+TFYyDpWyeeNMnaA/7JvDWYF8Djix41Ww8tH5xb3QNo4z9us7SNMNmvg
	 m2QQbZRp/m2J5Y7B3IHzJHJ5RxocSAr5JZ3ZIEUEGZUI4ePfXSlppRp9H8mi6kEmLSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981380;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vU2VD5g8dQal4V1yRFo63FRaoQoquRQFuWC3ukzWmIc=;
	b=rTQCa7dKNSaS0etxbj1RK7LBCbVqstEs5kDAIBPxplV8CGwXyvM+dJmk4d+zlT/Lf0bm
	 Akzjq4IJPl0PD2cyRprqrEN1kKBPupV1liB1WsLPmyS7QIPaNIva22wjk2DtFDRf6RPNl
	 GG/DumoB4MntzmPmXf1rbscetIGE5yzW165uHkNnAJmJBD63OGsXilqoTUpOP97b4imaS
	 EdzdAnndoSu6gzODKgn4mB4sfa679KOWkAn2Qw65lzel0b15xrxatlJHfrynPJZD9tQWj
	 efVQ03VdIhizTQ0FXjXoZrKKsXgFA+buEXA/i6amAJGK9ER2/lp+3xkCjLmJMHQk/ZQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981380;
	bh=vU2VD5g8dQal4V1yRFo63FRaoQoquRQFuWC3ukzWmIc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LiSCjrP8PumbnKB9AjoJMgbccm29Tx+HB0b7GM5BfggpLJvD0oxwkCohLVJgfnAFD
	 g/v/bYXg2hZMp1EzwkAe7cscz6v0dcRa0EHWN5EuENNDEiOclXrOcF+0tdnn1bugHY
	 GgXdh0n8YmMPegzK+uMxTacqV3u368nhY9D2OagYUXwSZdt2yNhA/4EwidBh349F7K
	 1mFS/95ywBzQVWOnYmHJW1y4yXkHvK3Hh7gswiF8O4UfUi18xVk3dQYLvJ6YXNhJhT
	 ZBWy83VMHVSytfew/XEQB8nHzHALTf/EDmiAzB53me3XVEtgEXEopBLdNAOI/Qxkiv
	 D9uit8MbDEb3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6AEA60A57;
	Fri,  6 Nov 2026 16:09:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CD112E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DFDB8168A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsPQ9uHgKxbK for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4A5F681293
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A5F681293
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so5317515e9.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981339; x=1794586139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9OxqOMamlchE84vqSH2R2Enen7NTieoWQcGqX95QE1Y=;
 b=cemFEXCRbLNXLNokO35ZF7JU/NR5h08ky7fU5E/8RSc5aiwNg0oSTGLwlLkRGHzWV2
 /b6BzRvzTVJ4wo7xFy9OSitzPxs/qirOvpO8uzfXqPalZidBwhs4NRut95pbB6940DHH
 6H2/43WNGZJa+GWvRCg2ngQ10How/IJ/xIcEfvYU3vlYBITvamxU83cos6kEk1iHZclm
 AJ5sDEUX5cK2t10wu/xsrWhTZZojPOGvI4hZN0FOaW5IUSEiibYlAl5E2izkWLVCtoxt
 Pjy3JLf7yvC3JoGWiGkH00Ks2rURvf0aZE8glhgAgjFEwX2FKdePFB8Ow/Z9BWXScp+q
 MEKA==
X-Gm-Message-State: APuU4Z/CjmM5X4zgYTcejPBIoh6a7i0bl4TteV9a3UxCpe9H6ZFYtlWJ
 L5FKTmZPiYQF/G2qo8qQK0KiE8vNPhBMUWzN5/bkpdUhf7Cy8VAEmhffJvAJC/Gxe5b9rdBMVJ+
 SoFUDYXo=
X-Gm-Gg: AYBFou16pK9evDMfmA3WUkb43ZZ1Z5bt6sYd2FfU3i2daDw09zWTdjLHcSFkEjG52YH
 6CMWqEK7fm+2tmRM8dCwLGT3HGBI2upBnkrWuUUDlDQd9jUiQZ96JJhlD7C4MlJnsvCXU+EtHKi
 LC2DdRJ+6DuYr7gZ/WJNYiemh2xHUFJ87Ntkz8mgHty9oHe6H3eIhaemDgfPNhFPaMuvscg74c2
 yOzxINeN7Z7odF6kltwW4Mys80cTNd7SgVzkiJeJKuFMDC5ReuCvQLFlZnjA8ep2d8c+ktCnxhP
 q9uR4552gL6KeQAboGTZ6jFlH+ebc4ibQUn7/kzcbFsVt3wYFHF3SGPt9IPwCWNO6e7LBoqE73w
 3Bzy+0Qw7bnR3CkW9am6Z6dkk31YOjD+STx2Xj0ekDTQWxJq4JKfKiHA05/9DILpilwdTwsDgyu
 2aKItD/zRCMTLN0Cof1cGZZnI2H3JPbgcGIEJsezcp4VbrfI9Fln/dyITFHADKCzIAt2OJnoXdv
 6WcBH1gZ87t3xSzGAnpKVKp5EGSDAhxx0ola3f/ETEQc2N9fvKoJm2HSM/2Grc8GrX7ndg8gn4G
 7mTIWfpGd56S+t07PW8iEoYXClPf3UPX
X-Received: by 2002:a05:600c:c491:b0:4a4:de70:2ad4 with SMTP id
 5b1f17b1804b1-4b6dff83dc4mr56777475e9.22.1793981338889; 
 Fri, 06 Nov 2026 08:08:58 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b572bba207sm140881075e9.10.2026.11.06.08.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:08:58 -0800 (PST)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:08:55 +0100
Message-ID: <20261106160857.606879-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013164254.1476592-21-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-platformdirs: bump to
 version 4.13.0
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/python-platformdirs/python-platformdirs.hash | 4 ++--
>  package/python-platformdirs/python-platformdirs.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
> index 7f7590a6c8..b9051298de 100644
> --- a/package/python-platformdirs/python-platformdirs.hash
> +++ b/package/python-platformdirs/python-platformdirs.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/platformdirs/json
> -md5  7aed05d0c6d803af78de34d929e51bac  platformdirs-4.12.3.tar.gz
> -sha256  427fc0bb321ae0c5b037fa03238ca74820437be162e78b4848c4d4055b9b766c  platformdirs-4.12.3.tar.gz
> +md5  5872f9a2772efb2608f4444b5339f833  platformdirs-4.13.0.tar.gz
> +sha256  1aa0b0d3f224c1f07c295121e312a5a24a180d6ae5a8425ea1784b3e3863e9c0  platformdirs-4.13.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
> diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
> index 9610dccc64..dba59abfdd 100644
> --- a/package/python-platformdirs/python-platformdirs.mk
> +++ b/package/python-platformdirs/python-platformdirs.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PLATFORMDIRS_VERSION = 4.12.3
> +PYTHON_PLATFORMDIRS_VERSION = 4.13.0
>  PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
> -PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/42/23/4a86fc741c38c5b69792a4ef954b281afa69bea9f083f881de1b0d23bc07
> +PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/80/a8/66d45abadff219e36e2a824181b8f6a67e7ed4572934d6252c71c29d5731
>  PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
>  PYTHON_PLATFORMDIRS_LICENSE = MIT
>  PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
