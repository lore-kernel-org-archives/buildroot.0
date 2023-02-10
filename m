Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39693C636D4
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6EA860DED;
	Fri, 10 Feb 2023 22:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6EA860DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iTEXO7RmPc4z; Fri, 10 Feb 2023 22:17:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3136561019;
	Fri, 10 Feb 2023 22:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3136561019
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65D981BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FBB0415AD
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FBB0415AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUzpotoFAlBm for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:17:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C71840AF7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C71840AF7
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:17:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1C99C240002;
 Fri, 10 Feb 2023 22:17:00 +0000 (UTC)
Date: Fri, 10 Feb 2023 23:16:59 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230210231659.2957f090@windsurf>
In-Reply-To: <20230106111141.325627-1-ju.o@free.fr>
References: <20230106111141.325627-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676067420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVkibVWoF+z4B8CPB/Q0uA9ye1Lma25z1EhqbuQPTAE=;
 b=p6I25GyoXebr7rhbwzt1KBxi4UU3zHgRUWlVdG7tX4kEpT8RoDnAO6vAvvlrGHDfDGS7yj
 zFxz5OQKNsnLrLRITUYHtDe/QvsdFo1bABUaFNmUsPkZQL/a47/cXJAsDV9Fb3OG0Vx3UG
 KAJKIDdo5M2ikYAht/RCfhbKU/twOAigADopIyUNSnvKTHKPfYydhcRefD0BHLIXSVfZjg
 qYnezPudDlpXOsZ/GnKNZeR2k/RqRzf4LJggeIeFWKRryhwX1cIYioFtzQ29910nYzaap2
 CW0Ud4WgsQw4mXeZCOyZXdzoI6kYo5eHGW7DNfMEObJWsu4TmoXm82KTTvySAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p6I25Gyo
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gnupg2: bump to version 2.4.0
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

On Fri,  6 Jan 2023 12:11:41 +0100
Julien Olivain <ju.o@free.fr> wrote:

> See announce:
> https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html
> 
> This commit also drop a patch which is now included in the new version.
> See:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=7011286ce6e1fb56c2989fdafbd11b931c489faa
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - Removed GNUPG2_CONF_ENV, as the better fix is:
> https://git.buildroot.org/buildroot/commit/?id=3a22b009992883ad57553ffb3f194303f90ad1a4
> ---
> Tested on top of branch master at commit 3a22b00 with commands:

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
