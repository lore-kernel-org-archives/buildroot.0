Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3AEC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA31181D18;
	Sat,  5 Nov 2022 22:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA31181D18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8U9qqB2dxDn; Sat,  5 Nov 2022 22:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05FC581CDB;
	Sat,  5 Nov 2022 22:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05FC581CDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA871BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04CFB40414
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04CFB40414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1aBSgjblPkHm for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:33:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6205400D9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6205400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:33:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C2C1F60002;
 Sat,  5 Nov 2022 22:33:27 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:33:26 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221105233326.79696f90@windsurf>
In-Reply-To: <20221103205514.2477642-1-james.hilliard1@gmail.com>
References: <20221103205514.2477642-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667687608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDisXo4wUu6hD417L8dqwnaFq2VFTcrsMKVBDUndh44=;
 b=aHtckPgPyNWR6EHxLMtXD1EWOK2PpFgQlw5I9ID4iQ+UdBEKjfaBkdV9iOsA5gMIR4tCJI
 bcwjMrTDUwS42gM/k4mYgGrXVcKByKApkRtjdxxiTBmHYUR+DJI/k5qu3aWcSIpktRTTpg
 D6Rb7q6XvAWo6f4l/h1DK2t3CSIlox4/Dx8T9REx58I3vV6hGxaqrxInQfyUzRLMqP9U0W
 Hvxdcqxi+VmWBAtXsrUfIYrhK/xiDjCthSO6f5Szh9DZugDHYLvQUd4Ud4N3begwymf3q2
 ZKJxVdOWYQmVBskGPxuKWLJ2HfvcLvFGL4Fr5xb2pd3qj1FgmdSbFrF9RB3Kyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aHtckPgP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version
 1.14.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 14:55:14 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from distutils to setuptools build backend.
> 
> License hash changed due to year update:
> https://github.com/GrahamDumpleton/wrapt/commit/240fea86df0357f3642db040f912031e4ecdfcb1
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-wrapt/python-wrapt.hash | 6 +++---
>  package/python-wrapt/python-wrapt.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
