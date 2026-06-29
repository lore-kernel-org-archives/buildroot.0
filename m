Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2FDC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9967A60F77;
	Mon, 29 Jun 2026 21:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UWJteCbMSck; Mon, 29 Jun 2026 21:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B49760E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782768793;
	bh=aZdGu0WcnN+J2oZ8yayDhEYYkZHdw/mCVDdomG6s6GM=;
	h=To:From:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=b4S1wgmyZoXMP4oGkU9plIhCbLHVWKlGhW9dLi7VIcA6xVpQCOm2+bESujmroJBbE
	 JGsyDFEoNTZJQq23euTIeMJ5Q2vWp+hc+YxMLPAv9CVqvtBjfL9EN//pgr7ZasJnHw
	 rH/ZIBpkKaktDObCmn/ssCx/sNq1xxHa8LVr0vUI4DaouFOQXJUnwODbCIDdl+BGQb
	 DUc9xGtaLENMV5pWxMBO/ViZ1oB4KBXMN/uk3anB1osSUUrLYglfBxdzoE7edjORNl
	 GuMIF+yKZtDO+O+rDChsJ4R7EcXvRq25DhykROSeOKtTRK3uux963cqBBpwEFqShrq
	 daozFRGJYCy/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B49760E7E;
	Mon, 29 Jun 2026 21:33:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98E1734C
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DF7F82115
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1z-3pKkl8FZ for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6335A81EA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6335A81EA7
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6335A81EA7
 for <buildroot@busybox.net>; Mon, 29 Jun 2026 21:33:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1weJbH-00091R-Pm
 for buildroot@busybox.net; Mon, 29 Jun 2026 23:33:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 29 Jun 2026 23:32:58 +0200
Message-ID: <pan$58e00$81199e4f$edc9570b$a6a61b05@ID-313208.user.individual.net>
References: <20260627064155.1938273-1-bernd@kuhls.net>
 <c145e709-580f-447e-99c3-03bab062cf7f__16883.8836414338$1782762233$gmane$org@smile.fr>
 <pan$490ec$abd6358e$72d9a434$58d2a609@ID-313208.user.individual.net>
 <382a70ee-a73f-485c-95ed-822f04135349@smile.fr>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Cc: buildroot@uclibc.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc: bump 15.x series to 15.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 29 Jun 2026 23:03:00 +0200 schrieb Romain Naour via buildroot:

> I had an issue while applying your patch from patchwork, your patch got
> corrupted by patchwork somehow.

Hi Romain,

line 471[1] originally has 1283 chars but got split during SMTP transfer 
to patchworks at 998 chars according to RFC2822: "Each line of characters 
MUST be no more than 998 characters".

A quick search shows that this is not a new problem:
https://git.vger.kernel.narkive.com/CRuhIPUZ/bug-send-email-brakes-
patches-with-very-long-lines

Regards, Bernd

[1] "libtool: compile:  /usr/src/t2-src/src.gcc.ia64[...]"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
