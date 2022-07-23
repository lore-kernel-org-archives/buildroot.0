Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0036C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8468040AD1;
	Sat, 23 Jul 2022 12:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8468040AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQUZZX5iDAqz; Sat, 23 Jul 2022 12:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62DCB40AEA;
	Sat, 23 Jul 2022 12:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62DCB40AEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 384361BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 044F860FE0
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 044F860FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZ7cHKFPtWyb for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:50:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD8AA60FDE
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD8AA60FDE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:50:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68C6720000B;
 Sat, 23 Jul 2022 12:50:07 +0000 (UTC)
Date: Sat, 23 Jul 2022 14:50:06 +0200
To: Erik Larsson <who+buildroot@cnackers.org>
Message-ID: <20220723145006.2533b748@windsurf>
In-Reply-To: <20220101223900.2970405-3-who+buildroot@cnackers.org>
References: <20220101223900.2970405-1-who+buildroot@cnackers.org>
 <20220101223900.2970405-3-who+buildroot@cnackers.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658580607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sa4zVgrDWV35CI+Ydabn2jHiWV75jnqmOYqcpsVnLy4=;
 b=gmwQuwxIBZrlhOmTnko6JT1E8lKAS+RH/E8uRoAGXVunP04NN3nIYVtHpvjD8fzSUa7s6p
 MuDRQHTYJ3V0wn7YJMfxLICZuDaiE+JnejrpF88BuWbCFUb/oRgrxJ6vPE168G0OlBsYer
 ZPu+m3ghTOGmualkBLRreMC1erUlXZyxKYi9gEZs7FGJrOOg0aSQXfq4Y0MRGklB3xEDcz
 zXEoSVaKx5IWIbcccmo+qHXwy92zAmRTrlUNHO+6yAOomz9Wk25areBZqe84E1NmP1IbNc
 IIgDLpbzmjrc6ll1kRvKmaBKKoPPDIV41M2GtWF2c5MfCRYp5FTuFdu+r8s4SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gmwQuwxI
Subject: Re: [Buildroot] [PATCH 3/3] package/tpm2-tools: add option for
 enabling FAPI tools
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

Hello Erik,

On Sat,  1 Jan 2022 23:39:00 +0100
Erik Larsson <who+buildroot@cnackers.org> wrote:

> Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>
> ---
>  package/tpm2-tools/Config.in     | 11 +++++++++++
>  package/tpm2-tools/tpm2-tools.mk |  6 ++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
> index 1a6698570a..cb3eb2b0a5 100644
> --- a/package/tpm2-tools/Config.in
> +++ b/package/tpm2-tools/Config.in
> @@ -21,6 +21,17 @@ config BR2_PACKAGE_TPM2_TOOLS
>  
>  	  https://github.com/tpm2-software/tpm2-tools
>  
> +if BR2_PACKAGE_TPM2_TOOLS
> +
> +config BR2_PACKAGE_TPM2_TOOLS_FAPI
> +	bool "tpm2-tools fapi support"
> +	select BR2_PACKAGE_TPM2_TSS_FAPI

This was missing a:

        depends on BR2_TOOLCHAIN_HAS_SYNC_4

which we inherit because we select BR2_PACKAGE_TPM2_TSS_FAPI.

Also I changed the prompt to "fapi tools", as repeating "tpm2-tools" is
not useful, and the option is more about "fapi tools" than "fapi
support" I believe.

With these small changes, applied to master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
