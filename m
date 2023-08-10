Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAF5C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 07:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E9861007;
	Thu, 10 Aug 2023 07:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E9861007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sE97TwdCYjqr; Thu, 10 Aug 2023 07:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0115060FFD;
	Thu, 10 Aug 2023 07:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0115060FFD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84BCF1BF377
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 07:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45BAF41949
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 07:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45BAF41949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3w4ePcwIZ-h for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 07:07:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3393D41944
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 07:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3393D41944
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1A6F60006;
 Thu, 10 Aug 2023 07:07:22 +0000 (UTC)
Date: Thu, 10 Aug 2023 09:07:21 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230810090721.1e052f35@windsurf>
In-Reply-To: <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
 <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691651243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFSglzV8dmLUoA4SscW2/nN555N2qeyaYsqttyLpgtk=;
 b=P7g2xNLAJ6dDFPFoRd/a5yJvYNcoNju3xcbYMNedDcx6y3dExRN+foGmqYK4GjkSZrJxcy
 0E/mQEOQnx5Wmruxoc2+/TGo+vFPC00b/dnPyDcyBvct5RH/t5xu0pOB6ahlg0t4pNwEsW
 cxBepIKVHnhhfs/qrFmxq+VNHKNyuX/TG0rLUoTpUvZrwSKs9AbSWlKu3bFkHH9JhWubyz
 TV17IsXLRpHKjIEs6wpNq+7pVkmqLZ3FhrRx9UwXUPYsT44924HIYllN9B9Tiq27VOy+2s
 Kq2lyMmWngn3CNFGmruXMSLyBOJIbvnXPuZ8z6r6Ypk+TXdFVDAYaut/G83eXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P7g2xNLA
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Cc: buildroot@buildroot.org, clement.ramirez@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Daniel,

On Thu, 10 Aug 2023 07:50:34 +0200
Daniel Lang <dalang@gmx.at> wrote:

> The problem here is, that the new API (even the one for CPEs) constrains us
> to a 6 second timeout between requests [0]. We currently have ~700 packages
> with CPEs. This would come out to 4200 seconds or about 70 minutes, each time
> we run pkg-stats for all packages.
> The only way around this is requesting an API key [1] which allows "50 requests
> in a rolling 30 seconds window". NVD still recommends to sleep in between
> requests...

Agreed, but what you do in the patch series you posted is just fine
IMO: you download the full CPE database, and then we locally check
against it. Your last patch implements exactly what Arnout suggested:
to not check the full CPE including version number, but only the
vendor/product.

> On that "latest release" note, we have a second, probably rarely used,
> use case for CPEs which is support/scripts/gen-missing-cpe.

I'm not sure why you call that "second use-case". 

> This script tries to generate a XML structure for each version that
> isn't registered in the database. For this script a lot of
> information about the CPE needs to be stored.

The idea of this script was to be able to contribute new entries to the
official CPE database, by generating the XML file that they require as
input to contribute such new entries. I've never used it myself, and we
would need to submit gazillions of new entries all the time to keep
their CPE database up-to-date.

It could still be useful to have something to contribute new entries,
for those packages that have no entry at all (regardless of their
version number) in the CPE database.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
