Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B58C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 153F581768;
	Sat, 23 Dec 2023 20:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 153F581768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ecteohmgtnm; Sat, 23 Dec 2023 20:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81F9481586;
	Sat, 23 Dec 2023 20:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81F9481586
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 825291BF388
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6866260A6A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6866260A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zonop-u-GbtG for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:08:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2739260A64
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2739260A64
Received: by mail.gandi.net (Postfix) with ESMTPSA id D69D2E0003;
 Sat, 23 Dec 2023 20:08:25 +0000 (UTC)
Date: Sat, 23 Dec 2023 21:08:25 +0100
To: Scott Fan <fancp2007@gmail.com>
Message-ID: <20231223210825.606ecf04@windsurf>
In-Reply-To: <20231208001001.6549-1-fancp2007@gmail.com>
References: <20231206012403.722101-1-fancp2007@gmail.com>
 <20231208001001.6549-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703362106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwcBJvSoXF4Q7O99tC7dU3zStpUJPzWfTH9p5PHzBpQ=;
 b=W7oIVkMftE3NnFYb+N6mp8+Kpnd35PI8VTF5hxShF5jxMQXqtrrSLvFYtYSJ86S3WxJywR
 wPL0m3jk4lyLzngKuK2J/Kz0jmZCpzFrW3giSwpQTdLzRwXtP5BEOo/mf6t8DzN5lrBLQq
 dPzemFm3VJxXMtN3LNrGOMK7TDs7z7OcEyTSWt0LaCWxqpTGQQ0ZsmnHmcgNscn0tEh1dg
 CqHrnYH/NWkCNCMQuky7ejeq0LROFmgqNpWND6zXnjEqaXDQlvtjDbGhDk1+4LFP4qqIw4
 sGsRiEUcasOyQvgYAD0rPQyc8NTixOan3K3yQOfxSAd/9ev4GVQy3H2FBGjN3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W7oIVkMf
Subject: Re: [Buildroot] [PATCH] configs/beaglebone_defconfig: bump Linux to
 6.1.46-ti-r13 and U-Boot to 2023.10
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
Cc: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  8 Dec 2023 08:09:57 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> The linux defconfig 'bb.org_defconfig' is the best for beagleboard.
> 
> To load compressed kernel modules, kmod and xz packages are needed
> because busybox doesn't support it.
> 
> Bump U-Boot to version 2023.10. The uboot-tools package is no need.
> 
> Tested on beaglebone black.
> 
> [1] https://github.com/beagleboard/linux/releases/tag/6.1.46-ti-r13
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  configs/beaglebone_defconfig | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

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
