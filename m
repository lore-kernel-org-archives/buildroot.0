Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DB4C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 410CC60E33;
	Tue,  2 Aug 2022 22:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 410CC60E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBj2lRTd3tlx; Tue,  2 Aug 2022 22:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3370560E25;
	Tue,  2 Aug 2022 22:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3370560E25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8F281BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9615F40354
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9615F40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJjTuurFBhkK for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:22:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23DBF400AF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23DBF400AF
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:22:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 21BBA1C0004;
 Tue,  2 Aug 2022 22:22:50 +0000 (UTC)
Date: Wed, 3 Aug 2022 00:22:49 +0200
To: Kyle Harding via buildroot <buildroot@buildroot.org>
Message-ID: <20220803002249.3265508b@windsurf>
In-Reply-To: <20220802212005.1644270-1-kyle@balena.io>
References: <20220802212005.1644270-1-kyle@balena.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659478970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sY71u/16jiCUFvpOTOwAc5rXsLc1uJgCiUEHoZ5fHPs=;
 b=Z+TrhFSMeR1TF3BqED02UjxY2REImwjSBGFAlBKiHYRdoDpyl/EswRpvHpM8IUuKnZqKD3
 VmMkbw4yvLWKfwUsH+5KFkMBcJI429MJA01rUutj2atnXH9d5taZbmtCWNhrG1FW54hvZL
 IFlCikVgt8IBFYPSa0dUwSXFCXDmZ4MtowWJUG6sztpSOpxYWof7UFfUnn0zUkWvtuZ8NI
 IL2BLJOnrVdanOTAgEusRqydKDTNSuTSGVMIGuQD7f7g0OpyaZq4khVLSe2iTurr0aB3he
 fFn3aUZobni1kdJTlY+8i6eVkptVO3E5G8w9q7PShbIGrYvTfoXn9u1Jw4f87Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z+TrhFSM
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.16.2
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
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Aug 2022 17:20:05 -0400
Kyle Harding via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Kyle Harding <kyle@balena.io>
> ---
>  package/unbound/unbound.hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index 68087cc28e..8bfe48df9f 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,5 +1,5 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.0.tar.gz.sha256
> -sha256  6701534c938eb019626601191edc6d012fc534c09d2418d5b92827db0cbe48a5  unbound-1.16.0.tar.gz
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.2.tar.gz.sha256
> +sha256  2e32f283820c24c51ca1dd8afecfdb747c7385a137abe865c99db4b257403581  unbound-1.16.2.tar.gz
>  
>  # Locally calculated
>  sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE

Thanks, but this patch is missing the change to unbound.mk.

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
