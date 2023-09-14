Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24056EEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE1D41854;
	Thu, 14 Sep 2023 21:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEE1D41854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qex8Gho9HHt6; Thu, 14 Sep 2023 21:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36ADB403C0;
	Thu, 14 Sep 2023 21:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36ADB403C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 171F11BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E125C60D58
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E125C60D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvP6cERD8PZ4 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:30:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E51160AC6
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E51160AC6
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF52740004;
 Thu, 14 Sep 2023 21:29:58 +0000 (UTC)
Date: Thu, 14 Sep 2023 23:29:58 +0200
To: Chris Packham <judge.packham@gmail.com>
Message-ID: <20230914232958.76942b8d@windsurf>
In-Reply-To: <20230913040924.3702830-1-judge.packham@gmail.com>
References: <20230913040924.3702830-1-judge.packham@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694726999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUDyCIpunLyOqU2eOnprb56NWAeg2XlapvjSVVvvrZA=;
 b=QjIVlAAL+Eo6HD66EoszlStTNg9jIci2UrMbOWntPC1a0RttQx1RBdWP6gfxr+rbPyyO1i
 sHoFtTCer9MydX+YM7Xd5KjY/WDze098SuN+WcJJ7UzQfPiCPBX5bwBoeKhz+CZmjVqfNP
 IDWDJ7MXhl0d4rPVSyhtZuoSztYq/KuJVUTyBwAnh79S3sgf6M+gh1lNTLd+6uK/Yd9FjC
 0yQyXlxrZ0ns+hZfoscy+hFKICHhxp9TG94itKHwKqpbgZyE6qfPKIAzsam67ltFP3t1Ta
 yy5MOiU5Cb2lUdOyLLZyz9OGBY09BxsQm2pNxH6FGZoKsQei6O3lcLCbjMN3Xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QjIVlAAL
Subject: Re: [Buildroot] [PATCH v2] syslog-ng: bump version to 4.3.1
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

On Wed, 13 Sep 2023 16:09:24 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> Update to latest version.
> 
> Release notes:
> https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.3.1
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
> Changes in v2:
> - Drop reference to irrelevant CVE

Thanks Chris for the new version. Please note that your commit title
are consistently slightly incorrect: we want "package/syslog-ng" as a
prefix, and not just "syslog-ng". It's pedantic, but most coding style
rules are pedantic :-)

Applied to master after adjusting the commit title. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
