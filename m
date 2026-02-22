Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698C8C636B3
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 19:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E37083E47;
	Sun, 22 Feb 2026 19:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAZwyd3A_l2J; Sun, 22 Feb 2026 19:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88E283DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771789095;
	bh=0w040K5llj/XrQK20j6Ezy9eV3S5+JlUwSTYWLlaBww=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DRfmxInAU9UCtckT6N6YoDupYtu7lD/m+mqaPBDclczdaPbAcwCh9V8EWow0SYdoR
	 /XuXFC2ShT3rMpIYhvTUQLvL4wzvI2o2XqNiBzbJTbHkfwKAALKfXlPRXEaQapMZwa
	 pm7ysWpFr54/pthAof+QJeAaSJOvWWghmxg6QalOqzJz+qQsooTW3NKzc8U+2dyV5m
	 xE+wSK/KaiiCHDil0W+j42E+uYr0isCqcTMqsyy8Bw3HCK+nSqvMNhJmiIEPukR/Gd
	 8Zpl3xM8+iH9S0Xa0Er2KmOVNDiYXp833lmVU4jJa5hJc7t+UHa25P3i6rgVXNxIz/
	 85V2YJBoYO4Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88E283DF5;
	Sun, 22 Feb 2026 19:38:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04A892DF
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE63860661
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFP28B7JQfTm for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 19:38:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18A776066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18A776066F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18A776066F
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:38:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AD7F7B00535;
 Sun, 22 Feb 2026 20:38:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Feb 2026 20:38:07 +0100
MIME-Version: 1.0
Date: Sun, 22 Feb 2026 20:38:07 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20260217164524.513706-1-dario.binacchi@amarulasolutions.com>
References: <20260217164524.513706-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <043ce8ae92725a2e608cdb09ac9034c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771789091;
 bh=xJRq8KfsqEXWjsMYdMSGyLg9kAUqPAy77HtblnGD/TA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LdHrFhLK0qr2D1jzYY+Vz7uMEZECuwdx1KfLB6MUxxzxgomnV/SADCdx57Qkpljam
 Yy48pnDOeEwEFrAcZCy7XNWa/GbIwKtuDkhYqENQ+e4Qkv8tmj/j8w3mJc8IJcRKtG
 gfUdvkDx1g8J4mbWWS91cRyt9lepZKivO4fWp4VdFW37/ic78R4Wix94UkmN1ABUEU
 y0O2tArBKAbPSWJmlMJzrVTTo/H2Cx0RHJtjT+fKpiuMEt3+hVtupzrnuqRT/302Y2
 RATdOAyU3W+HdteC2XbSuzudate3WOKo6NxgqNUE/GAxZdf7cQdMCWjiCp/IIa/OOB
 gxsSFC7vljs/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LdHrFhLK
Subject: Re: [Buildroot] [PATCH 1/1] package/connman: bump to version 2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/02/2026 17:45, Dario Binacchi wrote:
> Release notes:
> https://git.kernel.org/pub/scm/network/connman/connman.git/tree/ChangeLog?h=2.0
> https://git.kernel.org/pub/scm/network/connman/connman.git/log/?h=2.0
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
