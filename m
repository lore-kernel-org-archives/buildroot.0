Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEE9C67871
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0E1260BE4;
	Mon, 24 Oct 2022 21:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E1260BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CReFcpaBB5Mw; Mon, 24 Oct 2022 21:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF8C60AEC;
	Mon, 24 Oct 2022 21:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FF8C60AEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D1391BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2512E812BA
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2512E812BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cswo5dI0kjZT for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:12:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182D580CEA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 182D580CEA
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:12:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 47F78FF807;
 Mon, 24 Oct 2022 21:12:15 +0000 (UTC)
Date: Mon, 24 Oct 2022 23:12:13 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221024231213.41deaa35@windsurf>
In-Reply-To: <20221023221425.395087-1-giulio.benetti@benettiengineering.com>
References: <20221023221425.395087-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666645935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NTWoc2F/RIQLrKYoAEP9Zf4cYh7n48TrmQPQyx3NKk=;
 b=dVAkrKbwzGpRzhirfUMUbqkyBcstD2Gp20ucylPF9yNeZETSNpNgeNdK8kjUex+e1Is80y
 Dn+GRUdEN8yEwc3bF5QLuSIB+MHKdvcYJJn1LXdaZnKvPsZwGQw9f05pWe8oIfybHhyARy
 dBYu4cBcFL8/M1x9JHo8igjUkxf0CepXxjcfQetDR0goQXHtGbxHMk8hnh+7waZmFL5+YQ
 pjKmMZVgDFLsPa8gqzM49G+DczegnDp8Zq0LGGR2l2OWxMfCFdbnEy9PYcr+9m7a2FZRnY
 tsmKKZ65zP59JrjoHAWS2wFh3ZTtiPzawyb8HQKyAe3i2k8BaapphoWzA8W/lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dVAkrKbw
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: fix build failure on
 PowerPc
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

Hello Giulio,

On Mon, 24 Oct 2022 00:14:25 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch(pending upstream[0]) to fix build failure with PowerPc due
> to a package re-defition of get_ra() that is only defined in Linux PowerPc
> implementation.
> 
> [0]: https://github.com/lwfinger/rtl8723bu/pull/192
> 
> Fixes:
> http://autobuild.buildroot.net/results/99571b055e6185d57f89b90821b76099ebc766ed/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...uild-failure-on-PowerPc-architecture.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch

You forgot a reference to the upstream status of the patch in the patch
itself, so I've added that when committing. Thanks a lot for looking
into and fixing this build failure!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
