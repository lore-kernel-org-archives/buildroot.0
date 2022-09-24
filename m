Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50150C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 08:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E094460ADC;
	Sat, 24 Sep 2022 08:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E094460ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ne0-bRgFUEfZ; Sat, 24 Sep 2022 08:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 324A060ABA;
	Sat, 24 Sep 2022 08:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 324A060ABA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 841B01BF861
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 601C040AF4
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 601C040AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6O5NziQC-wkz for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 08:24:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0317640A68
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0317640A68
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 08:24:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0872A200002;
 Sat, 24 Sep 2022 08:24:32 +0000 (UTC)
Date: Sat, 24 Sep 2022 10:24:32 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220924102432.41c4b9ef@windsurf>
In-Reply-To: <20220901201204.3514426-2-bernd.kuhls@t-online.de>
References: <20220901201204.3514426-1-bernd.kuhls@t-online.de>
 <20220901201204.3514426-2-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664007873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58BrtZJrukVFlsXt7VYx+8f39X1Bi1TXsqS8H2keEqM=;
 b=g0xLpVaS1oVfWsmMkREAp4Uh+KqDw2piWgE78Tu0rjlL7PZbu2T4sdYLOhEoWFO5QBMp2h
 DiEFoGqzYv0epOnTAWWWJLOgIsm+2al41jM81az9ps2WZiRe743MWwgze34vopnsYZqWJW
 9VxyNITZXbK77q/K+EBwH226AdQotFVu14ysI6G587yewOLNzaERpA4jqIkbojzEi8kn3I
 H11f7YHQK7V/PC58G/GvOcMx93Nv4GDqmdO0BJY6RLFKuxS+itOjVXbFolcmZ+WUIm0Pdg
 cJoiUoqy/0Q3IFCv5k+S7928MNbw7qiR1sXtOCcaeLqMuYRn/hc4k5B3/Gn11g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g0xLpVaS
Subject: Re: [Buildroot] [PATCH/next 1/3] package/daq3: bump version to 3.0.9
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Sep 2022 22:12:02 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> https://github.com/snort3/libdaq/releases/tag/v3.0.9
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/daq3/daq3.hash | 2 +-
>  package/daq3/daq3.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
