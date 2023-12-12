Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D36C4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 12:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC37C417C0;
	Tue, 12 Dec 2023 12:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC37C417C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeSYEYpVzvAo; Tue, 12 Dec 2023 12:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25CA408A2;
	Tue, 12 Dec 2023 12:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E25CA408A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F145F1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 12:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA41740931
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 12:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA41740931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x10oTRkg2NwP for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 12:00:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9A34408A2
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 12:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A34408A2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 658DCC000A;
 Tue, 12 Dec 2023 12:00:51 +0000 (UTC)
Date: Tue, 12 Dec 2023 13:00:50 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231212130050.0f8cb325@booty>
In-Reply-To: <20231206200730.1948165-1-giulio.benetti@benettiengineering.com>
References: <20231206200730.1948165-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702382451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkNcWFeI/rrbcwoCuozhzufsfLhLua2tdlGgCcO9ed0=;
 b=hmNzPmABQNlAoyCZcYaMi7xLe2RC4qiExM65CIRq7/4FPWmh/mZuXRbDzk4aGe0EvMldx5
 lwKqyQLNxFEX/6DHlM3XzByrUkKtHUGcPKhllce+0onsq0ZdOhARTxE/2zuHTh/FwDgP7w
 +Ziid8EKEDrXrpsNwyGIweQ4VhWD3l8Hu/oXsDtndHgqbrRoc3fpXiYVh9+RwURn43Y7Nm
 ow3kDyv0p85VXsATTQrTc5mUPRrwtidRJnFluct7RJKsMzRUWegB8/1ipacoqQk7QYiWs2
 c3xfHIm1KI+M2uHq0SxuryS0iL5qrQdHQKyvPjKC9ZPLRyr3cRH1TqHZwia4+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hmNzPmAB
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 2023-12-04
 version on v5.2.2.4 branch
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Wed,  6 Dec 2023 21:07:30 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version allows to build with Linux 6.7
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
