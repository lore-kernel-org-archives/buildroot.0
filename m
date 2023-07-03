Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491EBC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED21D81759;
	Mon,  3 Jul 2023 20:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED21D81759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjoUtz7F1ndN; Mon,  3 Jul 2023 20:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 262BC81492;
	Mon,  3 Jul 2023 20:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 262BC81492
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4551BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECD7981492
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD7981492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWLxHdcB-Inf for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:06:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7F4781376
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7F4781376
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:06:16 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E132E0005;
 Mon,  3 Jul 2023 20:06:14 +0000 (UTC)
Date: Mon, 3 Jul 2023 22:06:14 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230703220614.2d4d65ba@windsurf>
In-Reply-To: <20230702115443.585493-1-ju.o@free.fr>
References: <20230702115443.585493-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwFA9M6eqZ2u5CZ+pJBrS1e47DZXXHh750VKyiN94co=;
 b=kw4ux9u6KNQcRld9e0OTFOzAuS+KsrlWi0hMS27Gq68v+qXsrTWKGz6nI9qss8OMbOiUOm
 tENjtCegnKZpbvH+6XL3+2LSXHzwtGcCnplNvj/tkoAZMM+qZYL1C6S2x1jfGO+W6hgaoj
 GIjbFhe3v2XOmzHo4Y1Qe6Q2T3kSYyzCO0LivvWng1h1zyj61AEO4nfgRRulgArigZSe78
 4ROgM/OmZg0q5TimcE5CNsQ6qwLRhzOfkaqx7ZJH2D89sHXlrjpKhctEoschw0QWDTAxON
 5/eQ9V9GbiSMZFz1TwK8ziqz5CZeY8qk7iGZ1W7UoKG5K4Lw6GMCqliIG6ZKQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kw4ux9u6
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: bump to version 5.4.3
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

On Sun,  2 Jul 2023 13:54:43 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This commit changes the version branch from 5.2.x to 5.4.x. This old
> stable 5.2.x branch is expected to be end-of-life. The package
> site [1] mention:
> 
> """
> 5.4.3 was released on 2023-05-04. A minor bug fix release 5.2.12 to
> the old stable branch was made on 2023-05-04. This is probably the
> last release in the 5.2.x series.
> """
> 
> For a change log since 5.2.10, see [2].
> 
> This commit removes the package patch since the new version includes
> alternate workarounds. See comment in [3].
> 
> The COPYING licence file hash has changed. A note about
> Doxygen-generated HTML was added in [4].
> 
> COPYING.GPLv3 license file hash has also changed, as the file was
> updated (http links changed by https) in [5].
> 
> [1] https://tukaani.org/xz/
> [2] https://git.tukaani.org/?p=xz.git;a=blob;f=NEWS;h=7f83c81f61e8e6aa81525e44c072c76205eeb14b;hb=238b4e5458b4bd2cadefb768b8ea7c6b70a191ac
> [3] https://github.com/tukaani-project/xz/pull/32#issuecomment-1438396969
> [4] https://github.com/tukaani-project/xz/commit/f68f4b27f62f53fdac570885a1f4f23367ce6599
> [5] https://github.com/tukaani-project/xz/commit/5a7b930efa7f9849d8da8397e8e5d8638f92be40
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on top of branch master at commit b335bd1 with commands:

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
