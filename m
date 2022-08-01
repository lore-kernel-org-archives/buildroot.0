Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B99C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 19:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 442D5409ED;
	Mon,  1 Aug 2022 19:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442D5409ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuSW5Q_DFTvq; Mon,  1 Aug 2022 19:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1790E4077D;
	Mon,  1 Aug 2022 19:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1790E4077D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 074DF1BF290
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5A5E814A9
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5A5E814A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzxErHYDMIF4 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 19:59:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71CEE81427
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71CEE81427
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 19:59:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B0CC240002;
 Mon,  1 Aug 2022 19:59:42 +0000 (UTC)
Date: Mon, 1 Aug 2022 21:59:41 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220801215941.16f14c45@windsurf>
In-Reply-To: <20220727151037.1362328-1-fontaine.fabrice@gmail.com>
References: <20220727151037.1362328-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659383982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCR37KLRETeDeKhYMeV/wLBsGnhx/fYrQdbNrpQdKtc=;
 b=JpWvNKOKHrQ812rNGi2848kiBwOMZwCULYNqYpFBXAtLrQ3uskw36etoxJEbQzV8Pb8Mev
 sSfn+KS9B5RVgriCykY+vFSVF++5Cyp+cjm3sIc/18PvAwJMh7Lva+EAJTyVB8FOrf6YoK
 d6IUiTdTgYlRSd3kadTns3gdur5gDJqi3H6hOvDmGQtmhVh8fjalevjiWtJDdAA2Z0ckV1
 ApJycaLzHTTWmZY8iNRR67mZzADU4X+84Ol5ZfAcsFRIlGJKcKj1+80GH9PTEOMrXY6MDg
 m1y7UNJCvPhfZofkqMm+Cj7jTC9QkH6Yey/Z1XAQsPthtRu6VAXt7n7RBomehw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JpWvNKOK
Subject: Re: [Buildroot] [PATCH v2,1/2] package/minizip-zlib: new package
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

On Wed, 27 Jul 2022 17:10:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Legacy minizip provided in contrib/minizip of zlib.
> 
> https://www.winimage.com/zLibDll/minizip.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Drop virtual-package

Both applied, thanks!

It is somewhat confusing that our package called minizip install
libminizip-ng.so, and our package named minizip-zlib installs
libminizip.so, but oh well.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
