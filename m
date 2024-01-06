Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA00C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D36D684020;
	Sat,  6 Jan 2024 09:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D36D684020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H46k_smQh44H; Sat,  6 Jan 2024 09:50:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 487F28401B;
	Sat,  6 Jan 2024 09:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 487F28401B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC221BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB04042178
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB04042178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYR_t74FWnKG for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:50:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71F0C42176
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F0C42176
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE91B1BF204;
 Sat,  6 Jan 2024 09:50:25 +0000 (UTC)
Date: Sat, 6 Jan 2024 10:50:25 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240106105025.22c8d7e6@windsurf>
In-Reply-To: <20240105181207.748233-1-fontaine.fabrice@gmail.com>
References: <20240105181207.748233-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704534626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDFMyWFfkfJXixDv5UeTqagfxkOcBo2jO1XQ5SMfLIg=;
 b=eGRCISZIsTwceIwoXI58ZqGlkkxoiqV1U/XIHwFG9lmji+iKPte0aT1AMFqvhRt1HPz2cJ
 dIaDOKOttszGuocU2ZhveYmgSOskCX++ssmwHnW42nJeYfn60LDP5fdwQUM0liUaIWNlX2
 cZ+iGzN0Cr4qBT4DyriQoNRgOauJ/JRQrX+0UpD0J14LCN7H05dBMJCNY4n7hvU/QH+acn
 d4ELAPZix2Pc0NToxnwfYTBrqecuE0kvSkkWLK43cMn7z71uyuIFWo2n1GZt9g0gPQBuHe
 zo46pGpK7zQIaPb/5bnlRm572dYcQg5SYfiXpClvyHP2qV9hVDCGd9AUSxA+kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eGRCISZI
Subject: Re: [Buildroot] [PATCH 1/1] package/libostree: needs headers >= 5.8
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Jan 2024 19:12:07 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libostree unconditionally uses loop_config since bump to version 2023.5
> in commit c64a3e9767757f6bab0ecf2df35871508003f39e and
> https://github.com/containers/composefs/commit/d7f24100c932cd0da9c315de7c7d44fe7a5005cd
> which is only available with kernel >= 5.8 and
> https://github.com/torvalds/linux/commit/3448914e8cc550ba792d4ccc74471d1ca4293aae
> resulting in the following build failure:
> 
> composefs/libcomposefs/lcfs-mount.c: In function 'setup_loopback':
> composefs/libcomposefs/lcfs-mount.c:273:16: error: variable 'loopconfig' has initializer but incomplete type
>   273 |         struct loop_config loopconfig = { 0 };
>       |                ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/25d9d4f256861628ddd8e8ce659a39655d27b457
>  - http://autobuild.buildroot.org/results/5c7e1e47c6eb43f7832ef7820ec2b5ac0f3c3696
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libostree/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
