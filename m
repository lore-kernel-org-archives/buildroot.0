Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D44C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 21:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C59D4813BA;
	Mon,  1 Aug 2022 21:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C59D4813BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2yjDqIFKdxh; Mon,  1 Aug 2022 21:00:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 332E3813B1;
	Mon,  1 Aug 2022 21:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 332E3813B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A70411BF290
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 721FF40241
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 721FF40241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iauYT2CxreRR for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 21:00:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCC8E4022C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCC8E4022C
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 21:00:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7EFBE20005;
 Mon,  1 Aug 2022 21:00:00 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:59:59 +0200
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20220801225959.46488a93@windsurf>
In-Reply-To: <20220724235301.3708271-1-ricardo.martincoski@gmail.com>
References: <20220724235301.3708271-1-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659387600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5euflNxL948rq2J3/OdLjMKeomPHjYiMWyrTMRowpeE=;
 b=Ezl2HgLhX50420DxgFkHV0eGHKN8d4GJ63Zu501GEpJ92I9c4krYvgSqG7hRYSYxZUW3aN
 XjfqrW033Cq1UgjAlUp6uiqDUdxkhxu6k8HbhIHrng4toMb+2eDbl/9JLFL3d+mWGi0tF9
 x3CYemF7a77h6xvkkyFWL363n9wXckFLVeS3eb0ZKgkHls/zqBJoEsd+6lGJvVXFkqUNS0
 zF4UtdMGb4TUPooV1wlGy8jyj3E0GwvzMw3fKP21DpdUDdfIvTEqrKA8sjJYA34ZVcfjKx
 aRWAp0orsRnwjqW/dtRcnFuaX1NFAjkMKA3j1gYnrhewQ4hMUpwRBHkugMcW0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ezl2HgLh
Subject: Re: [Buildroot] [PATCH 1/3] support/testing/tests: improve
 get-developers test
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

On Sun, 24 Jul 2022 20:52:59 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Change the test into a characterization test for all warnings and errors
> get-developers can return when parsing the DEVELOPERS files.
> 
> It will be helpful when changing the behavior of get-developers to bail
> out on all syntax checking warnings.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  .../tests/utils/test_get_developers.py        | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)

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
