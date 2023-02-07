Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0A1C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330D8418A3;
	Tue,  7 Feb 2023 16:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330D8418A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77hEJntcnHRz; Tue,  7 Feb 2023 16:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 430EE418A2;
	Tue,  7 Feb 2023 16:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 430EE418A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A49711BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CE36418A0
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CE36418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oen2Q2AuAFv8 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:04:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 100704189C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 100704189C
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:04:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AD01A10001D;
 Tue,  7 Feb 2023 16:04:08 +0000 (UTC)
Date: Tue, 7 Feb 2023 17:04:08 +0100
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230207170408.143c2e5c@windsurf>
In-Reply-To: <20221128123418.2197-2-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
 <20221128123418.2197-2-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675785851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDJ6oMuhBGt6l8bEbctN5+I37+KFs6GITLfoVPLMUsI=;
 b=oP3B0ad2LjoZNHZAIqofH8xvf2kT+zxavDlyCUufS1YvYSNEWo69bTyXxUzKIIhRU0OJz4
 J0DBhJv+tlfPe/YBHeQUdD2rg2scSQZptK5RT5FYQfXSD66yeq3NOivMVj5+eQ+2yT+n3y
 cdzWw2xRyaQHVHdtHaP3XNypjwZivSqh8+S2+AqSENA5/RB0vtnyj1GF4zSOt44VbCLe6S
 mkjifg3/3WwWtUBzvygVDf7jario4l++b6HpVRx6tTZSC4hylIsw9SHeiuhMBAEy+rRYfF
 oG++Txdl+23GQAL8It/plqnb1lJQs1QN28OZgdrsg+jQS/9PqIZSwHZkTHKwjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oP3B0ad2
Subject: Re: [Buildroot] [PATCH/next 2/6] package/termcolor: new package
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

On Mon, 28 Nov 2022 12:34:14 +0000
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Required by micromamba.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/termcolor/Config.in      | 12 ++++++++++++
>  package/termcolor/termcolor.hash |  3 +++
>  package/termcolor/termcolor.mk   | 14 ++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/termcolor/Config.in
>  create mode 100644 package/termcolor/termcolor.hash
>  create mode 100644 package/termcolor/termcolor.mk

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
