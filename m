Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C392C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9EF561AD9;
	Sat, 23 Jul 2022 19:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9EF561AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8RslW330t5N; Sat, 23 Jul 2022 19:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE5CF60FB4;
	Sat, 23 Jul 2022 19:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE5CF60FB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AFF31BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 053B684C29
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 053B684C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msrnbmWWYuLv for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:16:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4745284C25
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4745284C25
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:16:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 07C22240002;
 Sat, 23 Jul 2022 19:16:25 +0000 (UTC)
Date: Sat, 23 Jul 2022 21:16:25 +0200
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20220723211625.7acad074@windsurf>
In-Reply-To: <20220510130248.10966-1-yegorslists@googlemail.com>
References: <20220510130248.10966-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658603786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sj2cNeRn6zXcHHoKMHrRhLv8eGBpF94EleN8NELY2i4=;
 b=Jiaf8qEQ/bmeLP/bm7dOJTWk3Q4Wfa6n7daZM49Aoo1o7t1FGco8LEUOgHAN7rYrKXmWvg
 fTCQwbYihE5IVJUQUO4R8SywpY9rtFrS7kNkZULuu0fLEB0UnnikVNlbMN2BUbYy2sw2OO
 xOoaKbQ4rwMbIBOU0cxksKJB7a22RT+sf8D3lqltJj8wr6mAYxNkCjIrcPfooQCIgoAPF5
 b6oRmw6iGTiENjLnpJbQLZ+a7IoRGxQV2ju7vqYwuUI6/cHv1UIqaUOZ5PLtMKSwYTj8Nx
 6mx//zXfsg/NnecJvgBVGXRzuWyQ/CMQVRz0xg/Z8gs71UVrOKtJ7Luwv4JJlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jiaf8qEQ
Subject: Re: [Buildroot] [PATCH] package/python-pyrsistent: new package
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

On Tue, 10 May 2022 15:02:48 +0200
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                                |  1 +
>  package/python-pyrsistent/Config.in              |  6 ++++++
>  package/python-pyrsistent/python-pyrsistent.hash |  5 +++++
>  package/python-pyrsistent/python-pyrsistent.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-pyrsistent/Config.in
>  create mode 100644 package/python-pyrsistent/python-pyrsistent.hash
>  create mode 100644 package/python-pyrsistent/python-pyrsistent.mk

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
