Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA931E83EF5
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CD6E40882;
	Wed,  4 Feb 2026 09:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPg6l0uy5Mb2; Wed,  4 Feb 2026 09:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9713C408AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770196324;
	bh=KQt4Hb0WaMBzqEU8MeY6q/do4r0B72nk87Rwjy9QV/g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cPwE0EBvEr7WFiQaYdWu1GMeDJSEpa/ySOv1Gtwvke2dNzlr9gTyb7/6nZycMWKcP
	 XdstHkBUem87sFxPX3tJWkZxLWSD8aLHH3riAjpvSWO8lC6rtL8CabNrc9bzgjl0oj
	 nnZfQf+zfQS4QERjS9X2zutj0F0jKwLYYKQvsKtA2K2s7SflUDdXGXOKeXJVyXk0jq
	 Ap+8G0mD1e1dHZMlCWhd30F74n8Sh66HShkwWjdzTvJdRH6CTOm9DXknfRbfAdboAq
	 hv3uoXeHvo/ncTWtF90YguNVZS9434ayoGOFxc4Qdw27uHGIk9M1wq+u6Og8g/6v9G
	 mOMXO/hdEJouw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9713C408AB;
	Wed,  4 Feb 2026 09:12:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93751F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80F80408AB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANSotyYaP0uY for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A200840882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A200840882
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A200840882
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:12:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7E458C24391;
 Wed,  4 Feb 2026 09:12:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E43B260745;
 Wed,  4 Feb 2026 09:11:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C56B5119A8891; Wed,  4 Feb 2026 10:11:57 +0100 (CET)
Date: Wed, 4 Feb 2026 10:11:56 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Danomi Manchego <danomimanchego123@gmail.com>
Message-ID: <aYMNT9vbwqsTJ3E1@windsurf>
References: <20260118132107.1541912-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118132107.1541912-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770196318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=MxtQGncItiHsdasc4BK8m/o6fmYseLVGtfHskGxD/jo=;
 b=ycUIT2jtKXMKZHxBi58LlvnnDajhq4bYh0kIRs4TG/VhkcEGM+yWYryLTQZLtilgA8HbkR
 2fmrAm/F5b4Dsolz6bFDo8X436sy7fKH6RjtE3+tAHsEG8cdXSrfyFUzm1e28AH2tH2m54
 ps66Dv7tgho3+9sFshhgB+Vh6MBbW4qV2a9YH/aT8qp2iZFbFtTl+q+0DqwSiBg4zQZi89
 AKwPtl8P4tgRCEUMZdSY30Tz2/mz/p5XW0cwFCQLESPfrtJ4o8TYi32O4VdDF5ZE/FXzBY
 CXfBWSqkoHsP4hTiHMV14chxDostzv27cXMapzAHAaVd9gcpauJrUslV7QI4Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ycUIT2jt
Subject: Re: [Buildroot] [PATCH 1/1] package/xinetd: fix build failure due
 to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

On Sun, Jan 18, 2026 at 02:21:07PM +0100, Bernd Kuhls wrote:
> Package xinetd requires libtirpc rpcdb option enabled since the bump of
> libtirpc to version 1.3.7 with buildroot commit
> 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream commit:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> 
> Fixes:
> https://autobuild.buildroot.net/results/4db/4db625d395f38636b67adbbf6286c6c9da155f62/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
