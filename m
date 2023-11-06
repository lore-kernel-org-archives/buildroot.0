Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46091C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F040D421CC;
	Mon,  6 Nov 2023 22:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F040D421CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZOCxSIvQwLK; Mon,  6 Nov 2023 22:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4568A421B7;
	Mon,  6 Nov 2023 22:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4568A421B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE8A21BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2EB0414BD
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2EB0414BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IoUeXW_KVPqe for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7234941183
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7234941183
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC4FB60002;
 Mon,  6 Nov 2023 22:25:50 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:25:22 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232522.32a1990f@windsurf>
In-Reply-To: <20231105042328.2808899-1-james.hilliard1@gmail.com>
References: <20231105042328.2808899-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5ytubkoiPFD+NANs2cvQOKy+Glw6o8yT0C1xvNrKzc=;
 b=QwFykNWHTLhE2/OL84EAdRABinHmHjs3IE7UFCqJxPb99QaVVCjBXb0vq/RWlZTiAU1IyO
 OmGrYaxiD1HHDqly3MaEbzFfLp17MlcpoLcRSrXZ8SpcmWDZxtGROJr5YMAywWMaSuoJ7L
 +pZwgCJ6r6cctncPbLiZ9ArzIl62ZylRsNdHmgzkFfsr14gWC8UI7fx5eg3idICLSdO+oG
 PqzVjZxoA3ZHufXaBf8gwNb7GIi9Q+TfUUKMtfX99KubkURjgVUmnHtMynL17BvY2lEjcc
 jyAOC3L9YP+qdfowJAXQjaDTg/g568wWAZhIY/a72TWTgh2K4ZjFCIAHYNOprg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QwFykNWH
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.36
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 22:23:28 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cython/python-cython.hash | 4 ++--
>  package/python-cython/python-cython.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
