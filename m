Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5860CC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 07:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA74061129;
	Sun, 24 Jul 2022 07:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA74061129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ExTf3OmC6BKI; Sun, 24 Jul 2022 07:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBE3261126;
	Sun, 24 Jul 2022 07:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBE3261126
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A28B51BF578
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BC1D416B4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC1D416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OULestUdpflS for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 07:40:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BAF5416AF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BAF5416AF
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:40:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CB72F20004;
 Sun, 24 Jul 2022 07:40:43 +0000 (UTC)
Date: Sun, 24 Jul 2022 09:40:42 +0200
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <20220724094042.769e29af@windsurf>
In-Reply-To: <20220509190650.1348657-1-gsmecher@threespeedlogic.com>
References: <20220509190650.1348657-1-gsmecher@threespeedlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658648444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xl7hdSeBLcgS933J+vX2LTZvOqPAFMCcvEPmkjXDLKw=;
 b=QkewdGQsW87AZRZNCYn0n8bIH8POFcGcBmS1baMrzC+f+w0YULQ5CzMMQF8RMOJLF3Ycg3
 x5n2Rz8/jIIUloBbJvdpwCgl/wWyNf+XFc11xCl28f0SZCzPFJTsF87V7mfjz6SpN4XQFH
 kxUJ8e/94ntHn/jrgzH9m7Jl0biuTAC/FMhO4KUXqYXTXo8risUeHMB7GvNjrSG9dDe++K
 +je5XZMbGzaxQiUWWzIcBVAbrHrw2KTa6RzezUfxzH7svPFNVbXrnXUen46XgPJpVIbmtU
 bXfA/QW3yn3eiQ2OodUw8004PwLrhAt/mJR9xPM7uh/BPS8+qn1m1C6Qv7zyoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QkewdGQs
Subject: Re: [Buildroot] [PATCH 1/2] package/python-orjson: bump version to
 3.6.8.
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

On Mon,  9 May 2022 12:06:49 -0700
Graeme Smecher <gsmecher@threespeedlogic.com> wrote:

> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> ---
>  package/python-orjson/python-orjson.hash | 2 +-
>  package/python-orjson/python-orjson.mk   | 2 +-
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
