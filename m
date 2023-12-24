Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2B1C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A6108177C;
	Sun, 24 Dec 2023 17:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6108177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id If9TlB_1-83I; Sun, 24 Dec 2023 17:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8179F8188B;
	Sun, 24 Dec 2023 17:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8179F8188B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B53B1BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D7EC60ADE
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D7EC60ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5WlQCtTnzBS for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:52:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F24D60A8B
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F24D60A8B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92B5E1BF203;
 Sun, 24 Dec 2023 17:52:33 +0000 (UTC)
Date: Sun, 24 Dec 2023 18:52:33 +0100
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20231224185233.3ea472de@windsurf>
In-Reply-To: <20230825195635.30709-1-ckhardin@gmail.com>
References: <20230825195635.30709-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703440353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AnefbTeBQdF579jUNF5hpJL7RAAUeKoUsYnzpu4AKko=;
 b=ZARtZpWQ7Eqr/IC684y1Td97N+wWdptRokUFJYZHyPrXJ46jgDTGU47aLv0xIJ5WMadCda
 d0Xykc2G7nJ9NLeNIl9bh0ZMoHXz/fwGRIWg1hLaNNEPCFUt0xGRuZ+sGcRgsbFiV8BkP8
 cZHi2l9J4wH3XcdsI8cVJQwjdWzCMDC+wlL9Lgu8cGldhlZfASelklwwTX+3f2knSsAZZr
 DZHBXGZplevFAAuqUUR+cUih2zQasE9P63MfSrALJryKvrrtjthgxDc/HbdraThI8vvmJM
 j1a/wmmnQFFGTSypyhKZA9yjPt31cGN6deOuyC59dKLcvWQ0U46R79/szbiFRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZARtZpWQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: add the configuration
 to support python curses
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

On Fri, 25 Aug 2023 12:56:35 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> Working on another project with the buildroot sdk and there
> was a python configuration script that could be started from
> the build which required the curses module. So, instead of
> switching python interpreters just add an option to be compile
> with the curses module for the host-python
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>  package/python3/Config.in.host | 5 +++++
>  package/python3/python3.mk     | 7 ++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)

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
