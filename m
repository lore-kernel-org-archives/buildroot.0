Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50907C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FE14028D;
	Mon,  6 Nov 2023 22:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2FE14028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGCFnQBXLe_n; Mon,  6 Nov 2023 22:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D49414D1;
	Mon,  6 Nov 2023 22:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D49414D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 437B21BF215
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F1A3408D1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F1A3408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XC2_Yp0MEZqt for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:59:59 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 056754028D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 056754028D
Received: by mail.gandi.net (Postfix) with ESMTPSA id C354C20005;
 Mon,  6 Nov 2023 21:59:56 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:59:56 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106225956.023258e7@windsurf>
In-Reply-To: <20231105024115.2762262-1-james.hilliard1@gmail.com>
References: <20231105024115.2762262-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699307997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DOx7OvNTOCF9YxYOmJVzd8lcW0CtdR5YgQMQrG3ATi0=;
 b=QKNtFhcfEX77MVnrxXDaTXQhDCM+rHVlrL25pVWiXxNy65rzsUkT2RragGaWcbHnKTQ/iz
 YFG1pREXwSnjBjPmrnFp3ihfdYYMSnNb9qQp1cV6ykU0HEdfesL7aOEpWnn/XBrBXZAWH4
 se2HS99BdTPRDjj2eCM8Z2tY9SBBlXczTuzzUdhIkDz7VZcnnFyXdv3D1qP9iK4Xj6mMed
 kAo1Q/9L56usS8l1ZVv40B7pf+c3KnbUc2emjMQXBFFSA3dgz7I+HzSRVIWw6As+rA+rbq
 vcAZw3+gmjITpWNRWXkXpjAp7u/P1W0EncX5xt+Hc90ZcwllwRLXyYsn0EZ/Kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QKNtFhcf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version
 1.16.0
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

On Sat,  4 Nov 2023 20:41:15 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cffi/python-cffi.hash | 4 ++--
>  package/python-cffi/python-cffi.mk   | 4 ++--
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
