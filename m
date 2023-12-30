Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06704C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B319960A87;
	Sat, 30 Dec 2023 18:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B319960A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-J1lNuy0Wme; Sat, 30 Dec 2023 18:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1707760AAC;
	Sat, 30 Dec 2023 18:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1707760AAC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBEA51BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B63C5415CB
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B63C5415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GusUgpVulagB for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:01:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E570414C9
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E570414C9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E84F240003;
 Sat, 30 Dec 2023 18:01:02 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:01:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230190101.6636d101@windsurf>
In-Reply-To: <20231230152627.256604-1-fontaine.fabrice@gmail.com>
References: <20231230152627.256604-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sgGLr7AM0lGaPGhUn3e3aRuXUBbVYwZK0DZTzYBzAtE=;
 b=WCFukNfqvaIbDK0cYCNAwVVD/0wXzZFB8KiWC0gGV7VFgRRQpNF2C7r2BIn6CN5MI8qHVN
 eeYJWW37JXD5N21EnZdoempX3PeKrspLQCBu9T6VTMdIKuxiTFAywF7UOwpV+r9H12PsPo
 MXTGLF3nAW7KOgjei7Jf7C4XBWf9JiJoGa191DtBrDRkF+Q8nRxMmSKAo/1cTyDbtbNSlz
 ik+pfYPWDTKtXxXpuVtOh6S5Nb2lvPp7xrEHacN4vDYB6h55NWndrt61kH+YMuvH2KiXTw
 aFBUqh43fr/gulBRdKlgsd0Fn0vtrWZ+PLO4Y5xBmYhytUxJcmmGWmQoQTL3qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WCFukNfq
Subject: Re: [Buildroot] [PATCH 1/1] package/audit: bump to version 3.1.2
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

On Sat, 30 Dec 2023 16:26:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/linux-audit/audit-userspace/blob/v3.1.2/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ine-__attribute_malloc__-when-needed.patch | 35 -------------------
>  package/audit/audit.hash                      |  2 +-
>  package/audit/audit.mk                        |  2 +-
>  3 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 package/audit/0001-Define-__attribute_malloc__-when-needed.patch

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
