Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42BCC4167B
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87CFE60B6F;
	Wed,  8 Nov 2023 21:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87CFE60B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zG4k_bch2d78; Wed,  8 Nov 2023 21:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A77A460B55;
	Wed,  8 Nov 2023 21:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A77A460B55
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1879D1BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5A6F81F22
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A6F81F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vn324tNxMBgd for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:55:54 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C5B481F20
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C5B481F20
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9326DC0002;
 Wed,  8 Nov 2023 21:55:51 +0000 (UTC)
Date: Wed, 8 Nov 2023 22:55:50 +0100
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20231108225550.4555e0b7@windsurf>
In-Reply-To: <20230901192719.102415-3-dalang@gmx.at>
References: <20230901192719.102415-1-dalang@gmx.at>
 <20230901192719.102415-3-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699480551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/UGE7mSX9YEmNMwFWGVsOD+yaWfkS/o/vEHRlZYZVY=;
 b=oqwifG2bmKY9+aBYcCl301cBtQ2S+O5FIqM3XNctPMNso+PrvEoLscZddAHMRv68Tucgv6
 Q7oOPXq9zhQVqWf9CKLile+QqckZgKmqDJu0Fq1BeU/Xv4sBAM1VO4LS8PgAia7EnxxRtn
 bgzgD+qPjm9G+dk64TN/RJZSpMvitYNybaFOQckfGISRATIxQOtumczPvBd5+iS2u0JhFy
 Aeeg6rhc/L0zgNGG8szOPHB/zX3GhyyQXdIuQLyk7hE0IsHUX6BbFEBecvd6GKhqnBUMlg
 ypbAwf90IarQIrIgXLVDW4oINowUucaupBEOlcyvEJtBc2gY74V8M0vplygiUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oqwifG2b
Subject: Re: [Buildroot] [PATCH v4 3/6] support/scripts/nvd_api_v2.py: new
 helper class
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

Hello Daniel,

On Fri,  1 Sep 2023 21:27:11 +0200
Daniel Lang <dalang@gmx.at> wrote:

> The current NVD data feeds used for CVE and CPE checking will be retired
> by 2023-12-05 [0]. Both have to be switched to the new v2 API. Since
> fetching data from both sources workes the same, a common base class is
> used to handle the API interaction.
> With the new API JSON pages are downloaded, meaning that we have to come
> up with a storage solution ourselves. Therefore nvd_api_v2.py manages a
> generic set of methods to initialize and update a sqlite database.
> 
> [0]: https://nvd.nist.gov/General/News/change-timeline
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Thanks for working into this. I wanted to merge this, but taking a
fresh look at this, I don't quite understand the SW design choices
you've made when it comes to splitting between the NVD_API class and
the CVE_API class.

The NVD_API class implements
 - An actual init_db_meta() method
 - A dummy init_db() method
 - A dummy save_to_db() method
 - An actual download() method
 - An actual check_for_updates() method

Then the CVE_API class inherits from NVD_API, which provides the actual
implementation of init_db(), save_to_db() among others.

What is the reasoning behind this? One could think that the NVD_API
class was only related to calling the NVD HTTP API, but it does have
knowledge of the local sqlite database.

So I'm really not clear on this design. Could you provide some details?

Now I see that the CPE_API class also inherits from NVD_API, but I'm
still confused.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
