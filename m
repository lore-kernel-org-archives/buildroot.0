Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62E8EB64DA
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 09:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8121A40158;
	Tue, 18 Jul 2023 09:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8121A40158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id viA3lCBuurCh; Tue, 18 Jul 2023 09:21:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2CA240190;
	Tue, 18 Jul 2023 09:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2CA240190
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A44081BF267
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 801304017A
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 801304017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_scAhyqkzHF for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 09:21:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50F8240C05
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50F8240C05
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 09:21:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E9E1E0007;
 Tue, 18 Jul 2023 09:21:44 +0000 (UTC)
Date: Tue, 18 Jul 2023 11:21:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718112142.1a5f19e6@windsurf>
In-Reply-To: <20230716165857.438323-1-bernd@kuhls.net>
References: <20230716165857.438323-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689672104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4f2IdezXyRFa2w2V2GBA0S6fsJn1OH/THOTL9kcrlXU=;
 b=DlEaROpeaSuhNRruSPsKwMEeGTzY7yM0N/tZ5+0KQzeC1AJ8m18QmD0tW3aDaLdXqLySjD
 lAMWCeDGrPIu1IRCzCT99GxBG2uuYCbDCdG9McntFMDwa/RGwbESh+u0S+6hH7mLKjKxHs
 GIvFnYU/kvj/ztzvK+T8Bi20adM/CLy7/3QRn1dkVL8R/+XWKQeq2tQWyhDdyxpOe7/Gkm
 PIQNgsmpINmGWsdSvs7O3Rseb2XphalUkHSkoqgum4zd3bh6R9fdsTjj0HwCY51WKWMzvt
 hxbo9gLW0NIYaokAbCnL8DIVoCVC7vHUd5q5caO9hINO/SSAcM6I6KXc4vKJCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DlEaROpe
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: fix build
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

On Sun, 16 Jul 2023 18:58:57 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Disable unsupported options.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Which autobuilder failures, or build issues is this fixing? A bit more
details in the commit log would be nice :-)

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
