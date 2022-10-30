Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CA2C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA7060ABE;
	Sun, 30 Oct 2022 11:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAA7060ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRYmhjEqo91J; Sun, 30 Oct 2022 11:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4591360A74;
	Sun, 30 Oct 2022 11:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4591360A74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB2E1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49D15812DF
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D15812DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViMXEzeFeC8E for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:08:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF29812E2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FF29812E2
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:08:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 697B8240002;
 Sun, 30 Oct 2022 11:08:28 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:07:18 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120718.462bfe18@windsurf>
In-Reply-To: <20221029203039.115558-1-fontaine.fabrice@gmail.com>
References: <20221029203039.115558-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZUM1wv38EygGsuHII9JyWt44ID+KS4ymd0zbLgVRb4=;
 b=mNsXgqg1njTM3kvIEvL5QXOiY3I1MXjWp+NAhEWS27a3jQeZG4VRtbGPOsfkurVqGXTuDD
 DbxMSzJoePwFtj3kIkIcLoiDZrhqRSFbIJHo/2VGrDFeOPjPsmrwvQbFnNZoywt89SylVt
 Bc0Op9rn4LBqg/EHlGEMmN6HN2kxpgxEmlXgtaDmPjFqK6DjhuPE3d/ocehIfAb4RFj8Zh
 pwdukKUvPlRGmSn+3Z+DJrrqL9CB1wB9cGGMXbUki/Mm/P81Z2DKn4JksP9J7Pkkt8fXuq
 Ak6Ud7ePS1rQO+r2pmCFr3mrX3qQR1C+RfpZkgFri05vnJki526lInCYDo2yDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mNsXgqg1
Subject: Re: [Buildroot] [PATCH 1/1] package/makedumpfile: bump to version
 1.7.2
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Oct 2022 22:30:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use official tarball
> 
> https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.2
> https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/makedumpfile/makedumpfile.hash | 2 +-
>  package/makedumpfile/makedumpfile.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
