Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A91C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 12:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD1D540376;
	Sun, 12 Mar 2023 12:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD1D540376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38o6JxLFrR92; Sun, 12 Mar 2023 12:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4E32403B7;
	Sun, 12 Mar 2023 12:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E32403B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 221F91BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3A80403A4
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3A80403A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPo8xTkzNKsL for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 12:36:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB7E540376
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB7E540376
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 12:36:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC3E6100003;
 Sun, 12 Mar 2023 12:36:32 +0000 (UTC)
Date: Sun, 12 Mar 2023 13:36:31 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230312133631.3aaf0dfd@windsurf>
In-Reply-To: <20230301092253.3104485-1-angelo@amarulasolutions.com>
References: <20230301092253.3104485-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678624592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbpZ78DxmYlzfHrZmBwz9zAq0qSKOtrz+zhmyYfeJRg=;
 b=mwr4j0Ma8piNwwTCAzfVZu7Cp1pKMaP2ZEWlMOwe0fTLKE5GzkRU38tnnUdD0VEnFbs3J3
 MH62vE+vJ1nsHmCNW7HO31y1kZQZEyzMhDDNblprRdCDPTZtA2a1wWNu21eC6uXdqiEk7B
 Kvu9a5waSCHbriUT+CBphW93WXNGS6D1P8Wqa6d+GAzmf6uVjVdmfKopbBI8vqDg9cWzHz
 Uei6wY0qTJ0hLzr3ZbnW2xFcidozU53Ml/lxTiPUJlev2KTHYBpMh/3bZBWfkc5dgOr4OE
 LlXwNOu07YPYNkjiLaz1m92ynVys0Abgt+qMnc8ub4+cUchyrDZAv8vQg76SWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mwr4j0Ma
Subject: Re: [Buildroot] [PATCH] package/htpdate: bump to version 1.3.7
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

On Wed,  1 Mar 2023 10:22:53 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/htpdate/htpdate.hash | 2 +-
>  package/htpdate/htpdate.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
