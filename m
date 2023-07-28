Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E98FEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4FBC421CA;
	Fri, 28 Jul 2023 20:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4FBC421CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jj04i0w8RLKQ; Fri, 28 Jul 2023 20:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABEA042202;
	Fri, 28 Jul 2023 20:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABEA042202
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8671BF995
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 189504013D
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 189504013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzmC3xcvShzd for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:11:42 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B438400CF
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B438400CF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F37D60004;
 Fri, 28 Jul 2023 20:11:40 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:11:39 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230728221139.6fa2b87a@windsurf>
In-Reply-To: <20230724204835.385678-1-ju.o@free.fr>
References: <20230724204835.385678-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690575100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qlvf1wP2wfwb67W7gN3fykv/bqPEqmjoP+kihVfSU7w=;
 b=QLC9DV8+m6qgpBahERrvmIewE0Al1KdFz9sXQf9VszqbLgYd99NPVCz+G0WuZyIhXcGeo+
 3Xa4tPHiWVCXjh9wMOwY/WmxJN7ebT/Nbd/VETgC7vAuOBQaYCZx+0WuTfrUqm14HxoO/c
 tmjvvbcNXgLIQyIQ5Dzmeq71SEb0xF950cEUo1CTrroMDX3gZzjo8R2lrXgV5/Kr/bg51O
 7yT8dCA3JTY7+G+FczAjuLA8MxWkSNFql2EUBEhPUz064U2PXH3TadMYESoJIzzNvN5AIe
 hwMgGZid3RQhSXjaKP7B7uce0ymsiLS2HiTBF28KYEbM2BaZ9oWTP5+s3YutgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QLC9DV8+
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: bump version to 1.12.4
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

On Mon, 24 Jul 2023 22:48:35 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/pocoproject/poco/blob/poco-1.12.4-release/CHANGELOG
> 
> This commit also drop the package patch, which was included upstream in
> version 1.12.3:
> https://github.com/pocoproject/poco/commit/3884c734c261231c34f59e56cde7ae02945b4dae
> 
> The file .checkpackageignore is also updated to reflect this patch
> removal.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Tested on master branch at commit f359791 with commands:

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
