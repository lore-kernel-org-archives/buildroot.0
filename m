Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C15C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 20:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF12960BB7;
	Fri, 18 Sep 2026 20:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJ_D_XU1ZLwj; Fri, 18 Sep 2026 20:27:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 93F3160BF7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789763257;
	b=BKZStfMdFS1cZUZN4zQSwhHuDxdd3EcF/1A4SBxQpbSP7gpfW6KZmUIUTcIswYvY5MYn
	 Evt8VJ+h4RUHhs+V6I95fFQe6uB2ll4Waqpw7OS8pZ45tBrgzIi/OUbG0CnSMa9v5gvsv
	 QXH3zq0nSv3u+v6/XV4WEW1UCoTJnazRPZzPDlVma7bKj7/a3V2Mpqnen+Gbmbd8eGXoL
	 1y3U5lhNUMoiKlg8gE4cxmkql8QXCwMH0bJsSBitc4pL/8bwH4gexzejQZjBKCY50dou+
	 i9TSjS8YJH8hogm+a8A/4V/7tjaepM+xtR/SHMROKix6roJn12QIIxUIkcZzas+XSRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789763257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MYdasYa5Wc0mFl4CHuzhHaqzF+kagbc1ed9hBA7oESc=;
	b=N5GDRSm8d+Umm7vyVZm2oq5bTL/urlJThk+3grPTf48F2ujFgMEFUkQrRrfV7mn8o3cv
	 05T6ired8LsgX2/z5aW3xzLkssu1EuJdL7kPjiPn/kzDKyHIe2usnS0BOhBzdXsJwDYC5
	 65taZ2DvFmDaEKQQDYSLXMDIfJedTJaWF10aUS93J9ynPuauHpCpMjDa54J5KrW796uYX
	 y7VcphlO/vAgLEAoCd0J9C9R2e+uIObjhnboIWINEGHk3O/LWzP4LRp0FBW1Lumez127I
	 nXoJYbIgtkOGGl2ereB7lBX85tA5nFnQpmy7mIuhKFM1ln/P35GZYJk0EDGYyYZM4DQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789763257;
	bh=MYdasYa5Wc0mFl4CHuzhHaqzF+kagbc1ed9hBA7oESc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LTwHfCsYbfANeAyIeRP2eF+GCvr6+PrBxtmhML5FfcwGPXFijcagyvBT4DAVqxAUE
	 qw4Jn9PJQ+tBFLCsyzHTttbZ4M7XJrTcLq0hJsF1LYAdvtd/4TGgPQLVikljCznpY4
	 vzz9Zk2LipTA+ZC92fK22rmNZRjMOm0kYmtSiItKIL49qqQYYJ52UrIxvrsco7vvnk
	 uIeIiU0ElZc2R5JccvquyY+81Dod+gPkyeF9rzhqbsd7/gB1npd2867aUBePniVmpr
	 Rvp/LcIn8+QmUZQKY7LNxeZ7PbPcnq+yXtYOJtTmzwlguQFVmKRciEPQeMfX0d39SC
	 Zkp47bV5/tKOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93F3160BF7;
	Fri, 18 Sep 2026 20:27:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A50F13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CA6640022
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1UxBwS4ybgQ for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 20:27:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AA0674006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789763254;
 b=ON9KPFzUz4YZlcxeomq/oQlgVJT6B4CY1H1r5vXDx0K/yWyQS6uFRttcMfQDeaPBxxJq
 AinPc8Qn/Y3c1+SHRlvkD7x8Dhyu5G0gxw4yBLcaiSgpuRR4uEkmYqHFmAUicQorhW0LB
 QdfRUhx0bjvb5bQrlo3Hs0zF0JvEzMofBUuXwHe+ztdMJg7o+ngQiQ+IkC3rHfyhsivjm
 Cb6DIsAp2dQ93w7PqJXp6EtTIi3FAUVTuINWPoTg9l01sMsD34yE5cYcW2FMqQLTfucVw
 5c+oi/fuVNYnRfspCAxYHnvKlaRBfmEG6inUqbh3fQLvXgyu6NAdAR1g2Er0wN373Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789763254;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=eFtLCPX8msKLzDrOnaUBOUAjdHKZjn6cQocUbeMVWRQ=;
 b=PNzPBZHwGw6RL03CRpOug5yk1HcBkcrYRUQjpwE3OzR7H0Ttjzf2b2WYkv27CbJDU+rl
 Y6MTTj7ry5TDB3kAeryFEcsORNlOs6ksLU2kSxiuOmm4p/uvC54S1zxnj3oNVJOGkIVoK
 C+72VdM1TP2lvyyZ+y12kW7sQg63MYnGdcRSIXRm/L06KSiwjWZT7rtSJkYuzkGb++Wcu
 i66CrwIO3nqDrY3iR3S8HEj0goPn0vRTP7CXt0qy+FjCgqz10IZRdP2egLMmUVW7Gx1p/
 NVTl11kUzi1h+0VWzxkzOpRbveYd0ZSV0P5T2xnFFddUKA5KRtNs7+tkwBPjJpuwdSw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=s0hC5KgG; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA0674006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:27:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 576AC4E40885;
 Fri, 18 Sep 2026 20:27:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DFE5060649;
 Fri, 18 Sep 2026 20:27:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D7D4810329075; 
 Fri, 18 Sep 2026 22:27:24 +0200 (CEST)
