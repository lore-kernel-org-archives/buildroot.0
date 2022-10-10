Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1CEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Oct 2022 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B0F40E47;
	Mon, 10 Oct 2022 15:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B0F40E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNVh43BAvhTz; Mon, 10 Oct 2022 15:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFBA840942;
	Mon, 10 Oct 2022 15:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFBA840942
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92D141BF378
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 15:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C8DF40151
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 15:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C8DF40151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6YYvGVZXxJ3 for <buildroot@lists.busybox.net>;
 Mon, 10 Oct 2022 15:13:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B36540104
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B36540104
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 15:13:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E943B40003;
 Mon, 10 Oct 2022 15:12:57 +0000 (UTC)
Date: Mon, 10 Oct 2022 17:12:57 +0200
To: Erico Nunes <nunes.erico@gmail.com>
Message-ID: <20221010171257.6076a845@windsurf>
In-Reply-To: <CAK4VdL3BWokVL9BHrYZqoKC7cfYZ3_znw-cE4pw5JZ_P7Dnqvg@mail.gmail.com>
References: <20221004143943.1456694-1-nunes.erico@gmail.com>
 <20221006221236.7dd6580a@windsurf>
 <CAK4VdL3BWokVL9BHrYZqoKC7cfYZ3_znw-cE4pw5JZ_P7Dnqvg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665414778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aoSOjJuS+YpiwG6SVVdqz3j8QukrZ4+h1Y120ysLBGQ=;
 b=oxmRynFMRje7L6jf//F39X1tv2/FOVHa8xFVKKPxQr6csnWSB7OBQE+tr/kfLLogLkOfgB
 RbpbTX46+9x4jcUljh+Me+KG+MLaSs5fq0307QEQf+LNUAxHuiM6vwH9lO+UqbgLkJ0Y8H
 fdfSR0ComQIiwKdUjfy30PcK5PLhGemCH4WiPV2gW45Zm59z0nzUJIUtV9VigNoiTJCwWQ
 3kI1ssM+woshxtCM10v9pnTl7nSTLCJPV8HrNdpdoirEsyO+vuK0146+N4OHHg5jfsplIo
 LrlC0Lwfv875i2ejvn2stcpwqSoG1iEqGHI/7kuq4iMCSW/+5VYty7ePQqfFfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oxmRynFM
Subject: Re: [Buildroot] [PATCH v2 1/2] package/efivar: bump to version 38
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

Hello Erico,

On Fri, 7 Oct 2022 08:46:10 +0200
Erico Nunes <nunes.erico@gmail.com> wrote:

> I did check for related work in upstream and there are two relevant reports:
> https://github.com/rhboot/efivar/issues/130 reports the makeguids
> issue in cross compilation. There is no solution proposal for it in
> its current state though.
> One potential solution is to change the build to something less
> custom, like meson, then in https://github.com/rhboot/efivar/pull/216
> there is a draft pull request to actually move it to meson.
> Assuming that gets in for the next efivar release, the Buildroot
> specific patch could be dropped by then.
> I think what I can do at this point is test that locally to see if it
> addresses the major problem that we have with Buildroot for a future
> version bump and provide some feedback there.

Thanks for this work! Indeed, if a meson-based build system is in
progress, it doesn't make sense to work on a better patch/solution for
the existing hand-written build system. Let's wait for the meson-based
build system to arrive.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
