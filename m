Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1A4C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB288402BC;
	Tue, 25 Oct 2022 18:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB288402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jxt_Z3C0ihx; Tue, 25 Oct 2022 18:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BD8402AA;
	Tue, 25 Oct 2022 18:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59BD8402AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 957951BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6148240179
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6148240179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NU34Nra1Gjkx for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:23:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A4F6401EE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A4F6401EE
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:23:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC69D2000A;
 Tue, 25 Oct 2022 18:23:21 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:23:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025202320.1dffc4a8@windsurf>
In-Reply-To: <20221023210951.48256-1-fontaine.fabrice@gmail.com>
References: <20221023210951.48256-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666722202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5P5ouZZ1zNapirTwQHD2JqyNywHtDe+aKQvlavGVB8=;
 b=BOQ0hE7rFyZ8f0Uo2z00yZUtigPu9dAgy/+i8beZpd2jYxnHxSdfCRN6Kwoq9FD0AoZz+q
 EYB90gVdYMs83LegSju6gc0vJd9ryVRwWsxfO+Uv1RwyqnXwlMcoij8JppJ/eV5VBzwnH2
 sw5m2fd7/Spp7m77FK0Q/UJkVEPcqAXA6TSTIvEbQ9lhYUtsX5ML5T33/fR0U0hbooY0N3
 EjyQlASyjKgBJUIIslzIIS68jjfa1JcnZLx9t16svCb+ydjHeyhiJI3ogPvA6WS9s54wqY
 hhZ5uXArbNtIoohWZms6+aScUBs7ZQGOjlRigFNE2vAFV43Rp8KQqCzKpvIB1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BOQ0hE7r
Subject: Re: [Buildroot] [PATCH 1/1] package/lensfun: bump to version 0.3.3
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Oct 2022 23:09:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch to new upstream site to get latest release
> 
> https://lensfun.github.io/changelog/2022/02/22/Release-0.3.3-Changelog/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lensfun/Config.in    | 2 +-
>  package/lensfun/lensfun.hash | 5 +----
>  package/lensfun/lensfun.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 7 deletions(-)

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
