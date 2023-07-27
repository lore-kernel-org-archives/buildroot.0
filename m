Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F1BC001E0
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B02DE4184B;
	Thu, 27 Jul 2023 10:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B02DE4184B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4s4jeAPEn2i9; Thu, 27 Jul 2023 10:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02DC440A06;
	Thu, 27 Jul 2023 10:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02DC440A06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC0E1BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 796CE83EFD
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 796CE83EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ce6waFVaCKlQ for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:30:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3476A83A8F
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3476A83A8F
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2AAA60009;
 Thu, 27 Jul 2023 10:30:09 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:30:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727123008.1bf3e088@windsurf>
In-Reply-To: <20230726211910.2206515-1-bernd@kuhls.net>
References: <20230726211910.2206515-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690453810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qe72Hk+2KdcvoMa5xSYmNYyAa4K4Mcd6wRCMHxLMbJM=;
 b=Kta6RT4nKsbO46dpWzdRojrLNclhk0+rz6NYj7dxw8ruRzqXYqmp1hskADGtvYmCdyPZDO
 b/qgf/WVMHnFLNV1XYtKZFb5rt/Y94H4LdlQJve0H0RyxZBIt7hRXUlFfrQPQQONBysmK2
 QlpSR3TmMUlydFrcx3tt7a0As47XNfHEuPOdXaqQiAdRVHtUfdYGQ4x9nhtn36y0rjLiiV
 XweY9CeecG4gYlPTBm2+rt3maaH4Jn6Wr05YjxgjpfmSUj+CC1q8bYM1EHxlDOVOUpXJJe
 1ZA9yvqDyNmRVoCet753VGKAHbYeprPAou+6AoGb5OXiU94V1AtIhiovSDbUxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kta6RT4n
Subject: Re: [Buildroot] [PATCH v2 1/3] package/hiredis: bump version to
 1.2.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 23:19:08 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release.
> 
> Changelog: https://github.com/redis/hiredis/blob/master/CHANGELOG.md
> 
> This release includes improvements for static-only builds:
> https://github.com/redis/hiredis/pull/1160
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: no changes

Thanks, entire series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