Date: Fri, 18 Sep 2026 22:27:23 +0200
To: Sebastian Michel <sebastian.michel@oss.othermo.de>
Cc: buildroot@buildroot.org
Message-ID: <aq2eM8i4IYzeoV9B@windsurf>
References: <20260825073605.68465-1-sebastian.michel@oss.othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825073605.68465-1-sebastian.michel@oss.othermo.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/mali-t76x: add missing license
 information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 25, 2026 at 09:36:05AM +0200, Sebastian Michel wrote:
> Added MALI_T76X_STRIP_COMPONENTS = 0 as tar archive follows nonstandard layout with license file being in the topmost directory
> 
> Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
> ---
>  package/mali-t76x/mali-t76x.hash | 1 +
>  package/mali-t76x/mali-t76x.mk   | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)

Thanks for your patch. I've applied (after doing minor changes, see
below).

One question though: are you actually using this package?

Indeed, its upstream site is dead:

Failed to resolve 'malideveloper.arm.com' (Name or service not known)
Failed to connect: Connect error

so we're always falling back to the backup copy on
sources.buildroot.net.

> diff --git a/package/mali-t76x/mali-t76x.hash b/package/mali-t76x/mali-t76x.hash
> index a754b98074..751d0e7bf2 100644
> --- a/package/mali-t76x/mali-t76x.hash
> +++ b/package/mali-t76x/mali-t76x.hash
> @@ -1,2 +1,3 @@
>  # Locally computed:
>  sha256  5a0b00438edc8066b374481d3332a43c07ec2bd3bc73265983a968970f754902  mali-t76x_r5p0-06rel0_linux_1+fbdev.tar.gz
> +sha256  b0ca7cedaf4f604a1c863ea71f741d6ca1474aebac7e606ec43d725b3c74cc63  END_USER_LICENCE_AGREEMENT.txt
> \ No newline at end of file

This lack of newline was causing a check-package warning:

WARNING: package/mali-t76x/mali-t76x.hash:3: missing newline at end of file

> diff --git a/package/mali-t76x/mali-t76x.mk b/package/mali-t76x/mali-t76x.mk
> index 387685c033..05d7d4812c 100644
> --- a/package/mali-t76x/mali-t76x.mk
> +++ b/package/mali-t76x/mali-t76x.mk
> @@ -10,9 +10,14 @@ MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T7
>  MALI_T76X_DEPENDENCIES = mesa3d-headers
>  MALI_T76X_INSTALL_STAGING = YES
>  MALI_T76X_PROVIDES = libegl libgles
> +MALI_T76X_LICENSE = ARM Mali GPU EULA (LES-PRE-20376)

The (LES-PRE-20376) information seemed pretty useless (not
informative), so I dropped it. Did you have a specific reason to
include it?

> +MALI_T76X_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
> +MALI_T76X_REDISTRIBUTE = NO
> +MALI_T76X_STRIP_COMPONENTS = 0
> +
>

These two consecutive newlines caused the following check-package
warning:

WARNING: package/mali-t76x/mali-t76x.mk:18: consecutive empty lines

Applied with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
