Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BE0C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 746DA40A5C;
	Tue,  2 Jan 2024 20:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 746DA40A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fSa1oIcvkA4; Tue,  2 Jan 2024 20:21:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74C5C40AB2;
	Tue,  2 Jan 2024 20:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74C5C40AB2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9B21BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA775415F1
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA775415F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZ1cXppAlygp for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB0DF414D1
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB0DF414D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAA3DFF803;
 Tue,  2 Jan 2024 20:18:41 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211841.7ae68ba9@windsurf>
In-Reply-To: <20240102175017.1018320-1-fontaine.fabrice@gmail.com>
References: <20240102175017.1018320-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8wezSSsBggMBXTnPkb9YWcgMHmS+lpcDdM8jlzvT6k=;
 b=TZqGeLWkOLAwktbRkOki2hgh5raMn2xbJbJwH9414NyFh4yhEIj/Q5lp3YnbTVOTJAh4el
 MIqfSau0zJBwdGL5XIcaLUpxzC5FyHUxwugmxt8nsNjOo0k7qm745CbcFG9+GVEcivumdx
 AmuTc5CJAgYyMofkseGz2YjLSYMa9SqNTaRS764IA/dcLVpw3CvxzssAw9riNzWDwmd7Gx
 f1+2X/bSyyptuhoamT+FECGaSYlMJZfd5kPNlea/Y1Ox+zOXogAXAKMlrkzOqtF1Xb0/p0
 PtjwfQ9FdAwQkSRLKjRZ4rSw2d7EMjUkIxe75yjlzAGoD0Q2HWoc/AbsBrmS9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TZqGeLWk
Subject: Re: [Buildroot] [PATCH 1/1] package/orc: bump to version 0.4.34
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

On Tue,  2 Jan 2024 18:50:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://gitlab.freedesktop.org/gstreamer/orc/-/blob/0.4.34/RELEASE
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/orc/orc.hash | 4 ++--
>  package/orc/orc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
