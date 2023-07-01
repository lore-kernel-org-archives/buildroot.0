Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5585C0015E
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0375B61025;
	Sat,  1 Jul 2023 14:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0375B61025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqZ6I6g1wlMj; Sat,  1 Jul 2023 14:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D67861044;
	Sat,  1 Jul 2023 14:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D67861044
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 521571BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5747540B34
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5747540B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmXT53kwxy3Q for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:41:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC3740452
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CC3740452
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:41:09 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B975E0002;
 Sat,  1 Jul 2023 14:41:07 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:41:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701164106.782a5423@windsurf>
In-Reply-To: <20230619181458.1596060-1-bernd@kuhls.net>
References: <20230619181458.1596060-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688222468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdmiSQshq1yjeOkfZ82YaEcWXwgK8f4KjBzlkGXQ75A=;
 b=ZlU53L54looUb/gbFquROH1UYsmQH3Ihly8Uch5VainyXapb9qpKG0CNi37wR7C6B8qZgL
 Q/s9lf0bzRBlQhlS4hXUqdJDkF3gCxK+kMpLWHX8SxoFAL1xzopIFmfrMwF/Q7zNOm0rBh
 ExVeut2VWGXgQZBg6Oou09N9jJKxHLZup2LBGyx0DwyglXmSmc/L3wDh1iScskezYDw3FO
 17FMboWTwNQqWz/Am8yN7jXXyjTbOr3e6n/hA0beNwV8D9myhS+4iLMIJt97nMb7z7ts/X
 PJyvgWDw+xy9d9SyXEVDq55b2bcedIyBFmYuRDooZLjOdEAMA5DjkPY9dcGPaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZlU53L54
Subject: Re: [Buildroot] [PATCH 1/2] package/syslog-ng: disable python
 support
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Jun 2023 20:14:57 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream added a list of python modules declared as runtime dependencies
> https://github.com/syslog-ng/syslog-ng/commit/f18345d2a16aea1a95d891ebb24a4ace9c652621
> most of them with fixed (and outdated) versions.
> 
> Disable python support for the time being.
> 
> Fixes:
> http://autobuild.buildroot.net/results/436/436e90bb1f77143b05cb98df78934555bbb7df35/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/syslog-ng/syslog-ng.mk | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
