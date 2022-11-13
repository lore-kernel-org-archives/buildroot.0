Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E644C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4128405A4;
	Sun, 13 Nov 2022 21:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4128405A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRn6op1EiTO2; Sun, 13 Nov 2022 21:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4E51405A2;
	Sun, 13 Nov 2022 21:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4E51405A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 249191BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8E88813C2
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8E88813C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPCIET2niPUw for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:18:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84DF8813BF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84DF8813BF
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:18:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2ABD560002;
 Sun, 13 Nov 2022 21:17:59 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:17:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221113221758.54889e0b@windsurf>
In-Reply-To: <20221112213655.110226-1-fontaine.fabrice@gmail.com>
References: <20221112213655.110226-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668374279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aD7nQrY7t3Dq3GpZvDh7kKANJuurcUEx3HEkYJRDGFM=;
 b=ZFEv+ihEZZF1I/qwhCARGx9CSJlr9YK3xcOcF5KUFfRN74tHZeAnc1O2h2pDd2ES6VGi4v
 6cYGVcQhUU1hB5bp7IdPR71+20O2IF39JGv2UWVJJ75uUjiTlGuYA/bQeFXa7BHCr+5gsy
 CSawA3KEHrk/Hqt8/wG9v71TxXc7b96F/Tm7cjEz45BicP5Wiqxv9Xf2++FoqoGLg/XjFR
 iKFORtS4I/vBFHAKQmo2q33+XUGqAytD6PMsoFLGC7255hDO6R0CRWGvmrScdVHsFNyrHy
 Lh91RwQyN/OkukPklbhWgx5b6sMYR3e7b1AmB+c2ugwDtqGhXbwYe4jH8dKqtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZFEv+ihE
Subject: Re: [Buildroot] [PATCH 1/1] package/ntfs-3g: security bump to
 version 2022.10.3
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

On Sat, 12 Nov 2022 22:36:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2022-40284: A buffer overflow was discovered in NTFS-3G before
> 2022.10.3. Crafted metadata in an NTFS image can cause code execution. A
> local attacker can exploit this if the ntfs-3g binary is setuid root. A
> physically proximate attacker can exploit this if NTFS-3G software is
> configured to execute upon attachment of an external storage device.
> 
> https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-v4w8-jv3w-7prm
> https://github.com/tuxera/ntfs-3g/releases/tag/2022.10.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ntfs-3g/ntfs-3g.hash | 2 +-
>  package/ntfs-3g/ntfs-3g.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
