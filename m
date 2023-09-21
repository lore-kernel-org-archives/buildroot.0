Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A33FE71060
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 13:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1274283C69;
	Thu, 21 Sep 2023 13:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1274283C69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aPNlTzme7-z; Thu, 21 Sep 2023 13:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AB7C83C70;
	Thu, 21 Sep 2023 13:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AB7C83C70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 635B21BF3A7
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D11683C06
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D11683C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YprGeCK2w7A for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 13:05:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12D6383A3F
 for <buildroot@busybox.net>; Thu, 21 Sep 2023 13:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D6383A3F
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2EB8C000E;
 Thu, 21 Sep 2023 13:05:10 +0000 (UTC)
Date: Thu, 21 Sep 2023 15:05:09 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20230921150509.5b8c6c6d@windsurf>
In-Reply-To: <def97b614d83760ccdff6da585222e9c3be3d476.1695014695.git.baruch@tkos.co.il>
References: <def97b614d83760ccdff6da585222e9c3be3d476.1695014695.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695301511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6a/9M5XpopeNdFoj6I1NoroYV9GbrIGPKjnzEmaU4MA=;
 b=CHdxdyc/Ybq1+KplXvFqj7+72pqutK5cjhH1g2BP6WttTmVL8PRCsuSDEhM7EAgFw7VC3L
 n7dl4KeTM36BPRLYTRwTapkdVYNwuH9uaxlbOoEQ0WyLkqFVkEklqy/iLdxVgt8/MUc8CK
 /1HXgs7SBGH7AMCI2YZLzlW33oSPqkhDaoFxB0F/qZYmksavYeDjb2btZqwAhvS3x6pUop
 2WI6hyfWMdpXFarwLn3kB5U9ZgDC7Jd6in9w/hzFXxAm+PrVy+dLCVuRxfHJGgbPG05sQh
 VYvd4VCIzzuoK4ywD0oHPl8GOOdwwUahZCSlCCeIHgAfc6jg91ljqeE8TtS7jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CHdxdyc/
Subject: Re: [Buildroot] [PATCH] package/libraw: fix IGNORE_CVES assignment
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
Cc: buildroot@busybox.net, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Sep 2023 08:24:55 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Commit bc4110b0739 ("package/libraw: fix CVE-2023-1729") mistakenly
> added the patch name to IGNORE_CVES instead of the CVE reference. Fix
> that.
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libraw/libraw.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
> index cbd509cfea8c..63b50e340da9 100644
> --- a/package/libraw/libraw.mk
> +++ b/package/libraw/libraw.mk
> @@ -19,7 +19,7 @@ LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
>  LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
>  
>  # 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
> -LIBRAW_IGNORE_CVES += 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
> +LIBRAW_IGNORE_CVES += CVE-2023-1729

Wow, I'm impressed that pkg-stats didn't even blow up on such a bogus
IGNORE_CVES value.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
