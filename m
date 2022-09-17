Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B2ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5C4E404B4;
	Sat, 17 Sep 2022 09:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5C4E404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCsnJFEytS1z; Sat, 17 Sep 2022 09:08:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23246401D8;
	Sat, 17 Sep 2022 09:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23246401D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 566CA1BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31B8C401D8
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B8C401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbWkFwwq4fQZ for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:08:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D70FF40121
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D70FF40121
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:08:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E434420003;
 Sat, 17 Sep 2022 09:08:28 +0000 (UTC)
Date: Sat, 17 Sep 2022 11:08:27 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917110827.33712c58@windsurf>
In-Reply-To: <20220911205203.5750-1-fontaine.fabrice@gmail.com>
References: <20220911205203.5750-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663405709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43GLovTi/Fvj1yv2xKzaY7DrJW6n01EOqpNJtHIQCQM=;
 b=MTsOFUHSTr2jDdRrLPOqnaBzNurs+KEgws/yWTWA+FiK1qxOPOMTIYQ2thDxkFrrdnKaTC
 1P4E537RwZjZWL/OGCALac8rb55bmKOWF3QDWZGiZHWzV6mseR4VAlAZW8QCiYcNiG4frw
 MNY0yCH320pJ5c85EFLDwMGAcZpi+hdqcNQfWscy8lnMIlAUaY/0Rsi7AXtlYPELLErkvV
 /nAppKlNBzDsweWdKVIlI7ULi3vbBG/mJbkZcyfJraOoTdYDjXQ0Vwycn6lKKCIf6htaBc
 qk1HIDrup//DQ2cWrfL2vlfkxUxjMErxvISoHn8/9V7O2LyHEnOkwpin2t2sDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MTsOFUHS
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: fix musl build
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Sep 2022 22:52:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure raised since bump to version 2.5.2
> in commit 5bb747f0b783a0d3f1712350ca3277263045b299:
> 
> gensiotool.c:47:10: fatal error: sys/unistd.h: No such file or directory
>    47 | #include <sys/unistd.h>
>       |          ^~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/99a60831da94f94fdf798c1c30cc09f0e51416c7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-tools-gensiot-Fix-build-with-musl.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch

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
