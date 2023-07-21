Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320ADC001DE
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0B6940128;
	Fri, 21 Jul 2023 21:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B6940128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwZqlvYEyXec; Fri, 21 Jul 2023 21:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01A614017B;
	Fri, 21 Jul 2023 21:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01A614017B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 145971BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED99841FDC
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED99841FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMgrdl-yrYt5 for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:12:12 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55C3F41FD7
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C3F41FD7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E28060005;
 Fri, 21 Jul 2023 21:12:09 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:12:07 +0200
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20230721231207.70275816@windsurf>
In-Reply-To: <1689767858-17206-1-git-send-email-gwenj@trabucayre.com>
References: <1689767858-17206-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689973929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0/P3XhGMTKHR1K0GeDPPhEg/NKF7vgXlerw0buOOko=;
 b=bKusgeP56XU/clVc6hixGkvBPxPzDWRQ+L+coBe88LV3odeBGsAINEBlDf0kRIcqel2ZD2
 x1h+eqZDF4FIe3zdGPOkbt9j3b1nRoFmfQQRUZZUPCJR2BP855MmjstamdULOK3wL8Q9bX
 GmauEzDjqxgCz6IL95aU64Xf47e0tUIlAct2sc6nYZB0S3AyUtnSslGHlrRgQnphNaoaqt
 BUBpPMe/VwFR+2otpw3n3W2efSEtNA2Fi4GSttATeRatc0HRAsKbWwrPbGjoNIX77/lRLz
 pPf7L/zVwEwim0NNHFCPdj+rXJla8F2F/iyn2UUOlgcCDoH08q7WMMlL+Lkv/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bKusgeP5
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
Cc: Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
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

Not a show-stopper to merge this patch, but would it be possible to add
a runtime test-case for gnuradio Python modules in support/testing/ ?
I'm sure if you provide enough details to Julien Olivain (in cc), he
will be able to help you add this test.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
