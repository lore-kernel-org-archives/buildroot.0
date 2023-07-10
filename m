Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D19EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C40B81514;
	Mon, 10 Jul 2023 17:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C40B81514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWr-0d88vUor; Mon, 10 Jul 2023 17:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D852681E63;
	Mon, 10 Jul 2023 17:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D852681E63
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BBAE1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4610541794
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4610541794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okOFVtDUOQQ4 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:44:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C43CF4177F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C43CF4177F
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:44:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A42EC40005;
 Mon, 10 Jul 2023 17:44:49 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:44:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710194448.634c0657@windsurf>
In-Reply-To: <20230629165919.1261088-1-bernd@kuhls.net>
References: <20230629165919.1261088-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689011089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQXfJTpXW9SxEVIn8M+iQoiM7AcqqwOMC2zNOHpfYrg=;
 b=lruomz1jM9R/vWqYi4Ov76qEk4BIZj5/tHNfaWAZBTd+YR3EBxVroD5yCSgGn4rp7OZUVi
 NAIpSXYqGFOhrpBHhZQeWhBWG2XMQkog/pzcFqEcJ/K1tELhrKX2MOXl12ndOcjRbYMi5j
 1ev+NWA91cu3Cgprb3Rw97MfDZTkDW1KnBU9VKtiJvgmCVTxLpf8sxCSOF1p+c5tmJsQfl
 5Hm3Ab6KkEWoFi52JN8EHGdgPvTb9EPzw8LmF/f+/+Yjhor5jTJp+liyjSEii2syTUj7DZ
 sLKA2w91WWAQBjLbfDJ77dwTZuS4Y+n0dV54CKcFDCwnf1OyeiHIgX7NyLXG/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lruomz1j
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: bump version to 20.2-Nexus
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

On Thu, 29 Jun 2023 18:59:19 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../kodi-jsonschemabuilder.mk                 |  2 +-
>  .../kodi-texturepacker/kodi-texturepacker.mk  |  2 +-
>  ...fer-Remove-forward-declararion-of-Fl.patch | 42 -------------------
>  package/kodi/kodi.hash                        |  2 +-
>  package/kodi/kodi.mk                          |  2 +-
>  5 files changed, 4 insertions(+), 46 deletions(-)
>  delete mode 100644 package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch

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
