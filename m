Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139ACC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB7C861168;
	Tue, 22 Nov 2022 21:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB7C861168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAXbrXMSkOSr; Tue, 22 Nov 2022 21:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E78C16115F;
	Tue, 22 Nov 2022 21:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E78C16115F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3C11BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBF10418EE
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBF10418EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id opraQcgwcDra for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:39:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C44AB4184C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C44AB4184C
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:39:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A717960005;
 Tue, 22 Nov 2022 21:39:18 +0000 (UTC)
Date: Tue, 22 Nov 2022 22:39:17 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221122223917.194d51d7@windsurf>
In-Reply-To: <20221106181946.501548-1-troglobit@gmail.com>
References: <20221105184455.GL3918838@scaer>
 <20221106181946.501548-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669153158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlqLwM4BF4m2hRCQ8FT8cpG6p7TOXV11X723LlhLB/M=;
 b=H1oVzuyf2Y8iEuwh2pytZNYWdjhTjtu+TR4fO3DIs1gsxAmQvCO9m3YxEegnEksGyTRfxo
 w3dLC8P+F6RmSYx0mmlhP/rHyGM4Vv5dvhQI4YcaSeTkFxmVI/Kq42mM72ALre3lQ9ek6H
 q0BBy/Y5Dx9lLc5prt/tBB8Qg2HIQN5o/Gq3n+9jekER0nWKkbz4+VPk7IrfySLMGJGRZB
 tP4Whi7zWJEQx3GjMwe2PfHkAz6alcxA8zP21vQRzEDSNU7iqisinvgdpQktj380eYzvaF
 LwoYZ/oiniZuI0/dBUzfGELpCi8PrHq6+YUOYq0FFecSgkn5hY0qKClMWsnQHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H1oVzuyf
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ssdp-responder: fix warnings
 from check-package and shellcheck
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Nov 2022 19:19:46 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> Summary of changes:
> 
>  - Fix use of $DAEMON, found by check-package
>    - Expects DAEMON to be name of daemon controlled by script, this
>      causes ripple efects in rest of script
>    - Recommend `chmod a-x`, .mk file installs with `-m 0755`
>  - Fix shellcheck warnings:
>    - Use "$VAR" in case of spaces in filenames
>    - recommend not using $? in if stmt, should use `if start-stop ...`
>    - mismatch in indentation in case-esac
> 
> Changes since v1:
> 
>  - Revert introduction of cmd() wrapper for start-stop-daemon, instead
>    call start-stop-daemon directly in start() and stop() functions

The changes between versions should be...

> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---

... here. So that they don't show up in the final commit log.

Applied to next with this fixed. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
