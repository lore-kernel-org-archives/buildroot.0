Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D91EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB65961246;
	Thu, 20 Jul 2023 21:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB65961246
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPx1tandWFgx; Thu, 20 Jul 2023 21:34:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D54612BE;
	Thu, 20 Jul 2023 21:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03D54612BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AA121BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56DCD612BE
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56DCD612BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6vnIdYV8Ti3 for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:33:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77C4161298
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77C4161298
Received: by mail.gandi.net (Postfix) with ESMTPSA id C74ED1C0003;
 Thu, 20 Jul 2023 21:33:51 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:33:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720233349.086eed6b@windsurf>
In-Reply-To: <20230715174447.1041792-1-bernd@kuhls.net>
References: <20230715174447.1041792-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689888832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYF3Rr5SbMuHzOHkz+dXCcdXjhfWJsBYd7kE++/fQjg=;
 b=FY9godzwrtmBS4B8qALkooDwAk4qiKkW/I4tGUuYZFSlMi27dDO/hdv2/uuIXD0nM0vYPa
 LTyBZveCN4QQL1exf5n14Ws+odX9a4DW0luTW9/XSwQIkcTZmYD2XZ5cjrtboMfkEbsawi
 lWVdWCaSt2QsMIC9gv/M+1kRWfUjxpofhNm2obpyRv6DGvd7g1zo8I3puNo6Einfc578ph
 lYSeodHKHyXLRnQoXsZul1wmKCCaHswIHljGqYyd63YSQc9kig9O5qugMXLpTN/lZwQb3j
 lffcEgRsNCEhsX6kphZikSNEEEoHOncEDtjFsO0i8TNUdRDAWXIYz5GQY0Ib7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FY9godzw
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to
 22.3.9
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Jul 2023 19:44:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/intel-gmmlib/intel-gmmlib.hash | 2 +-
>  package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
