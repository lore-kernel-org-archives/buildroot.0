Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63FCC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6886D40949;
	Wed, 20 Dec 2023 20:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6886D40949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlOy6kaJ7n1f; Wed, 20 Dec 2023 20:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FDF4436FC;
	Wed, 20 Dec 2023 20:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FDF4436FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E894E1BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C529A40949
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C529A40949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f33IvafpvKOl for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:55:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C570403EA
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C570403EA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51D0120003;
 Wed, 20 Dec 2023 20:55:47 +0000 (UTC)
Date: Wed, 20 Dec 2023 21:55:46 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231220215546.3a763e4e@windsurf>
In-Reply-To: <20231125062409.708253-1-james.hilliard1@gmail.com>
References: <20231125062409.708253-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703105747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCQj1aunwo6AoojypPsISyUzfWtGrp6C1SLCyqueXpw=;
 b=Mj4SA9t2vmR46EPe7+WsNYZdNgjOvazqp5YzdiY0mS3IqA5VrRZqLqvBQ2qeU0Mt2+y0+B
 zLMVK+YNLuOZalDppHOLraKd2EFpSEiS5lLMo0IO2bsALPEgVRfUcjJRPK/CgmIR1MLxqi
 MGukthNXnDB0t0eG6fSD6VihX0ga4P8jfWgB0ZD13qsie9TC/MvqSiN7hH4dF/zIHQSa1z
 EZIVWzV5xzUj63WMJsR60Vmce/CA4ZoaltyK4K6JPqidTLyVIGZsKMHA1ZFxNr5Ycu8dnV
 YjiYoorBJblvDv7TLgI2V2k/iqTvC6J5rpHoILRBPUAqWXfIqGh6Bvcu//CKWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mj4SA9t2
Subject: Re: [Buildroot] [PATCH 1/2] package/python-urwid-readline: new
 package
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

On Fri, 24 Nov 2023 23:24:08 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                                   |  1 +
>  package/python-urwid-readline/Config.in             |  8 ++++++++
>  .../python-urwid-readline.hash                      |  3 +++
>  .../python-urwid-readline/python-urwid-readline.mk  | 13 +++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-urwid-readline/Config.in
>  create mode 100644 package/python-urwid-readline/python-urwid-readline.hash
>  create mode 100644 package/python-urwid-readline/python-urwid-readline.mk

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
