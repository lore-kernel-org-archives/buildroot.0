Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C6DC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1148240BFC;
	Thu,  3 Nov 2022 21:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1148240BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3HNSbcg5JSv; Thu,  3 Nov 2022 21:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F67540BC0;
	Thu,  3 Nov 2022 21:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F67540BC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE1001BF968
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C982881FAF
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C982881FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aeFsApwAVGPX for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:58:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2C081FAD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F2C081FAD
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:58:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7CE61E0004;
 Thu,  3 Nov 2022 20:58:14 +0000 (UTC)
Date: Thu, 3 Nov 2022 21:58:12 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103215812.58a4ca20@windsurf>
In-Reply-To: <20221103132829.1589487-1-james.hilliard1@gmail.com>
References: <20221103132829.1589487-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYiky/FWKzeCwCWwXS4ZJc1trEgDdE5zwwCDhNJxues=;
 b=Wg2PG8I8FNvxWOa5afQWA4sc+Z237Gpn2CpRJbCsv5CdfBbKvBfiRfoKycTN1Y6q1ENbOt
 mbrFKVBESSqA1U6GRIVOfpgKOXPnGJfF5RiPtAa43x1DKkzoEnd7uJVoa3KdCWd7uGnnGq
 xOqX0m9iH0r2BS0CxM7IMExq18EEoALiEn4VSmFT1tL4Te19vA93Sf5yT6Twf4ceBnBeOh
 yh2fZfNAWo9thL8DehvolG4MMGd4Zece5WWie0mPt0xuF2FGinOHB4kK+0krL/lJZduO4H
 K83kyCItK1hWRmbCNQ96imRqJ0H7r7xmVN1XBzEi/u/npjokhI7aQXUhmxvbfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wg2PG8I8
Subject: Re: [Buildroot] [PATCH 1/1] package/python-opcua-asyncio: bump to
 version 1.0.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu,  3 Nov 2022 07:28:29 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-opcua-asyncio/python-opcua-asyncio.hash | 6 ++++--
>  package/python-opcua-asyncio/python-opcua-asyncio.mk   | 6 +++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
> index d8aee272de..36b16a1596 100644
> --- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
> +++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
> @@ -1,3 +1,5 @@
> -# Locally computed
> -sha256  e5fab37a92162351fe40cab43df09db8a2e9f8b8a2a8f13ed680aa6f6d687ec3  opcua-asyncio-0.8.4.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/asyncua/json
> +md5  a52df0dc0586abd1592c97a0274d1c9d  asyncua-1.0.0.tar.gz
> +sha256  25966e374b0c90da112a96e9dbc5cc36c123b2b60412eac6f26b04a4b0b4d91e  asyncua-1.0.0.tar.gz

Are you sure this is the same thing: opcua-asyncio-0.8.4.tar.gz and
asyncua-1.0.0.tar.gz ?

> +# Locally computed sha256 checksums
>  sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
> diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
> index 50b581037b..54f8a1d0a0 100644
> --- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
> +++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_OPCUA_ASYNCIO_VERSION = 0.8.4
> -PYTHON_OPCUA_ASYNCIO_SOURCE = opcua-asyncio-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
> -PYTHON_OPCUA_ASYNCIO_SITE = $(call github,FreeOpcUa,opcua-asyncio,$(PYTHON_OPCUA_ASYNCIO_VERSION))
> +PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.0
> +PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_ASYNCUA_VERSION).tar.gz

I don't see how this can work: this package defines
PYTHON_OPCUA_ASYNCIO_VERSION, but you use PYTHON_ASYNCUA_VERSION. Did
you test this? :-)

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
