Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738B5C0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21A4481586;
	Sat, 22 Jul 2023 21:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A4481586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_4R_8Zi9uDo; Sat, 22 Jul 2023 21:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E737E834F7;
	Sat, 22 Jul 2023 21:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E737E834F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F02ED1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C84EB4151B
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C84EB4151B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHK3-vwaGg8B for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:15:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1093C4151A
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1093C4151A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32D0420002;
 Sat, 22 Jul 2023 21:15:20 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:15:18 +0200
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20230722231518.686d4ac4@windsurf>
In-Reply-To: <1689767858-17206-1-git-send-email-gwenj@trabucayre.com>
References: <1689767858-17206-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690060520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1VZpxH08NcnyXdO6Vlrs8tfijnZXU0GhBJ1PPS0ObU=;
 b=BN4gFkvXYU8cAjm9cE1fexRkQ7SFJJw8q1Ivf11wnbrcT7dJ6WfPT8IUUB1SIDtRqflAU6
 +vyrv/qN9UQURVDPBjPN0Qvth1qu2lcO8frzAp6NVLfnXJzX+kPoOpGLbtamTTwtBxynxO
 rpZVda15kplkJtYvLo33EnEcJg3DGl9jMwvF2be/8bllmzoiQ79yr0wFGzI8LIn5BU03Dm
 bqFMoHuNjIwAuT/p5uv49C08L+bVZhWPaYXdhq2BtdW5mQTNOlv5hwDiu9ZQEnkjx2MBTe
 wLAVr1bpDTVhB2uMQYD/AOKebvyRzCw6G20gKHBt1UmrnB0uhE9CIn0kfBkPJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BN4gFkvX
Subject: Re: [Buildroot] [PATCH v3] package/gnuradio: fix gnuradio python
 libraries for cross-compile
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 19 Jul 2023 13:57:38 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> By default, module libraries have a suffix based on cpython version + host
> architecture: this is fine for a native compile when these libraries are used on
> the same computer (or similar computers). But when target architecture is not
> the same python is unable to find libraries due to the wrong suffix and produces
> unclear errors messages:
> 
> # python3
> Python 3.11.3 (main, Jun 19 2023, 14:15:44) [GCC 11.4.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> from gnuradio import blocks    
> Traceback (most recent call last):
>   File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 18, in <module>
> ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'
> 
> During handling of the above exception, another exception occurred:
> 
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 22, in <module>
> ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'
> >>>  
> 
> By adding _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" at configure time, sysconfig will
> return correct informations (target architecture) instead of host architecture.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v2 -> v3:
> - replaces PYTHON_MODULE_EXTENSION by _PYTHON_SYSCONFIGDATA_NAME env (arnout)
> Changes v1 -> v2:
> - replaces patch by PYTHON_MODULE_EXTENSION option (result is the same
>   but less "noisy")
> ---
>  package/gnuradio/gnuradio.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
