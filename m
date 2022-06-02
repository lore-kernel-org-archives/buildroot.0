Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8148BC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32AF3418BE;
	Thu,  2 Jun 2022 14:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7w5uJJYIzrD; Thu,  2 Jun 2022 14:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B57940941;
	Thu,  2 Jun 2022 14:01:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B86C1BF32D
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B00B60B65
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebZ6kipkuwDi for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:01:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AD5F605A6
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:01:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B21242000E;
 Thu,  2 Jun 2022 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654178497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAvhXLuTmBiNJ9wjrTZ//sbfZ9amnRELxBCdnYHz3gk=;
 b=QITgldPZED+tO/TQXyoE3zr6f+evZNFv02HnEswHc+uwfjsmzI8JDG7Cp/cMeRHBmwN+U2
 /90h/ypyZ2vd2+gPWpQsGH6cTVPylC5IUo0XFRXhwv6YWMRl2l+zEr8KXV3UpJ4BAOKKZL
 lU8tdV623u12Gs9BhSJAD7pglz3nkUVqyLpm04+HruSyQNTL4BRNWmfSP9d/axN1PJ8nem
 wXIoVXFjd+9BDO/e4DQVmiPZ7kM3AaYBqf9ENmmpWJOhZ7JMJsxlm3m0gD2lgfS8FLtjOp
 Jhy1BKD2Pas7rOU0SGMA+0E8NP9PBy5eN8Xo09wUY50C/CwhQQwNR1f9LY8RAQ==
Date: Thu, 2 Jun 2022 16:01:35 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220602160135.62494673@windsurf>
In-Reply-To: <20220525135913.1615308-1-aperez@igalia.com>
References: <20220525135913.1615308-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/seatd: bump to version 0.7.0
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

On Wed, 25 May 2022 16:59:13 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Update seatd to version 0.7.0, which includes a flurry of small fixes
> and removes usage of the SEATD_SOCK and SEATD_LOGLEVEL environment
> variables (the latter replaced by a command line switch).
> 
> Release notes: https://git.sr.ht/~kennylevinsen/seatd/refs/0.7.0
> 
> The -Dlibseat-logind= option now needs the "systemd" value when the
> logind backend is systemd-logind, this patch adapts usage of the build
> option accordingly.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/seatd/seatd.hash | 2 +-
>  package/seatd/seatd.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
