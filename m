Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F178BC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A68C240BDD;
	Thu,  3 Nov 2022 21:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A68C240BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1qZMD81Im8m; Thu,  3 Nov 2022 21:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0AAB40BD4;
	Thu,  3 Nov 2022 21:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0AAB40BD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDB951BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 986084180F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 986084180F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESP8dinK-3m0 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:07:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A744180B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53A744180B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:07:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6839A10000D;
 Thu,  3 Nov 2022 21:07:11 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:07:10 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103220710.409e33ea@windsurf>
In-Reply-To: <20221103202350.9395-1-james.hilliard1@gmail.com>
References: <20221103202350.9395-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nM8eOJErnt/r4dwJz1vZqwNBVb8cP3R3rLOFYrc+wVc=;
 b=iwP32vsM+HZgAeo64tbwz/7oGSH2FOSpJREaiKnq5XPQTQjveczBEQGs3weZeaDPFvLZlc
 6sBjOgDK+CctLZKG6O/GEtUIBgK29vFuolUCLVSs8L/hNHC9YmwqsOfjaJaTPhGOKZkK6d
 v6o5lpcOXbc2BT4Tf07F7zsZvNN8J7PYEO7WjJ1FrSuZsA0tFA/mkNbvfYQRbhu0236cV2
 Q32pvdARZRKMa0O/7zc628KOhxiN/XIOpY31yzHbW7kmnjfVqlDjiDs6gOtPHKgMKJJqtE
 2jBtAr1ByPa57I4KxPoWUFP/vw+YC09JpmK3sPvfzue/z1C2dThDnCeVWRCqHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iwP32vsM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: bump to version
 22.10.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu,  3 Nov 2022 14:23:50 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

>  # When bumping this package, make sure to also verify if the
>  # python-treq package still works and to update its hash,
>  # as they share the same version/site variables.
> -PYTHON_TWISTED_VERSION = 22.2.0
> +PYTHON_TWISTED_VERSION = 22.10.0

Hm, did you look at the comment above these variables? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
