Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11992C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DFDC4175A;
	Wed, 20 Dec 2023 20:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DFDC4175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id icQBeUkEqtjg; Wed, 20 Dec 2023 20:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C85F41767;
	Wed, 20 Dec 2023 20:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C85F41767
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 125471BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1FD541767
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1FD541767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fR0fWzplRbB2 for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:24:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 207D140253
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 207D140253
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EC651BF205;
 Wed, 20 Dec 2023 20:24:46 +0000 (UTC)
Date: Wed, 20 Dec 2023 21:24:45 +0100
To: Davis Mosenkovs <davikovs@gmail.com>
Message-ID: <20231220212445.16494c0f@windsurf>
In-Reply-To: <20231218183230.1899-1-davikovs@gmail.com>
References: <20231218183230.1899-1-davikovs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703103887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPCxeHlJ2K0lsqBlU3DgUuO/YfdacAYkkxQAX0OImNk=;
 b=QKKJz9CtZTjtUNHYc/ux2Pisjcsn/om4xQQway+sV2OiddrygrJbys3pF1zcc6NWG0RCJV
 K/pZXu0DSxPC8wZ2OCDl5nMwb7XAc4ellC1i2vuTjiASQXkQ+totiNmfWXbXMZEv6ddoPu
 L1ynIPiG3dAKnjFd3GO/bdhrkK0gK3OtqxGxb3aibZJzlSyd0J/HSgO+mCeYmuKVXKlRZO
 xCN/VjqaoVd1Zjxz98PpUfUbGR2ff6It68t5HSdJkMLYYgETlsqg8mDAaWJMJrZq3bO3+p
 bZE7+8UQzKQEGnPcSiOr4y5ne2a7UNbMcoNL0M5n6GU7WxhMHBQGQTWW+UhnEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QKKJz9Ct
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.71
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

Hello Davis,

On Mon, 18 Dec 2023 20:32:30 +0200
Davis Mosenkovs <davikovs@gmail.com> wrote:

> Changelog:
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog
> 
> Removed patch which is included in this release.

Thanks a lot for this patch! From a quick look, it looks good. However,
there is a silly, but important issue that prevents applying your
patch: it lacks your Signed-off-by line. Could you resend your patch
with this added at the end of your commit message?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
