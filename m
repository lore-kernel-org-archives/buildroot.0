Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5363DC7618D
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 21:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB32A40B42;
	Tue, 14 Mar 2023 21:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB32A40B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mp1h-L6J96gW; Tue, 14 Mar 2023 21:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01FF94053F;
	Tue, 14 Mar 2023 21:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01FF94053F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E33BC1BF38B
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A736A4053F
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A736A4053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtxeagUHjK9O for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 21:07:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26B184011D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26B184011D
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 21:07:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DE51C240008;
 Tue, 14 Mar 2023 21:07:44 +0000 (UTC)
Date: Tue, 14 Mar 2023 22:07:43 +0100
To: C D <dellicker@live.com>
Message-ID: <20230314220743.21dcc880@windsurf>
In-Reply-To: <SJ0PR05MB7625BB7889E5DD3876C01E89D4BE9@SJ0PR05MB7625.namprd05.prod.outlook.com>
References: <SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99@SJ0PR05MB7625.namprd05.prod.outlook.com>
 <20230314085823.5a37e5e9@windsurf>
 <SJ0PR05MB7625BB7889E5DD3876C01E89D4BE9@SJ0PR05MB7625.namprd05.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678828065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNYxK4D10N4Ow4N6LxLJ9oVbTb2c5/O7UxB67x2ZlKc=;
 b=jebzcqgaKBtxOq+BhvGKI3RkvgUm+exrECeIKKHAkBRwY9Q8TBJBziuWSrN3IaiXFWlibh
 zsay/OTfkcNtnljbY9i7r4NLtpC1jL7p2xRlFrlO+2cUi2iC4UqGogcyN2x07j7GBPQlOz
 1TqikIMyaoAcEZ9Wd+SDozUMbFlxfbwAm6QyfvQNdQ2wG5cbr/UzKNbJmE4kqyg+BR15Nt
 ozEa52JFqWBu/RwkjE21UP9N5+Njw5WbAq65YJI1NueVManB68NsBz6xZ8bNSolek9EZdu
 M4w6rSuYvGcFuWlfxvBKmVXrX3RWEajNqs/u/zcTX7hWzaLc6uw68GmmBXeDfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jebzcqga
Subject: Re: [Buildroot] Forcing linker to look at right library path?
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Mar 2023 18:43:29 +0000
C D <dellicker@live.com> wrote:

> I'm trying to build sedcli (https://github.com/sedcli/sedcli); the version
> I'm building is a slightly modified private branch (added some debugging), but
> the Makefile and configure script are basically identical.  I went through 
> the Makefile and added $(DESTDIR) in appropriate locations to make the files
> go where they need to, but after running a "make sedcli-reconfigure" I realized
> the configure script isn't taking any off options Buildroot is using to attempt
> to make it do the right thing, and I'm assuming this is where my problem is.
> The output I get from it is:

Could you push a Buildroot branch with your package added, and a
defconfig that allows to reproduce the problem? This will be needed to
give you some meaningful support.

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
