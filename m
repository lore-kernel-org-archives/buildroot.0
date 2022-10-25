Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42BDFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EA3140199;
	Tue, 25 Oct 2022 18:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EA3140199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pSaIoP6DCK_O; Tue, 25 Oct 2022 18:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 501AA4010C;
	Tue, 25 Oct 2022 18:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 501AA4010C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0E271BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABF8760A70
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF8760A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tClrKkZ9YvJ0 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:39:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20FD7607F4
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20FD7607F4
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:39:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22E7F100003;
 Tue, 25 Oct 2022 18:39:15 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:39:13 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025203913.5d74f83d@windsurf>
In-Reply-To: <20221021223144.116049-1-fontaine.fabrice@gmail.com>
References: <20221021223144.116049-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666723155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0f6rfdrOArmyqHA/FDs23aFoX9I2/4dtAgs/oKVt4vU=;
 b=pADTBUE91h2jQZjB/jyjsGFYy8SxxahpSJNbM8kNF0RNfwr1yOilSHorbiIaq0maF3giHf
 5xSLro4I5wD/5UG1i/EVdnGwosRoKncHbYaJTE7dqs+HRnhVTw/yDqUf2MpOX+b5Cvqtyo
 tbobW8e9p8roPncyjHivlOytYkDMaebfh3hjY2S+aRTDDYXqrEHLLalB7AuyGsbzi6tau1
 DURwLj5aZUwWfvWpM7TjXvXi+QCCO2X7k2ynE3sR906DI9utKnz+X78/CrBUGR8mKwCzG9
 4eRWMT3XasVWtJLttmb6NNJJ3e8j0/EN/Hd+Of+FdTviNP5mAoN5GMyVChO/7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pADTBUE9
Subject: Re: [Buildroot] [PATCH 1/1] package/libcodec2: bump to version 1.0.5
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 22 Oct 2022 00:31:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/drowe67/codec2/releases/tag/v1.0.3
> https://github.com/drowe67/codec2/releases/tag/v1.0.4
> https://github.com/drowe67/codec2/releases/tag/v1.0.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcodec2/libcodec2.hash | 2 +-
>  package/libcodec2/libcodec2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This update is apparently causing quite some breakage:

  http://autobuild.buildroot.net/?reason=libcodec2-1.0.5

Could you have a look perhaps? Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
