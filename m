Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6733AC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CB5781466;
	Mon,  8 Aug 2022 21:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CB5781466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z07shYbQPrLl; Mon,  8 Aug 2022 21:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F6B8142E;
	Mon,  8 Aug 2022 21:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39F6B8142E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF54B1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85A4460AEF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85A4460AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GQz-KinDqmx for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:08:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BAD960B09
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BAD960B09
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:08:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5619F20008;
 Mon,  8 Aug 2022 21:08:47 +0000 (UTC)
Date: Mon, 8 Aug 2022 23:08:46 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220808230846.6ff15f1b@windsurf>
In-Reply-To: <20220808201424.196176-1-ju.o@free.fr>
References: <20220807165538.850640-1-ju.o@free.fr>
 <20220808201424.196176-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659992927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUhSOFZJ7Y9qSRX+BfcxZ3JBg73JnH+8Mc5DRXcddPA=;
 b=DYAxIFAD5IJdIFCOSaGLZHZRNp0N8T5kHsD9YtpY0Zwk5hCFLwk8HmsqsXLXHYKq2eG8lM
 bYr962BP62mUUBf7ZyAIZaIgRMr3GrG2DcpQGA27Z6snGzvtFy4GHlarU3erIwbntb+sE1
 kVBSdUKbpTfrptJ1UAMUSTqm7tf7MkSKSRSRya/X7vLEkBynylkVhls1BRn6RIbtzM7G4b
 A6Mfo7oSI6VQc3kiddDIWfepmsW3xH1JabuJfw3A3hri86tOVxrBe/VtJ7TKrTcdOKrOPH
 GhhDu5ihMZmRKp4APKogtF2azjHmHAe2OlFYOL8Dtn05Ev95OckhykEWKTYBSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DYAxIFAD
Subject: Re: [Buildroot] [PATCH v2 1/1] support/testing: octave: increase
 test timeout
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

On Mon,  8 Aug 2022 22:14:24 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Octave package test can occasionally fail due to timeout while testing
> some octave modules. This commit slightly increase the timeout value
> to reduce those failures.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - removed tweak of self.emulator.timeout_multiplier,
>   suggested by Thomas.
> ---
>  support/testing/tests/package/test_octave.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
