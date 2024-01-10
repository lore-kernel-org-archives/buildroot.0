Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F1CC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E7C74378A;
	Wed, 10 Jan 2024 20:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E7C74378A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdpXCqGXggYq; Wed, 10 Jan 2024 20:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97982437EB;
	Wed, 10 Jan 2024 20:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97982437EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1DB1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8B25437EB
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8B25437EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifmx9FkqvXaz for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:19:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68EF243786
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68EF243786
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D037FF806;
 Wed, 10 Jan 2024 20:19:41 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:19:40 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240110211940.4aeb73a1@windsurf>
In-Reply-To: <20240107214255.3331708-1-james.hilliard1@gmail.com>
References: <20240107214255.3331708-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704917981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uLJ+xqrqw9Ght5LHn4powHDmBcX4Z1ktBADdchddqSA=;
 b=mGbEQihGV64ly+SZHmjH7/vkxvETtpiHrWPvFvevkYofRrIemJDNqEaN4lVyX+p0qTARmq
 YtigMeFUS1e1dVOT7U9tjKn6ee8vnrchBsAeC5prArS1GaEGZChwFoVSx2pSus7iE9HoqY
 oPBHwEeNL7TvcspZ2Z+OkUPs/1l7cChiWpHYVogKLxM20I0UYHQFX7i4eaSrutHrzvR50t
 G0YJx75Z2WcM0eRXRhgin2lpqdMZ0qJ7Ol5wAhZi0nIrTFuTygnGIOK6JDS3PDLgfL3FE9
 LF9YJ++/LxxbR+iW+Q/0XzwI18BpxUDWT72Jfh9MIk9KKR/gNsHtVcQoCOQ/lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mGbEQihG
Subject: Re: [Buildroot] [PATCH 1/2] package/python-brotli: drop C++ depends
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jan 2024 14:42:54 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> C++ is no longer required for python-brotli as of version 1.1.0:
> https://github.com/google/brotli/commit/c8df4b3049ff1283fc4525defbcd003188f88963
> 
> Drop python-brotli C++ depends comment from python-weasyprint
> reverse dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-brotli/Config.in     | 4 ----
>  package/python-weasyprint/Config.in | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)

Both patches applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
