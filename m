Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93E6C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7123F81EF6;
	Mon, 11 Sep 2023 19:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7123F81EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzc_xNneHsCA; Mon, 11 Sep 2023 19:52:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B307781EEC;
	Mon, 11 Sep 2023 19:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B307781EEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 531791BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F4DC60F1B
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4DC60F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CyoSZU8wHbVM for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:52:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 051F360672
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 051F360672
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B63960005;
 Mon, 11 Sep 2023 19:52:31 +0000 (UTC)
Date: Mon, 11 Sep 2023 21:52:29 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230911215229.263f0748@windsurf>
In-Reply-To: <20230911131714.705-1-ps.report@gmx.net>
References: <20230911131714.705-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694461969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C21NfyuNKnGFHhb19brl5axo2RucrgaYjAopPA2VHzU=;
 b=h9wiXLqRAeqR4lbTvd+Tre8hXOLlUQzg3lPOYHhAo5JKhZo9Z6A4/BAqnJumahl8FjpEVM
 CwHxshfeYqCzP0quOKgrfXSbHr6ttF+1uuCprV4YpyEvC+z75nu2PgT/7mJsvjyaSVvoEK
 GPA6RUiKKqMvenSGZIouQCoeKscEErErJKrv68n227lpKiMMcQL71LdyBOy0Ld1fkk8Isj
 nkhZHbON1r/9XmU9u3WZqQRKBz8seOGGw/tqUvFwLG2YT8PLBwbOzrKbRDI/H/meyxZUfS
 ILqgPgFVBG0nfw4aP/LYQ05qf0VwzwNVcVUQa9FAOg6t4jlfu0hRMksSc6DwDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h9wiXLqR
Subject: Re: [Buildroot] [PATCH v1] package/speechd: bump version to 0.11.5
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

On Mon, 11 Sep 2023 15:17:14 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - remove 0001-add-disable-doc.patch (upstream applied, see [1])
> 
> For details see [2].
> 
> [1] https://github.com/brailcom/speechd/commit/1dbc42684dcd3519fbc93da7e4164aa8dba8808f
> [2] https://github.com/brailcom/speechd/releases/tag/0.11.5
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/speechd/0001-add-disable-doc.patch | 78 ----------------------
>  package/speechd/speechd.hash               |  2 +-
>  package/speechd/speechd.mk                 |  2 +-
>  3 files changed, 2 insertions(+), 80 deletions(-)
>  delete mode 100644 package/speechd/0001-add-disable-doc.patch

You had forgotten to update the .checkpackageignore file, to remove the
patch that no longer needs to be ignored. I fixed that up when applying
to master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
