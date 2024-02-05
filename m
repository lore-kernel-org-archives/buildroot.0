Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0BAC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E378841B54;
	Mon,  5 Feb 2024 15:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E378841B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sk6Xurh_PdCa; Mon,  5 Feb 2024 15:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AA0241A7B;
	Mon,  5 Feb 2024 15:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AA0241A7B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D3741BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2805840B26
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2805840B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKkZrfWNGd6x for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:13:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD25040A49
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD25040A49
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39096C000E;
 Mon,  5 Feb 2024 15:13:08 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:13:07 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240205161307.0e653997@windsurf>
In-Reply-To: <20240117201157.51827-1-ju.o@free.fr>
References: <20240117201157.51827-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707145988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGVCes4hqYBdopnPkR5I+ekCl9Gv7O0FC4llKPUQKK8=;
 b=h1mOIxvMCENmfmBWB3fzFloaDteL4Qt6HEP7aTYLmPMZ3RW7DiW1SBwb1BgoLMlQpoA8I6
 ZVLlM5YzfBFB69xrILGUdMq2EZYZfAUW8LMduRhJ02kEIi8qyHik+1AorRXvvbxlh1dILx
 4SNggXtnIgocyc/k2mVg8LyQFp8kuf7HIMO6oR7cYlnNzGimvXweqR1tB5UBxgS6b5Bz/S
 bmbb/9O6MgvTsKV7idGQtZ9mSN8t+Trg+u11jNmfikBb6tmEQic4T7e17ZMoDIjU1NC0BI
 YvPv3CUieS55QKMH4NuekF3hL6yuPUTDCj3osCfOAjc+X/++NXy6HkgP7jspew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h1mOIxvM
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add pciutils runtime
 test
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

On Wed, 17 Jan 2024 21:11:57 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit b200632 with commands:

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
