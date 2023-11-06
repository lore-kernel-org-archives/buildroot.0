Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D7BC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F076D417C9;
	Mon,  6 Nov 2023 22:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F076D417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7xdqwSSVwLv; Mon,  6 Nov 2023 22:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A2E541740;
	Mon,  6 Nov 2023 22:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A2E541740
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBA921BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1FDA414BD
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1FDA414BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGoUw8hE9ZjR for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:07:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73D08401CC
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73D08401CC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6611960005;
 Mon,  6 Nov 2023 22:07:24 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:07:23 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106230723.3158a1cb@windsurf>
In-Reply-To: <20231105025144.2765963-1-james.hilliard1@gmail.com>
References: <20231105025144.2765963-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699308444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4yPoSqnM8IQ6Qnxmk10cCjkg6j9m0FucBEzHXQr2Is=;
 b=N88wJ7j07d+VCGeNjSVQJCCYgS2AgJFcb8cDHAVesYOj55ZLYJLB4YMgmopMbhL1638Yf+
 IbzcUyZtAZ348XUOmG7oa25d0aQ0kSuySKSJqZtbfojUzE8vhdxXlFQ6U+ExJcndJU2mTA
 LR8FbdG/9jz2ET4zcDH5L4I6ZmfpZlSaVkHJIZVgbqUJWh8nHY4XNN16GofZvBk3jxIlPL
 +MgVot4JUgdcX5EiWPwRWy3J9Jq1FGHZVrQkoBoDQ1yEezK/WggOh6N+BeaMhi3YxBv0vW
 +ekCL5DtJHG9awyaIe1rZBYSt31i32dQn14yXD5qCnJx5WTYhxNoprQ0B7HWuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N88wJ7j0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-chardet: bump to version
 5.2.0
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

On Sat,  4 Nov 2023 20:51:44 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-chardet/python-chardet.hash | 4 ++--
>  package/python-chardet/python-chardet.mk   | 4 ++--
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
