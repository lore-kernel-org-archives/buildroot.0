Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0483DEEAA6E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE1B612C0;
	Thu, 14 Sep 2023 20:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACE1B612C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cirgfDLWk5g6; Thu, 14 Sep 2023 20:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2076A6120E;
	Thu, 14 Sep 2023 20:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2076A6120E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8D41BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CF444185C
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF444185C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtUe6YXSz67P for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:26:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BB05403A2
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB05403A2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24EB1FF804;
 Thu, 14 Sep 2023 20:26:12 +0000 (UTC)
Date: Thu, 14 Sep 2023 22:26:12 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230914222612.466246b2@windsurf>
In-Reply-To: <ZQBpeOVq27AGkcF7@waldemar-brodkorb.de>
References: <ZQBpeOVq27AGkcF7@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694723173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCN+svL1VPnEVobul2F3MOJN1uyQm8NRM3yp0VBY3ys=;
 b=TbbB3GiugXWU6pTM3a/fzrXcZfhwHEMl/HCrKaOKVoVmKY7LkiYTSRSjPGQRMII4OJwC5g
 2XQm1lxNOJxZ7inGeJJp7hXJzynwGQ9A22hWMOSpYQyc67nlK9R8wNDDgI2qN4PjcAMu9Y
 UB3OG7t8dY3MMuQSxljQ4r5UtzNMbXdout3YpcQPJkfLwLXcLrKlFtlBKfDyGTVX7Fb0Ho
 tdkZ69xZ/30v1Yvcz+8kEpQtVr77NPTDQyK+kW4bECQRV6Hv5I6UF/Hhxe0VuojvnC4RQx
 QQRDseIfZfUuobIC/uz8TlpT4My52z9a0BP30zf6lB03t7la2Lbscbqsw3x3eQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TbbB3Giu
Subject: Re: [Buildroot] [PATCH] ruby: bump version to 3.2.2
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

On Tue, 12 Sep 2023 15:36:56 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch is upstream, so remove it from .checkpackageignore.

Well, the patch itself is also removed :)

> Host ruby needs libyaml.

Could you clarify why host-ruby needs host-libyaml but ruby (target)
doesn't need yaml?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
