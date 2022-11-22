Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87214C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 235C140354;
	Tue, 22 Nov 2022 21:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 235C140354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yn_ePZ7ES_9p; Tue, 22 Nov 2022 21:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52C8340186;
	Tue, 22 Nov 2022 21:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52C8340186
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD5781BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE3D81F3D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BE3D81F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmM82W97yXie for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:26:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980E481379
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 980E481379
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:26:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E74E60003;
 Tue, 22 Nov 2022 21:26:52 +0000 (UTC)
Date: Tue, 22 Nov 2022 22:26:52 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20221122222652.6969e6ef@windsurf>
In-Reply-To: <VI1P190MB04935B828AC5DEE6D76E6CFB9F0D9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB04935B828AC5DEE6D76E6CFB9F0D9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669152413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQID2/M4W0obk093ez0qT/87fAv6Ebi/8PRD0iOuP2M=;
 b=SSjOPCRuN3XWCWlF4CXQ4GrbVcmLrX1qgLebTrWT3M3ATSsV/PWWMSTLUymc7x3uR+Bi/i
 U1ynz4zp/wvgicoKBcd3j79ajc7RIyiOcSWLMDRaIjC9jDxXZHqhj9OrbNiEpiFRFd6FuW
 Abdw3ebtW9RdGL1Gbp2YYfcJAGN4YDKeFHsZnXzfdJv7lLe/dGo4iwqrS42QyuGQcB4wRl
 yKZMG9VxaHwNVkBVkxBAu9jWmnie7FT3mp9uE0I5FoNMy1L95Tn19ozK4121XI4MMjSSJ1
 jhajYjlKsmdtlnC2fdsDkdxJ4+FFEL4RSL6ABtph+VIclIsPqJbYgZPeEle7fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SSjOPCRu
Subject: Re: [Buildroot] [PATCH] package/polkit: bump to version 122
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
Cc: Lang Daniel <d.lang@abatec.at>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Nov 2022 16:27:19 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> As stated in [1] this and future release will only be hosted on
> freedesktop's gitlab.
> Archives hosted on gitlab are missing the gpg signature.
> 
> 1: https://gitlab.freedesktop.org/polkit/polkit/-/commit/49bb905131537dde062d477612456328a9655e30
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  ...make-netgroup-support-optional-meson.patch | 260 ------------------
>  package/polkit/polkit.hash                    |   4 +-
>  package/polkit/polkit.mk                      |   4 +-
>  3 files changed, 3 insertions(+), 265 deletions(-)
>  delete mode 100644 package/polkit/0001-make-netgroup-support-optional-meson.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
