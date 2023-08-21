Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109EDEE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40631409B4;
	Mon, 21 Aug 2023 13:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40631409B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScK7e-GdzT41; Mon, 21 Aug 2023 13:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 423BF409C0;
	Mon, 21 Aug 2023 13:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423BF409C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1696E1BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F111A60BCB
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F111A60BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id casu-s5L2C0y for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:42:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4B1260B45
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4B1260B45
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEB70FF806;
 Mon, 21 Aug 2023 13:41:56 +0000 (UTC)
Date: Mon, 21 Aug 2023 15:41:55 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230821154155.5397c326@windsurf>
In-Reply-To: <ZOMrvcRQY5QAupGk@waldemar-brodkorb.de>
References: <ZOMrvcRQY5QAupGk@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692625317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=poB/Pv++uj9TEfjGGOVHaEKlqvTDEl3PlhJziEhjxCo=;
 b=G31qTQzw5JaqL7anBmgZMGtrCLo910ww84Q1Im2A6jW2CZTS73+eOjL9xXg5QnT7SlSJAa
 HHJCRMJhjQV4D/iB7hgKMvdWAmdhLjEXYCk7W7mC33q3ThSyN7pSwYNTkiBRynlWzm4c66
 IA3e0z/oZotVts8BkycxRAZc8/wEGNF9VfyKrorVdXrb/8cU8+bIUGsWtqI5k+ZRSzKL2P
 6V4FOYKDKL8xfNihWZin8j26gDb4N/ARuDebWjTUlF08Tbab9IxqJxoU8lFpnburfJwnBy
 KTpwWU2/DiO1ZvQwgHgjO30m2zrQYJ5HRG0MkB/gKkqW51+gegkhSVoJi8YuEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G31qTQzw
Subject: Re: [Buildroot] [PATCH/next v2] package/file: bump version to 5.45
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

Hello,

On Mon, 21 Aug 2023 11:17:49 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch is included upstream.
> See here for Changes in 5.45:
> https://mailman.astron.com/pipermail/file/2023-July/001205.html
> See here for Changes in 5.44:
> https://mailman.astron.com/pipermail/file/2022-December/001042.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

You forgot to run "make legal-info", as this update has some changes in
the files used as license files. I fixed that up when applying. Applied
to next. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
