Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ADEC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D6CB40160;
	Mon,  5 Feb 2024 21:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D6CB40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsmg7ZxeBbWQ; Mon,  5 Feb 2024 21:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C27403A2;
	Mon,  5 Feb 2024 21:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47C27403A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2241BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4492341911
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4492341911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flp9yr0N_o9x for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:32:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FF7A418AF
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF7A418AF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 829AC40002;
 Mon,  5 Feb 2024 21:32:32 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:32:31 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205223231.7c6f5f5a@windsurf>
In-Reply-To: <20240126221237.1780047-1-fontaine.fabrice@gmail.com>
References: <20240126221237.1780047-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707168752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puEw+X5r9yyGOu8SwLglCujMQG3PnQxAqSyJVXoTASE=;
 b=ThpqRR81iHt18IsU+zxaNXH4PpSd9ORHVDAOZirHR8vv6dad6jObU+0x/6sKZQuPY10KUl
 Uq0WK3UqIWeUB/WOmT4KURakVtuDnjKqKkEtfAKcEoNKAtkl9a1ZUsCL1cZUW5+9QEtQpL
 hkQPDEq2Smx9Iyn045wj+ez5kXFLADZfdw0CROvyRiZsbQJvrxMgn7XFfUHni7LFWfEuWL
 8gjVBdK2BwTiQmhJN2tDKwknR4aJcOZtz12nPGnrhrMXE7ciKXMnto2vxMzcy514pRN4Ai
 T7jm7xO0gHhhavC3gZSExbjn26tY8LztqqMNR0AYi8trkjXDAeLVJN5ePmr8PA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ThpqRR81
Subject: Re: [Buildroot] [PATCH 1/1] package/libzlib: bump to version 1.3.1
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

On Fri, 26 Jan 2024 23:12:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/madler/zlib/releases/tag/v1.3.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libzlib/libzlib.hash | 2 +-
>  package/libzlib/libzlib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
