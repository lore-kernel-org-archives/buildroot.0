Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE225C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 09:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7688060D77;
	Sat, 20 Aug 2022 09:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7688060D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9ZTc_4sLxdc; Sat, 20 Aug 2022 09:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D92AA60E78;
	Sat, 20 Aug 2022 09:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D92AA60E78
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 525A71BF2C5
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 388B341969
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 388B341969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUiaFLfh1XIE for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 09:32:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20EE741973
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20EE741973
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 09:32:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B94A91BF207;
 Sat, 20 Aug 2022 09:32:27 +0000 (UTC)
Date: Sat, 20 Aug 2022 11:32:26 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220820113226.77796524@windsurf>
In-Reply-To: <20220815170129.98422-1-fontaine.fabrice@gmail.com>
References: <20220815170129.98422-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660987948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zEgePtSpinIC/Hu8n1tpVxqOfKJaIlgqmIoObcjqLzI=;
 b=NC/uoDn8ja3tZAZ+X7wNBQaEFQ2AdOBqqFn7LrSzG8zOSGkR2fRrgaq3BNjpARRHtgACmx
 1YXR9JpuffepIZ8btaq9YLXFm6pLuc05NxOhAyJqPSgchNPVYegnohQVp6iFlNGTrxTPLJ
 45o+VusoHov+yj2ms85J0CW3dQrN0zruqOml45etb+35CcyFA3FYJyX0L1LbdIg59WjAtx
 zwKZjc2dyj6rB/gRzqLRI4TdIxWGuzR+IzQsaFihq/kXzIIH7aLoqN95dOZ9Wa4U11oUIr
 torrOGOLhexOOKfAwQZGmFlaUb2qGjzcDbqXPzxXQ/fvrnT73ewSFUVzkfft2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NC/uoDn8
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add opensbi custom
 handling
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

On Mon, 15 Aug 2022 19:01:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add custom cases to make sure that a random configuration with an empty
> git, tarball location or version for opensbi doesn't fail. It reverts to
> BR2_TARGET_OPENSBI_LATEST_VERSION in that case.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b31882b1a7119b2b590cc6dfed44fe515a63a6b8
>  - http://autobuild.buildroot.org/results/61866e8941741c9746dcb2c60b6db3b0e5b9a47b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
