Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B789C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A5B60D78;
	Sat,  4 Nov 2023 20:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1A5B60D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLINOA-MQ7F7; Sat,  4 Nov 2023 20:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09CB860B8A;
	Sat,  4 Nov 2023 20:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09CB860B8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1471BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A6D541755
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6D541755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtT6I2INd8E9 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:46:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBDEE4174B
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBDEE4174B
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE359FF803;
 Sat,  4 Nov 2023 20:46:11 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:46:10 +0100
To: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Message-ID: <20231104214610.7c1b9e2f@windsurf>
In-Reply-To: <20231004132756.548326-1-adeep@lexina.in>
References: <20231004132756.548326-1-adeep@lexina.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699130772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mtj4ooEHoxUr919U6PHAJ3qGCzjObZKBOSu+WYXGTG8=;
 b=VWve6nEihrdRIGzQMzn/hUKNQtW8wD8rbeD58WZCF47QCndqeylBqJfl6n3DktBm92r0Ws
 YIuk6RhXl+eAduoHZeSHdC7J8R0ybrRlDzpFr+RcM21ODvhXvbiIu+Fm6EKqtrryhp8UPb
 CqaQN8JhHVB8uTPBkbMM4hQfMziMEPhSiHqqwOA7DKUxxbmTWc9KWv00xP3BpevZRj2/tq
 rTsdQqvX5IBclYbAOC+JYNY2ijnV4w9+UthRwzmSxvfsH/xcbG3mDwyj/dbze3YW1YeBRr
 DqN6TaYykCMVDdowgSD7IeioaMI6ICMgoh8+1VG3hc70WD+nW3cy84WfMIovkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VWve6nEi
Subject: Re: [Buildroot] [PATCH] package/rtl8822cs: Bump driver version
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
Cc: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Oct 2023 16:27:56 +0300
Viacheslav Bocharov via buildroot <buildroot@buildroot.org> wrote:

> Bump driver version. Fix build failures:
>  powerpc64 http://autobuild.buildroot.net/results/3600153fa9d7bb267c835ef896e35cd11458163e
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> ---
>  package/rtl8822cs/rtl8822cs.hash | 2 +-
>  package/rtl8822cs/rtl8822cs.mk   | 2 +-
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
