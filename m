Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3AAFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2B444051D;
	Mon, 31 Oct 2022 14:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B444051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5rTqxdgWVWQ; Mon, 31 Oct 2022 14:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC8E54051F;
	Mon, 31 Oct 2022 14:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC8E54051F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFFB11BF3D7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83465400F3
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83465400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqPRAYmiUExf for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:43:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44B93400C8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44B93400C8
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:43:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F8EE6000D;
 Mon, 31 Oct 2022 14:43:20 +0000 (UTC)
Date: Mon, 31 Oct 2022 15:43:19 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031154319.5b6cb293@windsurf>
In-Reply-To: <20221022204144.137169-1-fontaine.fabrice@gmail.com>
References: <20221022204144.137169-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667227402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfnnGKOzSNKclVHHOt1YrSg+symXRf8p9nbLPWHMPDw=;
 b=D4L4TQP6nI047Jo/s1k/DvKh/qopb+8lWPu6/MLE2xl5VTBMnxoLgvXL5aJbWPQIpfVT4y
 +8Y4fAeNJ4ULPZhsWrJlkk59B3MRP//xrhNVJj5pB5TRru0RtSn/vxwdF6mW5jx5S5BdPs
 FwW96wrbMF9k8XH3eIje3bGMpVl/o+QVjo1esW2CifMjQXDe0GFlfu1rQqKpoxpisQJpPM
 +2V6fOfeNQYS5YVFLVioK7PhQEJN8A12qi1WarOjVBqFK/oMOE2Dq2HvHZ9i/iZL29s4gZ
 DgWLc79qz+y9zVwWHfWWB+iH8NWBLXo+awBZi66eldn6LkSIvDQW6dC5tBw8sQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D4L4TQP6
Subject: Re: [Buildroot] [PATCH 1/1] package/valijson: bump to version 0.7
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 22 Oct 2022 22:41:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/tristanpenman/valijson/releases/tag/v0.7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/valijson/valijson.hash | 2 +-
>  package/valijson/valijson.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
