Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E687AC25B08
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DB70402E4;
	Mon,  8 Aug 2022 21:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DB70402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPcsNy6Bxywy; Mon,  8 Aug 2022 21:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 713A24018B;
	Mon,  8 Aug 2022 21:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 713A24018B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90B141BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B76D60AC9
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B76D60AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Z14SZO6pdUR for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:08:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCEB160AE9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCEB160AE9
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:08:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D1331BF204;
 Mon,  8 Aug 2022 21:08:30 +0000 (UTC)
Date: Mon, 8 Aug 2022 23:08:29 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220808230829.580f1a8f@windsurf>
In-Reply-To: <20220808154817.1712207-1-fontaine.fabrice@gmail.com>
References: <20220808154817.1712207-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659992911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mbw03J0jXL6GO7Vl5JXWSlqQhc7s2C8LZCuJ5wTNrRo=;
 b=ZdX8+XHFAutpeM1D2UcbIJ9mkpCyEkJzLKhPY9VNVIQeyHIiK1IFomcGpk4dVZg7CviPik
 b2ZrjbUeGWIpWbDwPo9HaBQSXWN2m/k7C5O7nVwwSX662UO+VyfIWttMA/rv1vLXg4xx3H
 D2qk9FGLlHsDikCudkZRJA5Hf+0QR+9txjZ/ncjwapBUY2SkA0TyAdHPzIUYG36OIF0iU/
 nY+T5EBhj9gUEjxhaG3bJ70q9vrOA06719ycYOxwBpo9qyk6eNbQwz9RO7RC7ovwp/PDFl
 KiH71ZdWcWrDtrbMY9+Ui+qzJqdrtGaw6kEazzdrOzgj54+Hll2pudKtwz87DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZdX8+XHF
Subject: Re: [Buildroot] [PATCH 1/1] package/gauche: bump to version 0.9.12
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
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Aug 2022 17:48:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update site to get latest release
> - Update hash of COPYING (update in year with
>   https://github.com/shirok/Gauche/commit/09a3d4f9da52d8b3d9bc28a0ff2aa9c02e99190a
>   https://github.com/shirok/Gauche/commit/2a4146798cdaceaf43764e1bf7b959b4a31bf995)
> 
> https://github.com/shirok/Gauche/blob/release0_9_12/ChangeLog
> https://practical-scheme.net/gauche/gmemo/index.cgi?Release%200.9.12
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gauche/gauche.hash | 10 +++++-----
>  package/gauche/gauche.mk   |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)

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
