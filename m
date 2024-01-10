Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B363BC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61BFD437D2;
	Wed, 10 Jan 2024 20:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61BFD437D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsokfiRy2i3g; Wed, 10 Jan 2024 20:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38DBF4382D;
	Wed, 10 Jan 2024 20:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38DBF4382D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E83F1BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED168149B
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED168149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6B1kiFgsFYYs for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:23:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91198813FE
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91198813FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6636FF803;
 Wed, 10 Jan 2024 20:23:50 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:23:50 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240110212350.3ab86431@windsurf>
In-Reply-To: <20240106112343.610484-1-fontaine.fabrice@gmail.com>
References: <20240106112343.610484-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704918231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PslWAWpxSblyX/uKFG3AG0MV6HoSEoghj2hobrWINqc=;
 b=hyju+qCxddtmPpOL/ag1GI5YetbjkEbyvMyQK3tMdIdtZT7q7HBSXVWOdrzevZe5FDUB+Z
 Dfhwd6OMg0RFu3OlCzuziAcyaKcE9KiKIQNm/0NZbI8NXsfPu9WgcVioGxzaBczKUDt+sq
 ZouCjwzdHH7HG4rMULmtyV2o47dQSE1i7saH0MgfVFGEyRu3KIEt6HCg+tHjOHPvyAPMH5
 a7D96REdLbalmUoOts9CwxpvYyCzp+p2TisilURw+j0puA8mqRTlKAoTQy/uX8FWJ064I+
 EbYuLf96Q9XqcEqmS1msoRIiKXQTPQicBOXZVifLDbN1ywodMQCP6CtmrHPHLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hyju+qCx
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 libopenssl needs perl Math::BigInt
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

On Sat,  6 Jan 2024 12:23:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libopenssl needs perl Math::BigInt for s390x asm to avoid the following
> build failure since commit a5cacb63082b9e58194c4b9f8b2af2c3e38ff15c:
> 
> Can't locate bigint.pm in @INC (you may need to install the bigint module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../.. /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../../perlasm/s390x.pm line 16.
> BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../../perlasm/s390x.pm line 16.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/986cb07d368c7214ffbc9d60c378e7ac00797f00
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  support/dependencies/dependencies.sh | 4 ++++
>  1 file changed, 4 insertions(+)

A bit "meh" to have to have this dependency solely for S390, but that's
indeed how libopenssl is implemented, and the incentive to
change/improve this does not exist, so: applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
