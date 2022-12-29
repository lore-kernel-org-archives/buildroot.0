Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DF9C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B6BE81826;
	Thu, 29 Dec 2022 09:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B6BE81826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KiZrsx-vd5O; Thu, 29 Dec 2022 09:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9840681852;
	Thu, 29 Dec 2022 09:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9840681852
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E0241BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 697BD60C33
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 697BD60C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W07SNMuMizxe for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:06:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A91160C31
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A91160C31
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:06:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 07B05C0003;
 Thu, 29 Dec 2022 09:06:45 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:06:45 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221229100645.50c4a965@windsurf>
In-Reply-To: <20221218220318.563479-1-bernd.kuhls@t-online.de>
References: <20221218220318.563479-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzP8NKPK1xdfGTgyVYAhpgo/H4jO7/6xN1qxl8kwSuU=;
 b=ZBhY2tdau1XucR7m2US4rdZIejpIKQOTS0LfokLkRe1KnnfBccj8ihVfKOiT0A4A7BVhDP
 FDDXjiZjZgJhU6jG4zA/WM1yr2SZ+Ol92TOFG9rps81ld2z3eOYvj7yq1CQfdqQGy+k0Wg
 hqFIt1+cOveuR58dPYA86ti12RI0a3PF0VK1At3SdWS8qTNSTwyVQA7Tc8IXQBSw82jfrw
 poI5+QMbPtrxpUfJR5NK4gf93rpLhzOiMoyh1bJVXc05PG1MwqR+SiZZccXDCEeRdE085n
 9m0pqsN5PQglqty/tHabSRWX+gZchnfpYn1CsVNiavCrNfSGKgu+nVV5V1RwGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZBhY2tda
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-firmware: add RTL8125B
 NIC firmware
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Dec 2022 23:03:17 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed due to kernel commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0439297be95111cf9ef5ece2091af16d140ce2ef
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/linux-firmware/linux-firmware.mk | 1 +
>  1 file changed, 1 insertion(+)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
