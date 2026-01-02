Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE102FA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F67781046;
	Fri,  2 Jan 2026 15:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1QbtRVSFYSU; Fri,  2 Jan 2026 15:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D2B880F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367437;
	bh=9oHLPZwpc+SuLwMISOg8efmZ+9NjHHZRG+AJhxXfZHE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A/xon6VfSiKZALQgTu6qyZJvaIFA+B3qR5GHOMMnkfGWkNFawu4BiNdUc/pGwHeEY
	 ry+1ocWtZjkRyPebUVR0o65Vdvannv7zi3I4WmS0HFHR6n7vPJsL3hq9JLVioWF7LQ
	 7ivy9U7gmQB0zTVblJJantb1adm56HMn5kxgyXbhQApwMsAOSfP4kNQ+Q0lcb3sAGY
	 PjmFUTqYt5fVz5do016B4Qn8n0X4x2aoYEMJvn1ev4882Zvs/gCJNrjQbFnnWJJH9E
	 HnECrtNmolizMKPTf6beA+2CH8uX9JOSryGGxdXrIhXM3GRFauK2zkswo50h57HdTi
	 Cgy6IBeys8gXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D2B880F7B;
	Fri,  2 Jan 2026 15:23:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B456D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11ACB80F7B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDVzxQT-jirw for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:23:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E959A80EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E959A80EC4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E959A80EC4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:23:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CE3461A25D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:23:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9ACF2606C7;
 Fri,  2 Jan 2026 15:23:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7A50A113B0726; Fri,  2 Jan 2026 16:23:50 +0100 (CET)
Date: Fri, 2 Jan 2026 16:23:49 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
Message-ID: <20260102162349.668c65ad@windsurf>
In-Reply-To: <20260102145407.917492-2-bernd@kuhls.net>
References: <20260102145407.917492-1-bernd@kuhls.net>
 <20260102145407.917492-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767367431; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MUur/mapJBM8N+ivfITZOfOxT188XXFc8N7AEG+kPMc=;
 b=dp7f4eUliirpEWXH8JqKAQ/U3a4sXXhZtERHOLjuGNJ1nizFARmMtnyCErUhg4ch9Cs8St
 iR7XcuysYCNFCfXQrlxO154vx9BzRaJWSs4Nkr/T46NAbbEtUxiXbnTccymyULANa+O+tT
 BmN+qK7B3jt1G1JdsqQGJi/UpI6aXpwQvK5BFUA4+JAYvvwB1kS+yjZgce37vYXUeMi4yD
 XxdyUyK8BRTNZq1QOrYhgrCL+9Ll117N/5Lg4YgG1EqGId5m1iLHmwEgDdCeTp8uvVZFv0
 X2vGQFYRe/M3vQ3AYnOZ0dSfhfTesLqWSaCdUc+smwo/9pwuaektdPKK5CjUSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dp7f4eUl
Subject: Re: [Buildroot] [PATCH 2/2] package/atf: fix build with newer gcc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Fri,  2 Jan 2026 15:54:07 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit d6c3257e931ed256e3ebcd78938f6146bba8586f bumped the
> package from 0.21 to 0.23. Upstream release 0.22 includes commit
> https://github.com/freebsd/atf/commit/d7c7c53c0626ab59a62aa4efcf05323b3621baa9
> which uses CLOCK_MONOTONIC without including time.h.
> 
> Fixes:
> https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/
> 
> Minimal defconfig to reproduce the build error:
> 
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ATF=y

Thanks for the additional analysis, it makes more sense.

However, how is this related to "newer gcc" then? If the code uses
CLOCK_MONOTONIC, without including <time.h>, it's going to fail
regardless of the gcc version.

Did you test a build with an older gcc (13.x is still supported for
example) ? I assume it will also fail to build without your patch,
meaning that the problem is not gcc version related.

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
