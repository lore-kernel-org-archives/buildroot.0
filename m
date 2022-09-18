Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEDDC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B61F84438;
	Sun, 18 Sep 2022 10:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B61F84438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSF0Uzf09nil; Sun, 18 Sep 2022 10:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F6E84236;
	Sun, 18 Sep 2022 10:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80F6E84236
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 948041BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 429FA84236
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 429FA84236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2-gg-p0rtDh for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:35:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1B73841AA
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1B73841AA
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:35:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 03179100004;
 Sun, 18 Sep 2022 10:35:44 +0000 (UTC)
Date: Sun, 18 Sep 2022 12:35:43 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220918123543.16a4e3e0@windsurf>
In-Reply-To: <20220826135503.20612-15-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-15-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663497345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4NbPf8dB4rmYcjci6ib5zZMRGhI1ZK1Kv0AVM3+Uow=;
 b=IefdblMhV6PZsU519pj1S6kCE94V/uA7LRXsuwmBQZpKjw6f2u4pbZMvxv/iazhZ6km1Tk
 HW2Nl4zv3uaA3KGbd2pdTQ2BuVeTj/FreMGmlRxFqiB6LoI0IOL657unoqXwmbdslsWnw0
 SxW2NL8QtABLNKRSg/NEvgdMfxWnbV3F1e6dT450/Sl2vo3raQgkvZWVV2Y/wZwXKJrCi7
 DndE1enUD4DgGrTmhWbX4mwprUG24ppKUdd2JFgEtXA1fRgppINAbkKu3EgCwV9hPoZIfy
 1jHXmucHcOT+iV9uqU3zuiwBUO+lCuGfE/OWenBOp9Qu/jAPSMBI3IOY48KYlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IefdblMh
Subject: Re: [Buildroot] [PATCH v4 14/29] package/qt6/qt6base: add qt icu
 support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Aug 2022 15:54:48 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/qt6/qt6base/Config.in  | 15 +++++++++++++++
>  package/qt6/qt6base/qt6base.mk |  7 +++++++
>  2 files changed, 22 insertions(+)

I have applied, but I dropped the BR2_PACKAGE_QT6BASE_ICU and simply
tested BR2_PACKAGE_ICU in qt6base.mk directly, like you did for
OpenSSL. I know qt5base is done differently, but I'm not sure of the
reasoning.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
