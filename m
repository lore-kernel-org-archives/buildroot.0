Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58057C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF61E4024E;
	Sun, 13 Nov 2022 21:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF61E4024E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14N2WRmLLHOs; Sun, 13 Nov 2022 21:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09D5540321;
	Sun, 13 Nov 2022 21:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D5540321
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51C661BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11CB740321
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11CB740321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pp4YIjaabYN4 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:49:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABEC14024E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABEC14024E
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:49:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D1DE640004;
 Sun, 13 Nov 2022 21:49:41 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:49:40 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221113224940.084a97a5@windsurf>
In-Reply-To: <20221113214441.13829-1-fontaine.fabrice@gmail.com>
References: <20221113214441.13829-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668376182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5CAMsBhGe6SFe/EaP659yOSynwZyVZrHoJsbG/F+n0=;
 b=PfC05mj1HgEWboG20teA39rFuK2UjwJrxILCiFkSvi6mwGV1DznEEBmn2OWnyLydKBROkw
 F0wt6GaTwqw2qdzVgvt4b4m9tFsyP7Jyf2rQ+66peKHaAnWBL/3b+suRiRm/Ofg66aJsQr
 mvxP2aVPx9H3RuFaVzHnFivl6TUSywimjTcyiHBAd0ewOVo7X+fMfZUrNtQHCMYNWfSaPp
 M40nHPy0CrcSF2YfnAC7Kx6cFltqeLIxYbAa+nIheeSSR8e4cjFCgpAK6yGAXO1LSMfkCb
 G/ICO6ljeeFlo58Ut8yj655/aeUANZ0HkcHkUoNhvdBCB+qcp510kHBG2Lxwwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PfC05mj1
Subject: Re: [Buildroot] [PATCH 1/1] package/libvncserver: fix CVE-2020-29260
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

On Sun, 13 Nov 2022 22:44:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libvncclient v0.9.13 was discovered to contain a memory leak via the
> function rfbClientCleanup().
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ee-vncRec-memory-in-rfbClientCleanup.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch

Isn't this missing some IGNORE_CVES update?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
