Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFF1C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 15:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29351607FE;
	Thu, 16 Feb 2023 15:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29351607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY_H3qbnTP-m; Thu, 16 Feb 2023 15:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7636A60A84;
	Thu, 16 Feb 2023 15:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7636A60A84
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A72E41BF5A5
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7833E60A84
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 15:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7833E60A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xKERVwIuQkL for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 15:01:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 268AB607FE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 268AB607FE
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 15:01:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E3BCBE000A;
 Thu, 16 Feb 2023 15:01:09 +0000 (UTC)
Date: Thu, 16 Feb 2023 16:01:08 +0100
To: Afshin Pir <Afshin.Pir@gallagher.com>
Message-ID: <20230216160108.5a8d0c63@windsurf>
In-Reply-To: <SY2PR01MB27780FE651C1964CD2B732A094A09@SY2PR01MB2778.ausprd01.prod.outlook.com>
References: <SY2PR01MB27780FE651C1964CD2B732A094A09@SY2PR01MB2778.ausprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676559670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1gkQGKaZ1CmiH9VKLTajzbqmaxCb7s3BCr9/6WPz68=;
 b=pSDoKwLhlwAjz9JF/Z5hLhjAcMor4S5OhSnR3o1ELtvRp9eGffGMLJpE1qM58KXnYABdxw
 ZKoZfFOWakRldicaGT/kIVBfGvcAyopzdhiyZREvJ6EsulymyS+mly0+ezAYz+yZ9wCIAV
 1Y3hv5MDNMf0Dacr2AzhZ1vypZvC5Oloo1bbHOOBga/ScXpta8GeSdDupXTFMOSUxU7tWT
 7xvdXTlvdClpNiHr8WMXZVnA1xrHhxver0ILW/xOLb3jdAsAX2uueQEKO0952nOy6LC7Hd
 qL5pZTuedxmzzc8R8Ju+OdeTx+dl0JoIBSBxHGYFAnqqrnc7DeywC4M2smtsGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pSDoKwLh
Subject: Re: [Buildroot] Can I enable a config option from command line?
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 16 Feb 2023 02:43:30 +0000
Afshin Pir <Afshin.Pir@gallagher.com> wrote:

> When building buildroot, I use a default config file. But there is
> only 1 option (BR2_ENABLE_RUNTIME_DEBUG=y) which is not in config
> file by default, and I want to enable it by command line when
> building buildroot. Is there any way to achieve this?

./utils/config --enable BR2_ENABLE_RUNTIME_DEBUG

have a look at ./utils/config --help

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
