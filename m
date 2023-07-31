Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED6CC001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 12:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA56812D0;
	Mon, 31 Jul 2023 12:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA56812D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IeowhncPTHs; Mon, 31 Jul 2023 12:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A5581368;
	Mon, 31 Jul 2023 12:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7A5581368
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F53C1BF3CA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0359560743
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0359560743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDP6VA2PDB_8 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 12:18:37 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFE246073E
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 12:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE246073E
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 1EB50CDC96
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 12:11:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D7B84000A;
 Mon, 31 Jul 2023 12:11:22 +0000 (UTC)
Date: Mon, 31 Jul 2023 14:11:20 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230731141120.58dd6a3d@booty>
In-Reply-To: <20230731061113.193556-1-neal.frager@amd.com>
References: <20230731061113.193556-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690805483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/mGNVEp8P0Zu2FFCewpvSgR7mx/QJzqeAoQHS2TH3SI=;
 b=NpaaMxW/+vuiXnX4R//OfpIFdkJaisxORSe+HMOx/xZtPZHkS/QEyctKMJZnn3mobhuP0b
 LVu75Th5mjQRqwUT6MqU7ckN8hDOMrakmSxIs6S+QoQ+GbrnPttuOoAEHlUuQ161eSCNgh
 2M7cheb4rxzJtJCbUD+ebJNyzpyOnlMDfeBIolyCx5JJZj3fxy/qG5/2JyH1P7pj1CeT81
 cNENOoGeqbsZEv40FLwunHu4lR7FQbXv1s8I1ghb3GGYf36TheHlyTfqrqzKhOkCsZ6jhq
 wuam97TvDrs2K1vHWz2opeCumo/Uby42BHbsK5Z6Ko4PhPl5H0snxRidCuIBLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NpaaMxW/
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix atf build failure
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Mon, 31 Jul 2023 07:11:13 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Binutils 2.39 now warns when a segment has RXW permissions[1]:
> 
> aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
> permissions
> 
> There is a ticket filed upstream[2], so until that is resolved just
> disable the warning
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> [2] https://developer.trustedfirmware.org/T996
> 
> Fixes: https://developer.trustedfirmware.org/T996
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Despite being a warning, it does actually break the build.

[Build-tested on zynqmp_kria_kv260_defconfig]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
