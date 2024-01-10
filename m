Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164FCC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CBF9436D7;
	Wed, 10 Jan 2024 20:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CBF9436D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgZ1SWBuviTs; Wed, 10 Jan 2024 20:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97F4B436E5;
	Wed, 10 Jan 2024 20:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F4B436E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB1E11BF277
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4A2A8354D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4A2A8354D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbJnu7Ia0Bbj for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:59:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C95F583455
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C95F583455
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34EB31BF205;
 Wed, 10 Jan 2024 20:58:59 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:58:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240110215858.177a512f@windsurf>
In-Reply-To: <20240106181754.3159736-1-fontaine.fabrice@gmail.com>
References: <20240106181754.3159736-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704920339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TG6nEPVelLwwZ7V/A+TZwwuwMWEREHjp4ha1rqYwLA=;
 b=pQpcUZXieOGhyEfNGwXupfd+vjWuxADuu1C1nFiKXbpmx72rTF6emStvV4EsnDPkduNBwP
 ej0BgarQaFjwT42DEQVzBMOFS2PO44eKq8uMLojrAGuG33VP0Aunj2Q6cjR+wn/lmZ8XL0
 Rs2lvoaYuZQuQr0EHjphCYN0FtF3cM7neMbFuG69Z1r3ppSVFxEKB2nifYA5Fl0DcelrvJ
 UNvCa8uzuzBCrrLTQ10/aGPgoFP5+lU5KaDAM3rnaxg0KXP/4FZNS4WaKle26M6e4dcuUj
 20GWGxlWtHYGmVP+n4aZ/WnbwYso7PRKrbMSS34MzPaZ/j5CAv7nG3baP3Ndgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pQpcUZXi
Subject: Re: [Buildroot] [PATCH 1/1] package/json-glib: bump to version 1.8.0
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

On Sat,  6 Jan 2024 19:17:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Handle new nls option added by
> https://gitlab.gnome.org/GNOME/json-glib/-/commit/31998d84cb241a4c6343c97afc06ee24e60db032
> 
> https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.news
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/json-glib/json-glib.hash |  4 ++--
>  package/json-glib/json-glib.mk   | 10 ++++++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)

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
