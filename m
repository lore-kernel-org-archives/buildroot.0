Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03079C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99ED34018C;
	Sun, 11 Dec 2022 20:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99ED34018C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROAIIbFyJpJB; Sun, 11 Dec 2022 20:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A697B40183;
	Sun, 11 Dec 2022 20:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A697B40183
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2071BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 656BC80B0C
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656BC80B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5Jqyd8k5GZY for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:19:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ADA980AFA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7ADA980AFA
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:19:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F13CA1BF204;
 Sun, 11 Dec 2022 20:19:33 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:19:32 +0100
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20221211211932.27bae217@windsurf>
In-Reply-To: <20221205060414.2046-1-yegorslists@googlemail.com>
References: <20221205060414.2046-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670789974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGAroHf5FgWOjWNOvKdpwn9VK/E7FYi+XOX8KR59rv4=;
 b=BURjAEoSsz94irWceIj0JwNm22ovqDDvDRF7ovHPgDgVQGiDYxx0lLurEgoegmgTZ+Le+W
 E7riCsxnZDDBGr8NdfSYRW4un5/US9jsaxYxyDl5vRLwEySeLS6NX5iWmdIe8O68Ri0RoG
 71eliGap69RAW39JAQS3Pd+T0nq/aOyFg5fSdtMGbsaZHPyuTHjsaN1FugNceZc7jeihfB
 X/8OUtv2jSj8bjL+hMQKWF5TEMeE3vVKjJqjGVuKHbjG38omltG5VaU96R6dJKvIm61ejt
 wT0jWbkGzlybG0P2CGZ+DYLSwxICF1iABeW0agKMQSgi7lY2F5cJRbc6ut3pbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BURjAEoS
Subject: Re: [Buildroot] [PATCH] support/testing: add test for
 python-dicttoxml2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Dec 2022 07:04:14 +0100
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  DEVELOPERS                                           |  2 ++
>  .../tests/package/sample_python_dicttoxml2.py        | 11 +++++++++++
>  .../testing/tests/package/test_python_dicttoxml2.py  | 12 ++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_dicttoxml2.py
>  create mode 100644 support/testing/tests/package/test_python_dicttoxml2.py

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
