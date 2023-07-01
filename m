Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F93EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 21:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 118F4404AF;
	Sat,  1 Jul 2023 21:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 118F4404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsBqUUe95T4f; Sat,  1 Jul 2023 21:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45BA3402F7;
	Sat,  1 Jul 2023 21:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45BA3402F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 541EA1BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 21:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27A4B416E5
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 21:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27A4B416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWlEOh3_GH5u for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 21:01:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF03C416E2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF03C416E2
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 21:01:38 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5109EC0008;
 Sat,  1 Jul 2023 21:01:35 +0000 (UTC)
Date: Sat, 1 Jul 2023 23:01:34 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230701230134.6c2314e4@windsurf>
In-Reply-To: <20230613202530.612061-1-bernd.kuhls@t-online.de>
References: <20230613202530.612061-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688245295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LbpGQptRV2iSAHvWvq52cDrWIvbtmEfX4P0q/RwdUs=;
 b=llZx9hZRsVFC+J/Q8gWRnMeNbgpsR+xpPCRT769hT1QfM4/1nDV78QGJvE+dIcEYOASkat
 o+wdXHnOSL26QEhrfLIyAQoWuKNmIzjhB3D00OhAqfQyUkMbvQlNY4SO8GC/eVaO24BNvz
 ZrcQtCa+JbcQkvQFpQ0/ny0IM9H/4o5t/Md/OiqtzCXgA5mfQj9XzWKJQvpoRz2OFEZyUM
 Y4Rdk0UyrSTPViYNTGz3U7UVSiMKS4Bfg7r3zx9Z8L22F68P+TuJgitNn3fiCFaYiFZ9v2
 qc8EzCduJ4KoQDjvMm00FAzJOBSEmFiEgBBBQI6XPLqqW1UK7gNc0Nj9fJnTEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=llZx9hZR
Subject: Re: [Buildroot] [PATCH v3 1/1] package/python-pyicu: fix build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Tue, 13 Jun 2023 22:25:30 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/977/977c043615603dd3541e23b81c5f11374606aff6/
> 
> Set environment variables to cross-compile friendly values, this prevents
> icu-config picking up host libraries:
> https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L89
> https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L179
> https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L216
> 
> This follows the upstream build docs:
> https://gitlab.pyicu.org/main/pyicu#building-pyicu
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: use environment variables as proposed by the package author
> v2: prefer pkg-config (Yann), as proposed
>     https://patchwork.ozlabs.org/project/buildroot/patch/20230516173411.823978-1-bernd.kuhls@t-online.de/
> 
>  package/python-pyicu/python-pyicu.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
> index 512b2f857f..427ebbfe52 100644
> --- a/package/python-pyicu/python-pyicu.mk
> +++ b/package/python-pyicu/python-pyicu.mk
> @@ -12,4 +12,11 @@ PYTHON_PYICU_LICENSE_FILES = LICENSE
>  PYTHON_PYICU_DEPENDENCIES = icu
>  PYTHON_PYICU_SETUP_TYPE = setuptools
>  
> +PYTHON_PYICU_ENV += \
> +	ICU_VERSION="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --modversion`" \
> +	ICU_BASE="$(STAGING_DIR)/usr" \

Could you clarify where this ICU_BASE variable is used?

For the 3 other variables, I can definitely see it in the links you
have in the commit log, but not for ICU_BASE. Am I missing something?

Also, is there some sort of dependency between this patch and the
python-pyicu bump at
http://patchwork.ozlabs.org/project/buildroot/patch/20230611123108.372959-1-bernd.kuhls@t-online.de/
?

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
