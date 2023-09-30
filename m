Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F31E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 12:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BFCD40129;
	Sat, 30 Sep 2023 12:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BFCD40129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7B9GLsFMzcT7; Sat, 30 Sep 2023 12:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58F4640108;
	Sat, 30 Sep 2023 12:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58F4640108
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 365111BF27A
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EC9160E1D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC9160E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dSFHYCcI1zIS for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 12:49:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B916060DF0
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B916060DF0
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5025E0004;
 Sat, 30 Sep 2023 12:49:27 +0000 (UTC)
Date: Sat, 30 Sep 2023 14:49:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230930144927.57fe951f@windsurf>
In-Reply-To: <20230923114713.1466381-2-bernd@kuhls.net>
References: <20230923114713.1466381-1-bernd@kuhls.net>
 <20230923114713.1466381-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696078169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Px6KEshrML8GoKlLnSwdrT4+ZF69P0I1fYlf9MQFHDU=;
 b=GfO+9XY9wZO4mpJGBZjRIZBdhqtCQJr7iGCDYiNaAC6E5BH7SFfHNsErRBzv5wPmu2gZ3z
 X7imf/3bSFEsaxg10fZLTnOlqA+DZtEMOeECuqarXSaQ4gZ8ggzvm/Xevy3dCBpU8vOUeX
 dzXbzURTW2ad7vn1QuCInbCY4nfZkG+E2jSAMqMxDfKH3ozIX9+kt/CRFyzg+UAdYBTjMB
 +sztNb1ubaNyUm/cNvU3zwYVO7WMNEDnEOq6LXQET/Zzpv+aoLUg+VByaCf//CRxwG998X
 qV9XBhv8pIEzoaLFjwBkbCoWQkTAUij0WSE57Bb+HqzwOKiHLrfBKr3I+Fn17Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GfO+9XY9
Subject: Re: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to
 1.2.10
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

Hello Bernd,

On Sat, 23 Sep 2023 13:47:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated patch due to upstream commit
> https://github.com/alsa-project/alsa-utils/commit/8ed9d7607f97537ca4c8f359ee76462174c6e77e
> 
> Changelog:
> https://www.alsa-project.org/wiki/Changes_v1.2.9_v1.2.10#alsa-utils
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I think there's still an unfixed issue with this version bump:

aplaymidi.c:34:10: fatal error: alsa/ump_msg.h: No such file or directory
   34 | #include <alsa/ump_msg.h>
      |          ^~~~~~~~~~~~~~~~

http://autobuild.buildroot.net/results/e26/e269f862ebade30cf870d783a1006aba8fedc129/build-end.log

Could you have a look?

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
