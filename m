Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63181C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0292D4183F;
	Tue, 14 Mar 2023 08:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0292D4183F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWvqJCNtO1bu; Tue, 14 Mar 2023 08:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C18734091C;
	Tue, 14 Mar 2023 08:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C18734091C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14CFB1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFDC181413
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDC181413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w22vZ3zMSSPV for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:43:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD988140D
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFD988140D
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:43:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68445100009;
 Tue, 14 Mar 2023 08:43:19 +0000 (UTC)
Date: Tue, 14 Mar 2023 09:43:18 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230314094318.48a228c6@windsurf>
In-Reply-To: <VI1P190MB0493430AE2B3D343A43EF2ED9FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493430AE2B3D343A43EF2ED9FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678783400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuOolmwZkYBTmXstHoeRMSN+aKwuYukQjjKp1+gaEmk=;
 b=W3CMouVtcAfo2eq2wm7WJtB37WiL+drpy3Pfbp0xehsehwCIlYVopyMc8N2KkBByhAOIHy
 1YlDliqJMvSmiSEwd5TVnBRQ44lIXGPQIrDNV8x+vdwDxWF8D4KS6wK26cdhQ0GpGmrwJF
 m1KBHqm0dJAjXL1jIFugnmglhKcW8MfI8wOdK3YCK1jTK8WsWEV5DzsO/9XU1rDuMsc2Ag
 1++Rcfxu85pGNzx6X1YUfiqPj5ZlK3VvIbQv3XsM5aQidm0neZZ10EglfpMADWiEusT2WN
 k2JwCv41vxRx4sdaDRt1237/Qr92TMNUt3jWZwkPHWxj/F/OZV6HP832CAxasQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W3CMouVt
Subject: Re: [Buildroot] [PATCH] package/network-manager: fix
 CONTRIBUTING.md hash
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Mar 2023 08:35:53 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> The version bump in e3706f1 forgot to update the hash for
> CONTRIBUTING.md
> The file includes various changes unrelated to the legal information
> (mailing list, how to build,...).
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/bbd0db06663b6df82973173bb044b57f013e844b
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/network-manager/network-manager.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
