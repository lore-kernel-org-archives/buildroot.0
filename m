Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49375C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E093781E52;
	Mon,  7 Aug 2023 20:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E093781E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKZkFFxixhA5; Mon,  7 Aug 2023 20:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BAD481E1D;
	Mon,  7 Aug 2023 20:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BAD481E1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 077CC1BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4BA54049E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4BA54049E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCjq63lMgGZP for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:21:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA20140122
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA20140122
Received: by mail.gandi.net (Postfix) with ESMTPSA id B40251BF209;
 Mon,  7 Aug 2023 20:21:15 +0000 (UTC)
Date: Mon, 7 Aug 2023 22:21:14 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230807222114.4a2af2a2@windsurf>
In-Reply-To: <20230806225353.4101350-1-james.hilliard1@gmail.com>
References: <20230806225353.4101350-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691439676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=II+I4N8WVVQ21FnS/Re3Yb9RE0q4mruAkbKAQeBD9Mo=;
 b=VHXHUyk4NHk5hEk429ddsVr2UtGpxAuPC/ehxTYYAYX/qAG2Sw7XxHnVRD0hcqRStbf+pg
 dlbqTy9pa+deTUYRNm4SfGRGbBR+wNFBaNPq4d4sdmzE8kos3Y1yyhzoW1i4/xhTWfKpWb
 gCIzlWNlSzTSfA223HW1IDi3hJxWgyNOR/2RU8bwOprDho5dFXOwbGFtv1vwIEsLpOT0SR
 HsuRgYNXKPm7nl5lQvZBCdmpxJsI14fVjDqkm3Iqr2JOKFw+wW9pLNTq+7C1bBini579Je
 R9dreIVCOBF4F+64GR4LUbXwQZ+BYIR5PHEvEQSY8oUYlrECkrln3I96bnRFiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VHXHUyk4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-docker: bump to version
 6.1.3
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

On Sun,  6 Aug 2023 16:53:53 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Remove no longer required six runtime dependency.
> 
> Add new explicit urllib3 runtime dependency.
> 
> When we bumped urllib3 in 074bc42971181ee71d8ff5bd57641b7b7eb7580f
> we broke compatibility with python-docker.
> 
> This compatibility error was fixed upstream in python-docker 6.1.0:
> https://github.com/docker/docker-py/commit/3178c8d48b7e7414d1f864ba1fe77139f4e923eb
> 
> Fixes:
>  - https://gitlab.com/buildroot.org/buildroot/-/jobs/4811724555
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-docker/Config.in          | 2 +-
>  package/python-docker/python-docker.hash | 4 ++--
>  package/python-docker/python-docker.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
