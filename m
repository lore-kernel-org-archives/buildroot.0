Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445A3C6FA82
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 12:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E440C60E4B;
	Fri, 23 Sep 2022 12:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E440C60E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4s8z6F8IV1YJ; Fri, 23 Sep 2022 12:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BCBE60F39;
	Fri, 23 Sep 2022 12:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BCBE60F39
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7875A1C2744
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53EC740A38
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53EC740A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQ8D3iGC205m for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 12:20:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2865140A8F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2865140A8F
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 12:20:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EDAADC000D;
 Fri, 23 Sep 2022 12:20:15 +0000 (UTC)
Date: Fri, 23 Sep 2022 14:20:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220923142015.72bdd243@windsurf>
In-Reply-To: <20220923013831.923637-1-james.hilliard1@gmail.com>
References: <20220923013831.923637-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663935616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qE/uxJseZgzFznjcjcs0lnvmA1cFQqYOHfhAmU11RGU=;
 b=Qkd2UPYGSssgq5pWMDAr/wyQbpjyMe/HGqgMs94D/gOQ45AMD5GCQ9jXkJWQ9HeggUl6o+
 bUXU2C6O2K0LyO6uXeKGDW9XcqbErkcRCTsHYLJJ0Hi3NYYdsYzx5DgBfwCQKWYga5fh9M
 X3RsjalVEtMQsIocdgoGHG2Ispy0fg7TATU2KqRTSzfAExSP4gTzLgfMQ3K6TDPcFp2mTm
 N2o9MNteKzpf/6Y7hCPyTdPDoY22whY13F83RWpR/Z4g9LDpSkDrlgz7PfSHgA6MqFmgi8
 TfDsaNPoEUesRKgameMUJp6JLD5yLAoVpyYWsSV7GYIVqEgX2InzYKtQ+s00vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qkd2UPYG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 1.26.12
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Sep 2022 19:38:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-urllib3/python-urllib3.hash | 6 +++---
>  package/python-urllib3/python-urllib3.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
