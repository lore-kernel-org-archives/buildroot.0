Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC12CE77375
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BFC083D9A;
	Sat, 30 Sep 2023 14:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BFC083D9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWV4DlQ7F1dG; Sat, 30 Sep 2023 14:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47DED83CAF;
	Sat, 30 Sep 2023 14:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47DED83CAF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64D3C1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F66460F62
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F66460F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MY1lQtc4BQcJ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:39:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D18C460B29
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D18C460B29
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDBB040003;
 Sat, 30 Sep 2023 14:39:28 +0000 (UTC)
Date: Sat, 30 Sep 2023 16:39:28 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230930163928.43709e71@windsurf>
In-Reply-To: <20230930125533.906284-1-james.hilliard1@gmail.com>
References: <20230930125533.906284-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696084769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBXLW7zoJIT+9HIFkCYr1ceNsmvIPsfWcycEHxOeifA=;
 b=CH5ofGj7rUpzJwYNwfMAMBFHXg1LwDEN/Qm/sqvsLAZiMZJf5Wj0sA2uPJQuKdT0yO51s/
 gUNAB5GM1jCUSJzA1OPRx96qw8m6EDB/bIMq2ozu6zGVLkqZO7a1av030rVARWRnhKDK1f
 OZKPhWuQxx/xY1ZWcZRlCfV2qzxMerbmbf/+jlnh9GnKhTcFjwSLGGjM6JweQ1nQddpjHc
 mMERS6QO6T5AaygHyk72A4vbNZykulGttIfv+SHCEcxU3pKo5tDom2zIRCjIDfQxGZo++h
 clLr/lu2Zdf5Y+yV+UQoBy6lkW5stl4IfbnYS2IreEsgowRC+tiCJYCKtJ1KPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CH5ofGj7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to
 version 1.0.3
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

On Sat, 30 Sep 2023 06:55:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pypa-build/python-pypa-build.hash | 4 ++--
>  package/python-pypa-build/python-pypa-build.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
