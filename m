Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC5EC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20126828EF;
	Wed,  3 Aug 2022 16:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20126828EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ah2eZWreiY_P; Wed,  3 Aug 2022 16:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44588828B5;
	Wed,  3 Aug 2022 16:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44588828B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFCDD1BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB78682897
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB78682897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVV4Eup442rr for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCEDB80C0E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCEDB80C0E
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 16:35:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82B691C0007;
 Wed,  3 Aug 2022 16:35:20 +0000 (UTC)
Date: Wed, 3 Aug 2022 18:35:19 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220803183519.37732e56@windsurf>
In-Reply-To: <20220802173121.14438-1-guillaume.bressaix@gmail.com>
References: <20220802173121.14438-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659544521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2j6duyoWhSpgjX1pNuonR9hdJ05JV598YEefbhaQyY=;
 b=bGulieZH+i/nU6/bnp1loW8TqvYK72r9D1adFNVfuzCYG5D2TJQIA1cm3gg2IhENUGeLqs
 45hnlkLv4B7o79LxqehQGmI4D3nw2lMv4zKEeOE+pDtjXI6emVp3oDHGN6hM/dr5JdFqDB
 cbsSWKHpi0LmuwrkLUGKalf3f3ZMX280JmXi7v4EHic7oRV3F7bLEP6tYBoEorGzt0otIm
 5DVJJRWwf6c/au2lbw+j4c487yYyVPu74DLwbDRp3W8I/koBB6aZ5dAg0wZunIhHNpEwcX
 eH/jiEwnHaI+r/lXtcLs8u7kdO4SFWDqB3QjNhxKgH2eZb08TYIUTu9hC2Kz3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bGulieZH
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_python_scipy
 relax timeout value
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Aug 2022 19:31:21 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> We might get a failure here on slow build machines,
> as scipy is fairly long to import.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
> Test did fail on my laptop for example
> ---
>  support/testing/tests/package/test_python_scipy.py | 1 +
>  1 file changed, 1 insertion(+)

Applied to master with a reworked commit log, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
