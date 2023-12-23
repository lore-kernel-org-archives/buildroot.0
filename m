Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F716C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF4F940498;
	Sat, 23 Dec 2023 17:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF4F940498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0AZUz3UFXaf; Sat, 23 Dec 2023 17:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA3E404BC;
	Sat, 23 Dec 2023 17:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBA3E404BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6958D1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41BDB40908
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41BDB40908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGESzm2HyXCy for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:01:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0974640891
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0974640891
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13C59E0002;
 Sat, 23 Dec 2023 17:01:16 +0000 (UTC)
Date: Sat, 23 Dec 2023 18:01:16 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231223180116.18531e4e@windsurf>
In-Reply-To: <20231206204104.3703677-1-giulio.benetti@benettiengineering.com>
References: <20231206204104.3703677-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703350877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euzcKRPzDgqGRdqYrd9L2LXun25PPA/wk0pk0LBBK7k=;
 b=UIH9uh2aykgNpewEDeD8He5Xp0h/+VDn+/TUpUAY2qN+Ac/6oTGYWrwIEafr7V/Yl4EyUA
 QFlxztmEKAvoywUDr+mzS9zMIZoUnYen+zNGHP0D27czjdLKIJ11wNM8w2UCQpkbQb7JH5
 30mv9C6hex+lmHhyeAfu5ICYoO4hnDhKc1twGGWP2U5/KwlWWmho8jPcwrsUVgHQWsPCDP
 uQp5MlN3Oo/GrM1d0rtpOIomO1IjtYc6wQ73kI1TQk/aisQ6OYagNxVOTtoZAg/TqU7zCW
 LzUaxyDjqf+v94lKmOTmxSs1RZ0GeGfME5+DAJjG9siC1wAPpyczVUifg43JRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UIH9uh2a
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to 2023-12-04
 version
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

On Wed,  6 Dec 2023 21:41:04 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version allows to build with Linux 6.7
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8723bu/rtl8723bu.hash | 2 +-
>  package/rtl8723bu/rtl8723bu.mk   | 2 +-
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
