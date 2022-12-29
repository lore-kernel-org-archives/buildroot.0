Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747DEC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F8D740580;
	Thu, 29 Dec 2022 09:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8D740580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCEkFZLThTlg; Thu, 29 Dec 2022 09:32:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 770FD40573;
	Thu, 29 Dec 2022 09:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 770FD40573
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E09EB1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEEBB40573
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEEBB40573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKe5VjiYwOLa for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:32:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6D68400DD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6D68400DD
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:32:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BB69C240004;
 Thu, 29 Dec 2022 09:32:18 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:32:17 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221229103217.11ddb405@windsurf>
In-Reply-To: <20221212150610.2794627-1-james.hilliard1@gmail.com>
References: <20221212150610.2794627-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Spam-Score: 200
X-GND-Status: SPAM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672306339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwGytoXndJ1mq8oMrYyeFa4/oG15vKOQmVjEOyjtmVs=;
 b=A58OcXbUsarelG7nrENrHOrHCXlP5SfpimiyxFgTQO8RP/vTk58jB/dhyKspQ3KzIYvv7M
 mhE7K5urkDaGPV8rp6zDqxlPjFZ9KqhHy+Ay247rj/0UzA2G6v1a1CB87SMGm0DHYuewSD
 Ol3+LJoD98u+qLGbt+W/jFf9HaxWJRDfIdthnSlp5Rv9YRn+fQKGQfKdjdcYEKeq61t1OP
 wm2AsVW7amY2cD4nwszt2gnW+w9FqOUbpudPuTQVAdGrFkBuxDlDPeTjc5QgMh8bU+ONtm
 20Hoi1wZB+edX1BH0POvWaB+hBJDZFpfhFW7fH2t3dV1oDXvEpzPIx/mhzeE2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A58OcXbU
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp-remotes: bump to
 version 1.2.0
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

On Mon, 12 Dec 2022 08:06:10 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from distutils to flit package infrastructure.
> 
> Add a patch fixing incorrect flit requires/build-backend in
> pyproject.toml.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...Fix-flit_core-build-requires-backend.patch | 32 +++++++++++++++++++
>  .../python-aiohttp-remotes.hash               |  4 +--
>  .../python-aiohttp-remotes.mk                 |  6 ++--
>  3 files changed, 37 insertions(+), 5 deletions(-)
>  create mode 100644 package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
