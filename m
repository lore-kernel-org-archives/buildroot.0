Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4246BEEAA74
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02D5611DD;
	Thu, 14 Sep 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02D5611DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEnutDwa9VcH; Thu, 14 Sep 2023 20:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C7CB60A5B;
	Thu, 14 Sep 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C7CB60A5B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96C981BF31E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D79A60A5B
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D79A60A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lqAdic9hQPzI for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:52:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C980B60709
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C980B60709
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC720FF803;
 Thu, 14 Sep 2023 20:52:56 +0000 (UTC)
Date: Thu, 14 Sep 2023 22:52:55 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20230914225255.3dbff3af@windsurf>
In-Reply-To: <20230912100352.237822-1-egorenar@linux.ibm.com>
References: <20230912100352.237822-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694724777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j19DtdTJiQ1a26kz9bZo3DWf5sx1N/4gUq2T3+iA6SI=;
 b=SFPkz0m/+6LMNe2Qz+ml9+Q9dnAi8AqKn0E1lFdT5lkHow5SdBJuZSKMyfKJbo0RBvhu2f
 a4GkQahU8hjcyhtIhoINslq2djv9xCTeYNT7bdl4qCvxaM+CyaiB1bOBnrW7UaCtCsrHJE
 UmwOQh8s27O3RaD0EEkpkM6GiztiQdSFb+Mx5OcCB+7xoVseiBrvGQKqBLuuh4GFvrrqiG
 42RKgcW9h7Ha1MhANmInsOaCpR4CCAeHQ9uUKaT0Q6hO/ksbv2MsXz7HI1Ud3h6PgLMl4M
 +MRtfUkU/wKD1X034xbptD+hvQCje4un6mGlVZJkOCx0R0bqvvdFcFC0qDgE+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SFPkz0m/
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: bump version to
 2.29.0
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

On Tue, 12 Sep 2023 12:03:52 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  package/s390-tools/s390-tools.hash | 2 +-
>  package/s390-tools/s390-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
