Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7EBC19F28
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD5D60C2D;
	Wed, 27 Jul 2022 14:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD5D60C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFpDXf6b_paZ; Wed, 27 Jul 2022 14:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC75160BDD;
	Wed, 27 Jul 2022 14:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC75160BDD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2028D1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF8EF818AC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF8EF818AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hui9Zwqyo0DP for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:55:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC809817A3
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC809817A3
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:55:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B61B240006;
 Wed, 27 Jul 2022 14:55:35 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:55:34 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727165534.0ee95ff0@windsurf>
In-Reply-To: <20220727133428.1324337-1-fontaine.fabrice@gmail.com>
References: <20220727133428.1324337-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658933735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9pGbJ8oupleqKea8bQVOQm9UkTa9AYuV+Rf0kFTlh5s=;
 b=Hy2ZHnXF27xmQsxXz63GGHBd92kRgFXQLWHsN6ZRYd/BhD0pRxtw8+0rrzpNKCgEMJGHMg
 Cp576ChbWHOHl13W3hGRCv5orHeXCe+Svdf95P5sWZllFetgfMJeAqg/DwE20IrNEiif/4
 0kg/K6nJzxPVBScci1X0m516tK8YbbInzMcKRyFPf6XhpPXsrqgSEboEqgMysyoLLch+5W
 HT45mpqMpow9B8DM7tIvQEJvx8drFLd59G3FBbQ87+M//TuLBejICJXn86K60IueqDjz1r
 YC90+xCuzuwuverOYvYyKKJC6aDpar9/eFfeq9i9GMch+SdQPtFnQfIJeSn8ng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hy2ZHnXF
Subject: Re: [Buildroot] [PATCH 1/1] package/gdal: add GDAL_CPE_ID_VENDOR
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 15:34:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:osgeo:gdal is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aosgeo%3Agdal
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gdal/gdal.mk | 1 +
>  1 file changed, 1 insertion(+)

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
