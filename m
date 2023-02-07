Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEEEC636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EA59418AE;
	Tue,  7 Feb 2023 16:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA59418AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6oWYRa3kRLqy; Tue,  7 Feb 2023 16:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF5EF418AF;
	Tue,  7 Feb 2023 16:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF5EF418AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70B571BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D3F960F6E
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D3F960F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6sGF_H-kCl55 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:14:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 425EC60792
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 425EC60792
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:14:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2323100020;
 Tue,  7 Feb 2023 16:14:07 +0000 (UTC)
Date: Tue, 7 Feb 2023 17:14:06 +0100
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230207171406.2c0cba33@windsurf>
In-Reply-To: <20221128123418.2197-5-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
 <20221128123418.2197-5-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675786449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9d8u42QRMtOyrG8CGLj4hZz6Z9GOlUlX/W6Ub7EuiM=;
 b=GSlGsFR95LzuHNzGQLzoK/bB6B7A1sb7CzqSH6jp39zj+ZnW8aAVSyxc12cx7MDbSMlsUT
 wtVyiQ2REyjA3jiNmInYjk8QddjgIBUdidO+Hfs30h0QaieJMPk96WGpeYRbanOrUs0dLR
 0w74LZadGPdp0TrdHum3/YolDNCL5stf2HvHIRG9QPQLxwW+syLFjlwPtP/CskQ5Y//gck
 G6MqzAxVHNmqD4aXj4ir70GkW/kkW05x69+9XMQDjdYr03vDm8OFo2srAd7t6dtnPMLKEo
 poFVwcLT0A9QF/T/HViRsq+4ibuqHy//e3KczHlCteon6chKeck/FPHSb9RTWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GSlGsFR9
Subject: Re: [Buildroot] [PATCH/next 5/6] package/reproc: new package
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

On Mon, 28 Nov 2022 12:34:17 +0000
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Required by micromamba.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/reproc/Config.in   | 14 ++++++++++++++
>  package/reproc/reproc.hash |  3 +++
>  package/reproc/reproc.mk   | 17 +++++++++++++++++
>  5 files changed, 36 insertions(+)
>  create mode 100644 package/reproc/Config.in
>  create mode 100644 package/reproc/reproc.hash
>  create mode 100644 package/reproc/reproc.mk

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
