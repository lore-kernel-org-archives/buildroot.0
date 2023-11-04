Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6058BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 095F9822ED;
	Sat,  4 Nov 2023 13:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 095F9822ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5oIVWMa7IpqU; Sat,  4 Nov 2023 13:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EAD182009;
	Sat,  4 Nov 2023 13:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EAD182009
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 419F01BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04D4081FF9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D4081FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qI8ZWFjnwJHm for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:36:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C5F981FFC
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C5F981FFC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 180882000A;
 Sat,  4 Nov 2023 13:35:59 +0000 (UTC)
Date: Sat, 4 Nov 2023 14:35:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104143559.125fda46@windsurf>
In-Reply-To: <20231030131052.661107-1-fontaine.fabrice@gmail.com>
References: <20231030131052.661107-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699104960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmLo70oz7R9lXlM1XIFa70Qzt0G6+zK8YfQuGXfKt24=;
 b=Wx8lGU21Lo/61rdJ4gGlBCvDpviq2p/EVt1kmYVDgIAXYPCy6+JqlAXNT9PNc49P57FGcU
 blt1/tpImRQbRM6S/0xhtfvT77H1vYZVuroDmoSn+FErZY/7UiOpC+OeknFSfYLcplpP/o
 oWxyHMy6mICQqcsf6ix5/JFVhYF95O2NhmPQCOBD6ARFpSIbD6n5bAjLX9qZGpdCz2vlsQ
 owXXBLKR48ZNvx1J1Azfrl7PysP+TTKCuGHDEpGOVpR1dgNnAee9YFuiEzw78/LmxApKqj
 uWxDsGYHP3pL+mB3lhzMiQtJNd/+FWo9H+4CB+TWcDupQhA4b+LADPv6yET/Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wx8lGU21
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: disable -Werror
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

On Mon, 30 Oct 2023 14:10:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable -Werror to avoid the following build failure raised since bump
> to version 1.3.0 in commit 073b0fc9c1fe9945eccf4b792b948633aae9a9b8:
> 
> chipset_enable.c:27: error: "_LARGEFILE64_SOURCE" redefined [-Werror]
>    27 | #define _LARGEFILE64_SOURCE
>       |
> <command-line>: note: this is the location of the previous definition
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b8d8c30d1306c2ba8f59b48f457a7ef930306b8c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flashrom/flashrom.mk | 1 +
>  1 file changed, 1 insertion(+)

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
