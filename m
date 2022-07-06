Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF7BC43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 053C161125;
	Wed,  6 Jul 2022 21:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 053C161125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZEy-u83t57J; Wed,  6 Jul 2022 21:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1306C6111E;
	Wed,  6 Jul 2022 21:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1306C6111E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A21ED1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BF476111E
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BF476111E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQNEa67Xcji9 for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:18:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EF2B606A0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EF2B606A0
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:18:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 21D66FF806;
 Wed,  6 Jul 2022 21:18:42 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:18:42 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220706231842.5c59f088@windsurf>
In-Reply-To: <20220628000752.378643-1-giulio.benetti@benettiengineering.com>
References: <20220628000752.378643-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657142323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfueYDNYHZGg2aTV7vMpb8OW6RDV+iqYuKZESGuyIm8=;
 b=G2i1B+t5Es8BVmvgL4HQP3h0wZrs2bNO3uLXyuoKn437hp2WwX83VKCm7mqA8h7JVLrrJI
 x9zFz2T4KWVV7DfQ8g+JDJPgRMgAo+ldeDQ+drugYDKehXPQg/v8wzx7ahoSh84Hh747Fx
 5Ifq0LTQGxh+8A9grXINNBKgZUnxzqeFZSP/lRkMXidifuWapf+sIJ6zF7w1amDobMnAsl
 pFJJtO6UB3B7D7MQz8PcYb7Pe6w7SgOX2keG5c0PWg07cxt1U+g4gYujAII1LiQM/qHVqy
 dgEZ26NevkGRXsUZNzh4q+UrAH2ON/z4f5Nvap5BlnRgC0GLi4R9HLFU2V12zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G2i1B+t5
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 4.4.0
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

On Tue, 28 Jun 2022 02:07:52 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  package/harfbuzz/harfbuzz.mk   | 2 +-
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
