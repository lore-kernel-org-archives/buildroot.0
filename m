Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A78ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CE64401B7;
	Fri, 28 Oct 2022 06:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CE64401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjVjMwtwEcGb; Fri, 28 Oct 2022 06:58:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD2C1401B2;
	Fri, 28 Oct 2022 06:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD2C1401B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF4B81BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 978738174C
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 978738174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CE2SxdYNsl76 for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:58:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9083F80BBD
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9083F80BBD
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:58:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 83CC460007;
 Fri, 28 Oct 2022 06:58:49 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:58:48 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221028085848.20438aa4@windsurf>
In-Reply-To: <20221021190109.3411635-1-james.hilliard1@gmail.com>
References: <20221021190109.3411635-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666940329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWcOwTjb4xSQ5iASEZ0zjEsL/KYkIF6TPp1zq/HfYv0=;
 b=PB1Vz1QfHCoy5FEKMhO3Tf1hWV9DsxsY0VlvTbM3tPDZoZVlM75oRts13beiFXCkSIqIyj
 Zet7f8vczKJ4nLvli9c9apwCUIJWLx9wWWf8VFgToJnqXbg4D01+YpxC29+fCBBQ8HTWn8
 C8FVGEkhV6m9sbZUsVeGYbAIr4V9JIc4WsL90ZEnwc8r8FY0h/tWgu3LbFK/KNMMehYiwr
 zTsPUjgGa+xF2WSeB0JdfOa93WFjvVnmYlRtQIpkfVuS4GSZ6Df+Ev4uWVU7vgaZHGmKul
 hGaTm+qiXdbk6D0btKiDqrCFSAtUP/VcJpltOjMe/2+cLc3rizBoa3sF/EhAcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PB1Vz1Qf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiojobs: bump to version
 1.1.0
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

On Fri, 21 Oct 2022 13:01:09 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new python-async-timeout runtime dependency.
> 
> License hash changed due to removal of full license text:
> https://github.com/aio-libs/aiojobs/commit/db3e047550d9fb102742d02f8b7bba63ee3ca040
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiojobs/Config.in           | 1 +
>  package/python-aiojobs/python-aiojobs.hash | 6 +++---
>  package/python-aiojobs/python-aiojobs.mk   | 6 +++---
>  3 files changed, 7 insertions(+), 6 deletions(-)

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
