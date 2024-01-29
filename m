Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F26C47DDB
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 18:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6BB681E6B;
	Mon, 29 Jan 2024 18:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6BB681E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYjEKkzPrlQK; Mon, 29 Jan 2024 18:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08E8181E45;
	Mon, 29 Jan 2024 18:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08E8181E45
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 324841BF287
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 18:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0907140399
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 18:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0907140399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWM56Dz72Wlr for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 18:44:21 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 661B040025
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 18:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 661B040025
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 28A832C8386B;
 Mon, 29 Jan 2024 19:44:19 +0100 (CET)
Message-ID: <50ba83e2-479a-4868-b3d4-5640322dc68c@bubu1.eu>
Date: Mon, 29 Jan 2024 19:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20230919123957.2614998-1-angelo@amarulasolutions.com>
In-Reply-To: <20230919123957.2614998-1-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1706553859; bh=NYxwXT8nBbt79kEdQOWBRET7eqX8eJO5uVupbeh8R+o=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To;
 b=RtLXUkT8dX8rXRr09lQSroVkoqNA4MI0LdCrCnVpswwP1hVhRGUSIFv16+Gz7c7Tz
 9FXUW6b1Kp2wUXwm6VSPAadQ+hnOWGubyhkeIA8KfzauxejR0xO3N6g6jxqxetEvxx
 U9VejiKi9ECO/JnO57f2FwCU1hI7Rrz/+cQxMGbh9C/iYUVL98QdFdPnp8tOz/K6MH
 t8QSajeWS8QlaBbxg8LyWCys4b9xQpo65dQf6YpT/KO18JJdE1oP2AWNvfq2lFz1J2
 jerAU6bc+GWkkEay+SKFnf6b2PVSRs7KQ9/dwvokOty1/57rmSXIAfrsPVoM1y4VAD
 XCrqPa9hv/xyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=RtLXUkT8
Subject: Re: [Buildroot] [PATCH] package/python-minimalmodbus: bump to
 version 2.1.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Angelo,

On 19.09.23 14:39, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>   package/python-minimalmodbus/python-minimalmodbus.hash | 2 +-
>   package/python-minimalmodbus/python-minimalmodbus.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
> index b29e83773b..635090fae7 100644
> --- a/package/python-minimalmodbus/python-minimalmodbus.hash
> +++ b/package/python-minimalmodbus/python-minimalmodbus.hash
> @@ -1,4 +1,4 @@
>   # sha256 from https://pypi.org/project/minimalmodbus
> -sha256  cf873a2530be3f4b86467c3e4d47b5f69fd345d47451baca4adbf59e2ac36d00  minimalmodbus-2.0.1.tar.gz
> +sha256  c3f5a56e107d537e4bb420f7e735841ab2939c8ca6fb528f5fe4124571315b64  minimalmodbus-2.1.1.tar.gz
>   # Hash for license file
>   sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
> diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
> index b463cf9ffe..5a6e7733be 100644
> --- a/package/python-minimalmodbus/python-minimalmodbus.mk
> +++ b/package/python-minimalmodbus/python-minimalmodbus.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_MINIMALMODBUS_VERSION = 2.0.1
> +PYTHON_MINIMALMODBUS_VERSION = 2.1.1

AFAICT this bump broke the package. For whatever reason this installs an 
empty package for me.

Switching the setup type to pep517 fixes this/works around this.

Alternatively, this should be fixed by applying 
https://patchwork.ozlabs.org/project/buildroot/patch/20231126180840.2081945-5-james.hilliard1@gmail.com/ 
(which switches all setuptools builds to pep517) but I haven't 
specifically tested this.

>   PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
> -PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/78/99/8cd22b4465e697bae2b02fd06aaccd4c5cdfbb18945d728db99f23d71df9
> +PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/37/fc/8a58f7bcdece751f16a4a9aac780acd1288aa8ac6adbffdd764c88fb71c6
>   PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
>   PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
>   PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
