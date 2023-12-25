Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8808C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53A8140018;
	Mon, 25 Dec 2023 20:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53A8140018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlBZMray4EsP; Mon, 25 Dec 2023 20:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5025B400D6;
	Mon, 25 Dec 2023 20:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5025B400D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67B3C1BF2BE
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F8EF40939
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F8EF40939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TE0AuHPErgho for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:24:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3726240937
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3726240937
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1D5340003;
 Mon, 25 Dec 2023 20:24:15 +0000 (UTC)
Date: Mon, 25 Dec 2023 21:24:15 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231225212415.3e6b7621@windsurf>
In-Reply-To: <20231214165420.181703-6-james.hilliard1@gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
 <20231214165420.181703-6-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703535856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4u2AcXwoALcqE5FhZmeytnKhi6hIPLh4BHOI0zObkw4=;
 b=GGq6/z0XrOaNgO6cULoyvhgQNby4ncRI8J7mAEB32KtWNiFrUUAU9KZZOsCZJe9WeIahup
 t9sxlNrwjS9J09w0hQ9ryBI58qMyYXQRJDxSKh+JzMSKsKp/KMiU/8R+10y8iMUhIJI9I1
 eDtIb9b6cMg3eVS3vz9Pn2HTWavIKd2ta6HXffX0R7ZrKTErqLVRPVSfkLENElKXW+4Ms2
 kAmQ0qeYvKSJBdT8oOa+lHb6S//eHue96pmEtuumAArpWtl2VNEo6GAiBFdzBfVp7aMk+W
 3yaniqEb/jl6LVvB2gyHHYkF7JIfNU89a/NND8QFlp6cxTCsF1lcz2pVVsLvsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GGq6/z0X
Subject: Re: [Buildroot] [PATCH v3 6/8] package/python-fastapi-sessions: new
 package
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu, 14 Dec 2023 09:54:18 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I am applying this series, and I have a few questions on this patch.
They won't prevent applying the patch, they are more for my
curiosity/understanding.

> diff --git a/package/python-fastapi-sessions/Config.in b/package/python-fastapi-sessions/Config.in
> new file mode 100644
> index 0000000000..a54b072f09
> --- /dev/null
> +++ b/package/python-fastapi-sessions/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_FASTAPI_SESSIONS
> +	bool "python-fastapi-sessions"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
> +	select BR2_PACKAGE_PYTHON_FASTAPI # runtime
> +	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
> +	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime

I indeed see pydantic imported in two places:

$ grep -r pydantic *
fastapi_sessions/backends/session_backend.py:from pydantic.main import BaseModel
fastapi_sessions/frontends/implementations/cookie.py:from pydantic.main import BaseModel

However, it's not listed in setup.py or pyproject.toml, even as an
optional dependency. Is this an upstream "bug" ?

> +PYTHON_FASTAPI_SESSIONS_VERSION = 0.3.2
> +PYTHON_FASTAPI_SESSIONS_SOURCE = fastapi-sessions-$(PYTHON_FASTAPI_SESSIONS_VERSION).tar.gz
> +PYTHON_FASTAPI_SESSIONS_SITE = https://files.pythonhosted.org/packages/1d/89/da83ba47bd70101e14eca0ac57c7f300b055b70104446badfdc1dcbe813f
> +PYTHON_FASTAPI_SESSIONS_SETUP_TYPE = setuptools

I see you're using plain old setuptools, but this package has a
pyproject.toml, though it doesn't define a [build-system]. Is this why
you can't use pep517?

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
