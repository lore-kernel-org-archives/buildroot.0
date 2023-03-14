Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7F0C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 22:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BDAF40B62;
	Tue, 14 Mar 2023 22:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BDAF40B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNoFZfU7V_Iu; Tue, 14 Mar 2023 22:37:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5B7F40B60;
	Tue, 14 Mar 2023 22:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5B7F40B60
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 310F71BF3A4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1704A60C0F
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1704A60C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGLJ6Oddh28B for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 22:37:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2F5D60ACE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2F5D60ACE
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 22:37:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A0204FF804;
 Tue, 14 Mar 2023 22:37:20 +0000 (UTC)
Date: Tue, 14 Mar 2023 23:37:19 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230314233719.55e2f430@windsurf>
In-Reply-To: <20230314123030.2523162-1-giulio.benetti@benettiengineering.com>
References: <20230314085947.231281ad@windsurf>
 <20230314123030.2523162-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678833441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r47XntnhGWJ1yRy0Adwiqb61GjTKe//BnJRKJi3roDU=;
 b=hEAADkQpsNW2zLYEXAVGhgRuc9zbC8Tu6a+3D3c2/Z7C3nG85kPd71ysmfU99hnUfqL8Re
 R0O237vLjq+Y4DbFDtU+LAAOZX8k6GSEQ9v8z4ktDQ5LvU6CrG+4Zmxc+FFl7zH99eSmP/
 e8DcsmjbXlgvlYVhLvPAJK0dcn5vM0bK+IU1Y6i/R94ZS3PZcZI07obAWULYGO6UzX0Vzq
 WDMJ1ucvMT0aOuWzwVnm/fAF63VZOoUacHhqfQFguWX7r1h+5BtJVL2xaFljlopSYLa8tC
 vr+ABjLMTsA9hmdPZIYxtRc5E80ATPEPheT5o34iwEqUzl6XVds2Do7fhvKcqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hEAADkQp
Subject: Re: [Buildroot] [PATCH v2] package/swugenerator: new package
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

Hello Giulio,

On Tue, 14 Mar 2023 13:30:30 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add swugenerator as host utility to generate images for swupdate with all
> the possible options available like encryption, passkey etc. Let's also
> add Giulio Benetti as package maintainer to DEVELOPERS file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I was about to apply... but realized that both setup.py and
requirements.txt indicate that the libconf Python module was needed as
a dependency, and we have no package for it in Buildroot, and therefore
it's not selected as a runtime dependency of host-swugenerator.

Could you double check this perhaps, and make sure host-swugenerator
works with the python installed as $(HOST_DIR)/bin/python3 ?

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
