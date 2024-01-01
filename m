Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F27C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF426409F8;
	Mon,  1 Jan 2024 21:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF426409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VK9eiQhb7NzZ; Mon,  1 Jan 2024 21:25:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B111140A58;
	Mon,  1 Jan 2024 21:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B111140A58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E4011BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4F3741EE7
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F3741EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yefBw71NOqZD for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:15:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8663841523
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8663841523
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17C0EC0003;
 Mon,  1 Jan 2024 21:15:04 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:15:03 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101221503.531ae156@windsurf>
In-Reply-To: <20231230210913.1279427-1-fontaine.fabrice@gmail.com>
References: <20231230210913.1279427-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oc3e4U5DCzYWlpgff/4sKiqZpioQvGbQQe5MM91JK+w=;
 b=GTS23dB8vi8YWqEWDp1Nnu2wsV8RBWpk3BYUeVstRv0JCKdGe0w9X2MpCsFNcUtQ6VvKSC
 9FbQyDAAW5wsl7/Cmw2eYfqwBhZuJJH3D32404pNbQP16DMIzq9sEBYeU1KMP/an/xIs24
 +GcQqRNP7j7oSW5fQjikfGEm0735pkg5uQpkoQUXM4ZSkJBzg/aV1Ez1rdbMmU4tcxnjUw
 T8UR6wchmEyncIDF3+tSWdG+wW06wMIF+DrM6jKOMZdUJSWd2R6qgXCpD2vqm2y2Q6L2sE
 /0EPp5yaKdrxktYA2DCVfE+uz2Yox3UobCOomV2h//85nI8NBaQlVrvjplmJUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GTS23dB8
Subject: Re: [Buildroot] [PATCH 1/1] package/log4cpp: bump to version 1.1.4
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
Cc: Damien Lanson <damien@kal-host.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 22:09:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> configure script has been fixed and so autoreconf can be dropped
> 
> https://log4cpp.sourceforge.net/#releases
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/log4cpp/log4cpp.hash | 6 +++---
>  package/log4cpp/log4cpp.mk   | 5 +----
>  2 files changed, 4 insertions(+), 7 deletions(-)

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
