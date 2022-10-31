Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE7C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99F21405D8;
	Mon, 31 Oct 2022 12:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99F21405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdwfxDmyG-rF; Mon, 31 Oct 2022 12:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B297B40439;
	Mon, 31 Oct 2022 12:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B297B40439
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FD621BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EF9A40439
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF9A40439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkEBhgb3d_ud for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:25:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1751740436
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1751740436
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:25:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EFC17FF815;
 Mon, 31 Oct 2022 12:25:20 +0000 (UTC)
Date: Mon, 31 Oct 2022 13:25:19 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221031132519.4e5ebc69@windsurf>
In-Reply-To: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
References: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667219121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62vTY5Dpzi7jHvP6TEXCJt2udRx9d1gVDaFy7qAojVg=;
 b=QekIrm5LAoJD0l1DNdMbW4ooYNj9GqY2NBgX60ewE6cBk7dHVKAArmZvmvuioJzezRdqAm
 2fGhYaUXWMFunvslT3P1vIznAHJTI7xvznMUgAixXKqeuEaSNYqTC4oierFIjDlvCTxfWZ
 EbcQ+ys26a6DFcAhN4afy9YSHwVNkaekF12k9aQFdGnywZLMg6WSmfuRNVbnKiY93/0zDb
 hQQl2M2UT96sttTldBd9LWM1hS90pemyvlwFgvYTxPSdUzQXJkl9NfilYDplr4yvIsvz4K
 4S2x2h6OXFYA8mH1/nRNrMsS4Ts2lrLIIwcKlcOp4L/KFjK4UDXQrKfbSDjKWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QekIrm5L
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Wed, 19 Oct 2022 01:46:17 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> At the moment all APIs folders are copied to target increasing the size of
> rootfs of ~190MB. Allow to select which API folders we want to copy to
> target to shrink rootfs down.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for proposing this.

Practically speaking, could you describe which folders are needed in a
typical scenario you've had?

Here, I have these ones:

drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:58 2.0-api
drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:58 3.5-api
drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 4.0
drwxr-xr-x   2 thomas thomas 12288 oct.  25 22:58 4.0-api
drwxr-xr-x   4 thomas thomas 16384 oct.  25 22:58 4.5
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5.1-api
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5.2-api
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5-api
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6.1-api
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6.2-api
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6-api
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7.1-api
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7.2-api
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7-api
drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.8-api
drwxr-xr-x 145 thomas thomas 12288 oct.  25 22:56 gac
drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 lldb
drwxr-xr-x   3 thomas thomas  4096 oct.  25 22:56 mono-configuration-crypto
drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 monodoc
drwxr-xr-x   3 thomas thomas  4096 oct.  25 22:56 msbuild
drwxr-xr-x   6 thomas thomas  4096 oct.  25 22:56 xbuild
drwxr-xr-x   4 thomas thomas  4096 oct.  25 22:56 xbuild-frameworks

> +config BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL
> +	bool "Specify folders to install to target"
> +	help
> +	  Allow to specify which Mono folder to install to target

I don't really have a very good suggestion, but I don't like the name
of the option. We rarely have option names that are "sentences", i.e
"specify folders to install" is a sentence.

Should we instead have a single string option
BR2_PACKAGE_MONO_INSTALL_LIB_DIRS, which is empty by default. When
empty, it means all folders are installed. Otherwise, only the
specified folders are installed.

The other obvious question is whether this shouldn't simply be left as
something to do in a post-build script. Even though I admit that
reducing 190 MB down to something reasonable can be seen as something
that is almost mandatory.

Or alternatively, do we have a better way, where we could automate this
selection of which folders are needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
