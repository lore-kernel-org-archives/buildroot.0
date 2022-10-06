Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24471C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BA6419EF;
	Thu,  6 Oct 2022 20:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BA6419EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGNKSfI6arFb; Thu,  6 Oct 2022 20:12:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BD8E419E8;
	Thu,  6 Oct 2022 20:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BD8E419E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 162BD1BF310
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE984419E8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE984419E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3WnBpnJ4t9w for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:12:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 788BD419D7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 788BD419D7
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:12:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7EDBAFF806;
 Thu,  6 Oct 2022 20:12:37 +0000 (UTC)
Date: Thu, 6 Oct 2022 22:12:36 +0200
To: Erico Nunes <nunes.erico@gmail.com>
Message-ID: <20221006221236.7dd6580a@windsurf>
In-Reply-To: <20221004143943.1456694-1-nunes.erico@gmail.com>
References: <20221004143943.1456694-1-nunes.erico@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665087157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6h8dnprMIEwf4QOo+ovaK0szfGtrnF+SdTgL8QR8HFo=;
 b=cI71LoYymoa6/xlrbEMfmzDM3wf9kG+oCJgq+Ijl7CYhnOpd2sgPAP6ZIunPE50h6oAz1M
 BNYklWJiUxoC33gK6EiHHLIFkTqKkONFaReqjL5jpUAo8pzLrRQ/Z/7Jr5p4/gqT7ImtsH
 xktYndP19rjf3Rv7ic8loHr6YP1nrpXY8wIYFs2W9FLA6rvhFj93y/QbL7BJaoiX3966H/
 TE18CwuS6HWQKMqhrDaK583gFSt6ZPSOk53vRVIhILHx/h9XBFtunYxHMLf9gxtfFCHAID
 Z+u5RcQdEJyQEGe1/UgWJ5vzYYFEOkEF34Gsa0UeA1Zd/7svMIKBYT1zEWK7qA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cI71LoYy
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

On Tue,  4 Oct 2022 16:39:42 +0200
Erico Nunes <nunes.erico@gmail.com> wrote:

> Drop backported patches and rebase the ones that are still relevant.
> 
> From version 37 to 38, there is a new build system in place, which is
> still custom Makefiles.
> This introduces a host-efivar package to account for the 'makeguids'
> tool. Previously it was not too cumbersome to work around building that
> tool for the host, but with the new build system it is increasingly
> coupled with the target build that the least hacky way to work around it
> is with a host package and a Makefile patch.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

I've applied both, but I'm not super fan of the Buildroot-specific
patch in efivar to not build makeguids. Would it be possible to work
with the upstream efivar community to find a suitable solution to this
issue?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
