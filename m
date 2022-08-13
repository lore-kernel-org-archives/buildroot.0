Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AA6C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 11:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A94C482C18;
	Sat, 13 Aug 2022 11:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A94C482C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id snnIn-NeQDZD; Sat, 13 Aug 2022 11:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AA582B1E;
	Sat, 13 Aug 2022 11:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AA582B1E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2ACFD1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0499C60C22
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0499C60C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id miKeWoz0W-VR for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 11:00:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED0D260C1D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED0D260C1D
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 11:00:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 90C301C0005;
 Sat, 13 Aug 2022 11:00:27 +0000 (UTC)
Date: Sat, 13 Aug 2022 13:00:26 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220813130026.4d420df0@windsurf>
In-Reply-To: <20220812204927.173993-1-fontaine.fabrice@gmail.com>
References: <20220812204927.173993-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660388428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRifdrSNKRU5wD3Qw/23l4qAHR+gkTyRMVPSIOJ1lGk=;
 b=Dvs0X6mq8oX2ryGHSkESo5OF+AHhyUGtenXXKUP7DaNYwUsJK785iPhGm6LS70gV2QSTn3
 eGDcDbG2+FjyOSq8IrtRF5rAm1HFaxWoQSGMrrZ8URW7LuypGu7iWLZBLn2+WwwLJN5jrg
 72jYYQlGCJwh6jHOGPEKV7gZOtdo34hFeotQv2AGSSkDl+BucZZtcTbx22q0vbh3oVFAwu
 JbividijEfJnqG1LLQQAD77IOGbCAWXSD59EGAeVlJZ7QVggkfVMGpyf7aeEi+CFKkq+TX
 1Y2U5xiJpha86dcto6JlKEQAmXHs/dVxFG5E3rowvkkRJquWH7qtq5Sq8pd9Zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dvs0X6mq
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: requires DES in openssl
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
Cc: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Aug 2022 22:49:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Enable DES in openssl to avoid the following build failure raised since
> the addition of the package in commit
> 8aaa7ecbce1d10cbcd880c3da5e429988f96176a:
> 
> In file included from sm-common.c:51:
> sm-common.h:33:1: error: unknown type name 'DES_LONG'
>    33 | DES_LONG DES_cbc_cksum_3des(const unsigned char *in, DES_cblock *output, long length,
>       | ^~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/25d0933406dea28201dadc90abd32072afab720b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/opensc/Config.in | 1 +
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
