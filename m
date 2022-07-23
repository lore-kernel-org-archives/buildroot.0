Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237E9C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBA6760FFC;
	Sat, 23 Jul 2022 19:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBA6760FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id irUqKFl6mj2m; Sat, 23 Jul 2022 19:14:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA9060FB4;
	Sat, 23 Jul 2022 19:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAA9060FB4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E97151BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0D9540566
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0D9540566
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mZDkzQi5Q-R for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:14:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EF3340354
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EF3340354
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:14:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5CEDC1C0003;
 Sat, 23 Jul 2022 19:14:42 +0000 (UTC)
Date: Sat, 23 Jul 2022 21:14:41 +0200
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20220723211441.53c37bb3@windsurf>
In-Reply-To: <20220510094556.20618-1-yegorslists@googlemail.com>
References: <20220510094556.20618-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658603682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czg94z+AXYxdEadLM0H4FWXjRnOnysJu7jAgQKcbqas=;
 b=X8VC3rjGktRX3el66wc4ZoQpVhmxa3YgvKlsz+KvrwwdqdFJqtjDhNYyJiAp/CGidjzjIR
 J0a9NLx0rscvYX3bNLV1HUsGEoEBG745lmCqzUCt/AnAHDUAqMVquosp1QLQNTkk9B8hTw
 46amV1l3siD02b+ErVWNW4Og0VIUPcO5DtWAfhuqz7djqVKS0LyI9uVAyVLXkfTx3QClKd
 yDagtCIdh8F7Nmd7tbc74UOAL1W84YOQ85iFwzGLPJkx10SeHoSXUFuYpacWQKPvjpfdbC
 TcvtdISB5gl5YJmTO5OfOtm7ORj/JUKDjR888x3wJ6PYDOYHY8fx/C9jc5vHtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X8VC3rjG
Subject: Re: [Buildroot] [PATCH] package/python-ruamel-yaml: new package
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

On Tue, 10 May 2022 11:45:56 +0200
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                                  |  1 +
>  package/python-ruamel-yaml/Config.in               |  8 ++++++++
>  package/python-ruamel-yaml/python-ruamel-yaml.hash |  6 ++++++
>  package/python-ruamel-yaml/python-ruamel-yaml.mk   | 14 ++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/python-ruamel-yaml/Config.in
>  create mode 100644 package/python-ruamel-yaml/python-ruamel-yaml.hash
>  create mode 100644 package/python-ruamel-yaml/python-ruamel-yaml.mk

Thanks, I applied after fixing two check-package warnings:

package/python-ruamel-yaml/python-ruamel-yaml.hash:6: empty line at end of file
package/python-ruamel-yaml/python-ruamel-yaml.mk:12: line contains trailing whitespace

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
