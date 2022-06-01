Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3791C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C2E860EE7;
	Wed,  1 Jun 2022 21:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLRWVKZTYYPb; Wed,  1 Jun 2022 21:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FCC60BC6;
	Wed,  1 Jun 2022 21:42:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FFC01BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C306400E7
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hvfn1nzcfWDV for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:42:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EF79400DD
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:42:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A950100009;
 Wed,  1 Jun 2022 21:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654119718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjHKfJIaUO4n+6CJ+bly6GJbWntK//xPg1CrswALzrA=;
 b=EoI3iqlkEQ9ue2T4aBA5dgt2vQ2yTn84RJsnaqW7hL9xPn8HDll1/fYTi7HB3JBPzEJZjq
 YiUe6flfrrLHs2dpFxoq2/AZRAeu2rhkXt0KRmiPJT8MD1TdCa4HYi+zHnloQXxz8mIhLE
 g+Eh/o26P1Rc06pKzp0o+0T1illpz2Cltkc3nkUcmhnHciiE+DCgIHjkEX9/Z2fp4FtUrO
 h8aHT1176/3x3KfYTu8BwBpESHkDK2B8QyFqpxtdeSgUhU0PekumxeET6yLso68y7bPd8A
 31urnKi9voR9e44q1hgLPW+a1idCEhqA+ctwodQCn4jhQk8DYFRBQ0R+LXxTdw==
Date: Wed, 1 Jun 2022 23:41:57 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220601234157.7df157ad@windsurf>
In-Reply-To: <20220531105902.204022-2-heiko.thiery@gmail.com>
References: <20220531105902.204022-1-heiko.thiery@gmail.com>
 <20220531105902.204022-2-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/4] package/nettle: add build support
 for host
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 12:59:00 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> v2: no change

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
