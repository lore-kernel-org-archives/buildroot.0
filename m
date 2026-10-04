Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5579DCA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 07:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD7576061F;
	Sun,  4 Oct 2026 07:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYPUdPmQ6m-k; Sun,  4 Oct 2026 07:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9DD6460625
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791097665;
	b=iQs25rU7uVhOhXGx0667Lm8rrRTvdyt/7oTCYFncyVrgrAF6aDOcJES/CcWNw8iSxBcd
	 HBUPwfFnsSWvSuQQelFTzsoQVGLBOCAwesM0ktJ136ZT0hTxG9XOyoe/NY8j2aga+gke3
	 UhwR0nT81wkdxkoBu1+Ab6KzFOGDD2jK4mCHBrxkpoc0TP/UEX96/qkHjPtm8C7UEazhN
	 /FJ8Z07JEruBQS358MDStSJ5kXcWFwFWFJY+mlD77Jcqxn1Z/aG0o5VHLRI+8qA+Gd29Y
	 n9DmPpwZ9Mucr/T4weIU3k7Zmvk4phZ0+la3jmWWCzdfhKDlfZ4B6j9bAtlV3VJKBFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791097665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EAjdo8xDXDZ7zBILRDyftzO8JP+q79OKeItcM5VF4aM=;
	b=HWGgdfdxGsdg9hg3Fuv2oNHHZJ0/vFuExOUXKFIt1ZUG3yu/WujTFJp5+mgSagYsEEeR
	 W4NX/TU5f3WPSnLYlUfh7WxF9jbXvYm27T1GNWQqkanH7ShhDewGEyG6+nQ4sU1Y8Fibb
	 MppdznUFQE4+4klsEjZFyF9cAZ3FNuuDRdPAIuxDPGPkzJBpL/rZTZh1k4CPsUx2MFSzD
	 xQnojbYqOe6FT5ngMMxbX8313n6O7ozJKFIcfz8/wgsoOh75B3VQx83eQvcA5nUHT3Yub
	 RZwYFlf8nHf+npz7/did8z2swXlhVripFB2lTjN1e/dT5R765PjrvLp1hG3qOWpta6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791097665;
	bh=EAjdo8xDXDZ7zBILRDyftzO8JP+q79OKeItcM5VF4aM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e2QjIUHEXCh/r+IK+9GJRAEmeVZJF5VpevdZwCUozpNMfhjxGxJvC6IgCBgyZSAVx
	 4Ahc1D2PRqc3ymYMYN/XwDPQUHPBfDZxqYUbNaok8F66oVoexbJVY2ASbhE+FmnUG/
	 7TjUomAqzu/qQ3Dsl8Y3ioONWE9a/GR/geWkfJVMSka+LXAUrDKCFP3nfpAUuyeuJ3
	 4SVT5mfBOIdkXwdMkQxDiekiQjfLZHfJA4elAlH+4pF08o7/AOqOWmNSir7nIa44Gx
	 xvClU8biy3TWm2xdqe76cLNjqL+qOm0MzFnbi6G+OdqamRI6QfapNOUy5i3aS14IkF
	 HHS9rPhPiZfkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD6460625;
	Sun,  4 Oct 2026 07:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDFD71A6
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C447880DD7
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAObP5DI9hRK for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 07:07:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3BEF180D96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791097662;
 b=lqsbBYRfOvCMXRFF8G4c7YsfEac8G7+XQLPJ3P6ugyKH3ATA3OtZapZvmIsd2LlC9jH7
 ZP1/AYh09fM0omoAp05RCty2laST/PN6tMl8fDmTS8kCxak0/um+H5I0D4Ug7CAxzZgWf
 oYPOwHGM9dTE1RIjl/rfbcmKcUgl/1HN3A4qgnmdte0voXLZ6LP23xLwO3QNsdbFfSJvt
 n/kqhAHojZ8EYORBfXPTG2xRgC0Iwoafnzen2rsncV8kRr8S2RMbx4DCZ8xJxFMYNYM+b
 XYYppr1FP4T5k+cZ2hroxW1HQulTIKMbcaK+Qg5oHvVLpu5tC5vqhwkoWlYaQZpxVyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791097662;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=i5TGYgRni4rfIWPmvJGTPfYn55c0YwqeCYcYBl9uAqU=;
 b=Tr2gAczG1kA+DLTocIJ3sNCm57agbvdCon/gSZ90YNyvKtE6N3ilM1xUSJqss3UzthSW
 +mI/zi4YYM2icx9XzuGIAfFmRDvjg6VrPYVLZu/+UJd/YueR8Y+sS2XMNZ0IVDs2nAQDG
 lbQrKKX6azM3//EZ03mRZnvp9v4EWdmwDdssAbVymW2OUE3lYai5oCsxFZ2yG+aLL8REA
 uHZ2UPjusZ3zKMNekBemT/TKTwl/RGgbsNr+vLpohGX7JM4bHWHG+fiqZi/3qJdK9kJA7
 IOXMBj+TmxNu3oEC7hhowvssGyZnWg0EomsZKlaxxmvVKLmftLI78qVfP6x3myTa1bg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ugxvyktk; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BEF180D96
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:07:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C74261A1121
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:07:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8A423604FE;
 Sun,  4 Oct 2026 07:07:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6427F103282A8; 
 Sun,  4 Oct 2026 09:07:35 +0200 (CEST)
Date: Sun, 4 Oct 2026 09:07:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Message-ID: <asH65OsCbxwkLTux@windsurf>
References: <20260926130006.243930-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260926130006.243930-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/mpg123: remove MMU dependency
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

On Sat, Sep 26, 2026 at 03:00:06PM +0200, Bernd Kuhls wrote:
> Buildroot commit f0862592b3caf5bc9cd347fd29634673cfbbabd7 added the
> dependency to BR2_USE_MMU in 2014.
> Upstream made fork() optional in 2022:
> https://github.com/madebr/mpg123/commit/91f75fc026e37d88d25229b81c58bcf8d6d2a8eb
> 
> This change reveals a previously hidden build error with the toolchain
> bootlin-armv7m-uclibc:
> 
> src/libmpg123/synth_arm_accurate.S: Assembler messages:
> src/libmpg123/synth_arm_accurate.S:22: Error: selected processor does
>  not support ARM opcodes
> src/libmpg123/synth_arm_accurate.S:31: Error: attempt to use an ARM
>  instruction on a Thumb-only processor --
>  `stmfd sp!,{r4,r5,r6,r7,r8,r9,r10,r11,lr}'
> src/libmpg123/synth_arm_accurate.S:33: Error: attempt to use an ARM
>  instruction on a Thumb-only processor -- `add r0,r0,#64'
> [...]

So the ARM support needs support for ARM instructions.

> To fix the problem we limit ARM code to !BR2_ARM_INSTRUCTIONS_THUMB2.

Therefore it is most logical to require BR2_ARM_CPU_HAS_ARM than
!BR2_ARM_INSTRUCTIONS_THUMB2.

So I've changed:

> +ifeq ($(BR2_arm)x$(BR2_ARM_INSTRUCTIONS_THUMB2),yx)

to:

ifeq ($(BR2_arm)$(BR2_ARM_CPU_HAS_ARM),yy)

and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
