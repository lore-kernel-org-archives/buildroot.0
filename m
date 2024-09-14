Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0C9C021A9
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D26681AC4;
	Sat, 14 Sep 2024 18:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_JU3_n1Z6qq; Sat, 14 Sep 2024 18:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 562A981BCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 562A981BCB;
	Sat, 14 Sep 2024 18:35:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59E461BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 494BA81BCB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKJm3zjneXRb for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:35:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.150.162;
 helo=dd33218.kasserver.com; envelope-from=brpi@duering-andreas.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9342C81AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9342C81AC4
Received: from dd33218.kasserver.com (dd33218.kasserver.com [85.13.150.162])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9342C81AC4
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:35:46 +0000 (UTC)
Received: from devuanPc.fritz.box (muedsl-82-207-203-099.citykom.de
 [82.207.203.99])
 by dd33218.kasserver.com (Postfix) with ESMTPSA id 647D8200098B;
 Sat, 14 Sep 2024 20:35:44 +0200 (CEST)
Date: Sat, 14 Sep 2024 20:35:43 +0200
To: buildroot <buildroot@buildroot.org>
Message-ID: <20240914203543.133471fd@devuanPc.fritz.box>
In-Reply-To: <20240914202523.015cff9a@windsurf>
References: <20240914201937.567067fd@devuanPc.fritz.box>
 <20240914202523.015cff9a@windsurf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=duering-andreas.de; 
 s=kas201911161523; t=1726338944;
 bh=Pru6psvlkyz+8twQC12UwSt3h4eNGXuCUTg2H3Otfo8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m0JZHLbZ4U/FMNXCX+GQGA1DWU/5weIJQF/mvPq1gyXZtc4FHxRZo5kB0hdkHOJxj
 Hc1DK58N1dNCY1IE4fBTRvp2PP6QXWfmINGllQDaki69pgrilyM7nfnzkeSolAZpcj
 wXEJfOUoX1Nl4OjeNgpsyOn2m7pnHdb+zH8mQYaN3oei6ZZGjxLGoTlK633u+NbivJ
 zwMRQLHR5pV2CAiu6Vm5yG4qA3QER4rudFtTKKBJQqw8iPcYBKnbenAcdi2xfMxPd9
 N7X4sxjrvtJWH+nbI6EOT27IsD12McGHazabWnGsvDpgJGGIUCUFdLjtLSbqJ2+gwd
 y4endJraTk29A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=duering-andreas.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=duering-andreas.de
 header.i=@duering-andreas.de header.a=rsa-sha256 header.s=kas201911161523
 header.b=m0JZHLbZ
Subject: Re: [Buildroot] Buildroot does not use ccache for compiling Linux
 kernel?
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
From: =?utf-8?q?Andreas_D=C3=BCring_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Andreas =?UTF-8?B?RMO8cmluZw==?= <brpi@duering-andreas.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> The thing you're missing is that for target builds, calling ccache is
> hidden inside our toolchain wrapper.

Ohh. That would explain why I did not see any change in the ccache
statictics. I only enabled ccache *after* the initial build. (I know,
not a good idea, the docs explicitely state that for changes affecting
the build, a clean build is recommended). Of course the
toolchain-wrapper is still the "old" one without ccache.
(My assumption was that this is handled via the recipes.)

Thanks for the clarification.
Best regards,
Andreas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
