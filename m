Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC9BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D339B40241;
	Sun, 11 Dec 2022 17:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D339B40241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYJFsWo0Z4GU; Sun, 11 Dec 2022 17:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C4E74026A;
	Sun, 11 Dec 2022 17:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C4E74026A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC8F1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF627608B7
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF627608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtWpga9clK_o for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:06:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0BEB6059B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0BEB6059B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:06:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1809C100002;
 Sun, 11 Dec 2022 17:06:14 +0000 (UTC)
Date: Sun, 11 Dec 2022 18:06:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221211180613.7ba1e788@windsurf>
In-Reply-To: <20221206044545.2812061-1-james.hilliard1@gmail.com>
References: <20221206044545.2812061-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670778374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hT8I6TqwhIAYcrcNm1yeNCgY2wzHxAxSUBUCdUj7EAQ=;
 b=lFwpx5oQQ3JX13ZyaAw95ZELxMDxBY1toS8FzLOGZVB5GxKhdth86Pd4UlzazibWYSqHLE
 9DHdpymCy7PkK37VhpNK37/HCOatWmCVK0ftH6v7o7VTkUkPlKh93Ju0shBX8aMJNAH4en
 OGfDquBE6+W7Xos0wi6umFeOTwX8ui+dTsrmGvX+ddvY2YLr4yzvJvxGRx9V1nx+SZedhq
 FPlsdVm8JY4a5Mo54LnVszPduBgbRsewVMwGpkFp3w7swrXgs5N68kmgvzPC1plx0QPjVb
 /VJADRQuZtAl/yhW/yCaSq6Fl1tw/fBKg4u24qt9z2XxPKdG2FZgjDcNLDrrgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lFwpx5oQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: drop
 host-python-tomli dependency
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

On Mon,  5 Dec 2022 21:45:45 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The host-python-tomli dependency is not required on python version
> 3.11 and newer.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-maturin/python-maturin.mk | 1 -
>  1 file changed, 1 deletion(-)

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
