Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC69AC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A058960BB1;
	Sun, 30 Jul 2023 10:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A058960BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CB9bzQuhmezM; Sun, 30 Jul 2023 10:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6EC46079B;
	Sun, 30 Jul 2023 10:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6EC46079B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F16811BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C89E660774
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C89E660774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33-_ZeRolvHn for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:38:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3A2C60615
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A2C60615
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13ABEE0002;
 Sun, 30 Jul 2023 10:38:47 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:38:47 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230730123847.0432c1f0@windsurf>
In-Reply-To: <20230604154818.3681851-1-troglobit@gmail.com>
References: <20230604154818.3681851-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690713528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qky/74nJsL9X3457tQWnGDtaRwg6YyIwx9LMX6R/KGw=;
 b=S+uGG0eUfj1RDiZeWEscJAP5hclbOwQEKGRRphoEOLMZGDGq96HNJGZd0rmB4/9ij2tgRu
 jzQj0ym2UdNpKj/MjZyXBGpCTcSr/bkgldzYSmpF6jXNB5KQU4QMVXC7QUO5oACUnSBbmL
 XNWmO9Khh0Yg3sB5zmN4h00ZftgmopA//AzMdqhtSd6etr3W/odMYv8CvLUS+fewcS1ZRR
 KDzAo4Xtp8T3lWCWNqo0tt2f8AXwlRtN27d7rIBDkBIIfQMxKTVCEL6ncjXpL5mTCtCgi/
 gDTHyfxgRlwbYhmF7qQIZu23gXM9x8W+RIySxuHF9hp1y8mdjawmlbH2sNU7NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S+uGG0eU
Subject: Re: [Buildroot] [PATCH 0/2] mrouted upgrade with systemd build fix
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

On Sun,  4 Jun 2023 17:48:16 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Joachim Wiberg (2):
>   package/mrouted: bump for v4.5 release
>   package/mrouted: add /var/lib/misc for systemd builds

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
