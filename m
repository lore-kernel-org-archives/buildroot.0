Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6302FFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 20:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35C8812DC;
	Mon, 31 Oct 2022 20:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35C8812DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-VUDUkIYw0R; Mon, 31 Oct 2022 20:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1412812A5;
	Mon, 31 Oct 2022 20:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1412812A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 276F71BF2F9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 20:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02933812A5
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 20:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02933812A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpLylf13EbNr for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 20:47:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEAB98129F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEAB98129F
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 20:47:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 871411C0004;
 Mon, 31 Oct 2022 20:47:40 +0000 (UTC)
Date: Mon, 31 Oct 2022 21:47:39 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221031214739.6b258cb3@windsurf>
In-Reply-To: <20221031174632.377586-2-troglobit@gmail.com>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-2-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667249260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZcZA/ktECATpFUqAHlYw+wOijm68ZvwHte4PO9sAvM=;
 b=de4/FM4vBw3NspjdEHCHd1YSdarN4KEBeChFTBcsa+knVrvP0JbzO253YT6dWQ9uUnVbxf
 expdPOthOxQ3LSsntzLVJVifasRin936iDbk2xu/i07YUBQkr2xixE9KI8D8rTk90x2D07
 Q1SJ2LwlDr5lDkB3LMZkeiVhvhPySYU18vLHTrXVqmfQQ+BinhRN8AWmUp85u22aHRsJGx
 Xn0xT/PtJSGfskYmy4n+5177TJNu03lLO83KLfLIe64TU6axoMaLzePBG4smnaaIWXTwjo
 TidvrU88ctDUs/f0wHsFs+iSDJ9PiK8WFmf1xNUXWgN1BFiaINv81ey9weJ6gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=de4/FM4v
Subject: Re: [Buildroot] [PATCH 1/3] package/ssdp-responder: bump to version
 1.9
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

On Mon, 31 Oct 2022 18:46:30 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> Changes:
>  - New command line options to ssdp-scan
>  - Update copyright years (affects LICENSE file hash)
> 
> Fixes:
>  - Workaround for OpenVPN /32 default server setup
>  - Time-of-check vs time-of-use issue with caching of UUID,
>    found by Coverity Scan, fixed by Raul Porancea
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Thanks for the patch! One request below.

> ---
>  package/ssdp-responder/ssdp-responder.hash | 4 ++--
>  package/ssdp-responder/ssdp-responder.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
> index e8cbbb4a1f..425ad86e08 100644
> --- a/package/ssdp-responder/ssdp-responder.hash
> +++ b/package/ssdp-responder/ssdp-responder.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7ae49229e7c7a55fed9e36598b12e2173eecef0fffe0a386b6a10fad30f3c79f  ssdp-responder-1.8.tar.gz
> -sha256  e17dc0bc91bf499d8cca5e016c22c6d2a4770e3cc1a43756a7973375a83ddb90  LICENSE
> +sha256  974c244abd4ba8c87532867a84756182a1460c99072ffb1eb91c5a1f73311d89  ssdp-responder-1.9.tar.gz
> +sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE

The hash of the license file is changed, this should be explained in
the commit log (what are the changes, do they require changing the
license information in the .mk file).

Silently changing the license file hashes defeats the entire purpose of
having hashes for license files, which is precisely to carefully verify
what has changed in the license file.

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
