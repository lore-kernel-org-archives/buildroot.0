Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAB3C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CA7560FFF;
	Tue,  7 Feb 2023 16:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CA7560FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3ADK-di4ESM; Tue,  7 Feb 2023 16:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F372D60FFB;
	Tue,  7 Feb 2023 16:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F372D60FFB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1EC1BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DB3A418A2
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB3A418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zo9W5O8HzW_x for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:03:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 825F74189C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 825F74189C
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:03:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 38341E0019;
 Tue,  7 Feb 2023 16:03:53 +0000 (UTC)
Date: Tue, 7 Feb 2023 17:03:53 +0100
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230207170353.1caa0546@windsurf>
In-Reply-To: <20221128123418.2197-1-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675785834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NK0dDl7JCw2VjEX37nyTVE9luqKaXdSqKO49vBiakqs=;
 b=AK1kBw1IE2J3t5h8uyeyCwBH6BMBENowlBCZGIxKrUSvkyt/2FZ6lyDt9G/wfPR0zXIV7x
 OhfVr0vXF05MGcXcEoaWzY/juxKiLSdWfxi/tGp/S5/JnVVnZtZC/f0fZQzHi4qNxOO4Kg
 0z6Kt5L9MrzMPzxU0vYtVzYIYApUqGUcXXHANkh49/EBtTxQ6zKZVBKRkVQ+uuxJ9qMcME
 9n4OqJ9wzefK/7bGj4CQp4tPc4fFbkocYUrmCaScuI7CB/weYRSov6hAjQa5Bhl/BSBT3L
 7Dbvr3zEE6CFbwWJXMDKic73WqF0JsRL0VcCIq2oaxIdRm+IsJO7htW4jXAlRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AK1kBw1I
Subject: Re: [Buildroot] [PATCH/next 1/6] package/cli11: new package
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

On Mon, 28 Nov 2022 12:34:13 +0000
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Required by micromamba.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/cli11/Config.in  | 13 +++++++++++++
>  package/cli11/cli11.hash |  3 +++
>  package/cli11/cli11.mk   | 15 +++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/cli11/Config.in
>  create mode 100644 package/cli11/cli11.hash
>  create mode 100644 package/cli11/cli11.mk

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
