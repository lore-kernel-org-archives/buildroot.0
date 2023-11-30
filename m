Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390F4C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 07:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF1B141A46;
	Thu, 30 Nov 2023 07:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF1B141A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ShX8X7OQJVX; Thu, 30 Nov 2023 07:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF8441AFC;
	Thu, 30 Nov 2023 07:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEF8441AFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0BC1BF589
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 07:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1483361B36
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 07:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1483361B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SydM_Sgh269t for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 07:55:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37F8961B35
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 07:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F8961B35
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DE17FF80A;
 Thu, 30 Nov 2023 07:55:42 +0000 (UTC)
Date: Thu, 30 Nov 2023 08:55:41 +0100
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <20231130085541.519eb02b@windsurf>
In-Reply-To: <AS1P250MB0608FF5000E2423DEE2A893DA982A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <192a91$58bkb@mail.sensor-technik.de>
 <AS1P250MB0608FF5000E2423DEE2A893DA982A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1701330942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agjU5pAY+DSkZb1LSW8F0x8GZI6RKKzfTOhOz6mw6vQ=;
 b=XXqtdfyCexcXtbj53/tK2B9yU6RYU4l0CsOq2oOk35QYSNXjCVAts+qyzVnKSusaWjy1W+
 aejKilHaOSclGf0Pv7VeXIjLx5VEXHjLYcdMj/CJazBnjEwTke5A+LM2w6MOsxrmS0BJbH
 xye5LxFVUwbtpB4PDthKUcAfO/VnD3dXiA9q3B6A1ScktpjMEyHNhXHkFTXjMhhoz4eWJ1
 paGD0dCjASCWPi302LZyzLLLRHtoM63uMFWkQLhceLZvGhn2w5Vu9MdU2f81ER+K6lJBEN
 ausKk2rFXZ2vjODqTOa/902k803ykPIvQZpEF1k8Wyd643N9vCXMRlNsZUhPZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XXqtdfyC
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2023-11-29
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alex,

The code in libzenoh-pico is stupid:

size_t _z_endpoint_config_strlen(const _z_str_intmap_t *s, const char *proto) {
    size_t len = 0;

    // Call the right configuration parser depending on the protocol
#if Z_LINK_TCP == 1
    if (_z_str_eq(proto, TCP_SCHEMA) == true) {
        len = _z_tcp_config_strlen(s);
    } else
#endif
#if Z_LINK_UDP_UNICAST == 1 || Z_LINK_UDP_MULTICAST == 1
        if (_z_str_eq(proto, UDP_SCHEMA) == true) {
        len = _z_udp_config_strlen(s);
    } else
#endif
#if Z_LINK_BLUETOOTH == 1
        if (_z_str_eq(proto, BT_SCHEMA) == true) {
        len = _z_bt_config_strlen(s);
    } else
#endif
#if Z_LINK_SERIAL == 1
        if (_z_str_eq(proto, SERIAL_SCHEMA) == true) {
        len = _z_serial_config_strlen(s);
    } else
#endif
#if Z_LINK_WS == 1
        if (_z_str_eq(proto, WS_SCHEMA) == true) {
        len = _z_ws_config_strlen(s);
    } else
#endif
    {
        __asm__("nop");
    }

    return len;
}

See the __asm__("nop"). This is completely stupid. It assumes every CPU
architecture in the world has a CPU instruction named "nop", which of
course is not true. I don't really see what they have added that, it
really doesn't make sense. I believe this final "else" block should be
dropped (as well as in the next function, that uses the same pattern).

Best regards,

Thomas

On Thu, 30 Nov 2023 07:34:37 +0000
Michel Alex <Alex.Michel@wiedemann-group.com> wrote:

> Thomas,
> 
> do you have any idea how to fix this build error?
> 
> Error: unrecognized instruction `nop'
> 
> Alex
> 
> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
> Sent: Thursday, November 30, 2023 7:38 AM
> To: Michel Alex <Alex.Michel@wiedemann-group.com>
> Subject: [autobuild.buildroot.net] Your daily results for 2023-11-29
> 
> 
> Hello,
> 
> Autobuilder failures
> ====================
> 
> Below is a list of build failures reported by the Buildroot autobuilders in relation to packages or CPU architectures you are in charge of.
> Please help us improving the quality of Buildroot by investigating those build failures and sending patches to fix them.
> 
> Results for the 'master' branch
> -------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+-------------------------
> -------------+--------------------------------+-------------------------
> -------------+--------------------------------+-------------------------
> -------------+--------------------------------+------
>     or1k     |    libzenoh-pico-0.10.0-rc     | http://autobuild.buildroot.net/results/663b631810b7e3982f35539f5d388cf5e5090654
> 
> 
> Thanks for your contribution to Buildroot!
> 
> --
> http://autobuild.buildroot.net



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
