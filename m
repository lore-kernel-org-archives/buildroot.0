Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97818C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 407DB60A91;
	Sun, 11 Dec 2022 10:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 407DB60A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_-ssA9FcXfw; Sun, 11 Dec 2022 10:33:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8791360783;
	Sun, 11 Dec 2022 10:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8791360783
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4F591BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F5FC4092D
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F5FC4092D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGDaUau-fMuA for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:33:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FAAC4091E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FAAC4091E
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:33:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 80DAF240006;
 Sun, 11 Dec 2022 10:33:28 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:33:27 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211113327.6172fe39@windsurf>
In-Reply-To: <20221208212941.4134613-1-christian@paral.in>
References: <20221208212941.4134613-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670754808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzk++C46r/aSFZj4DsEN98+hpjWY2KL8rHvQb1VtE+A=;
 b=fgLjxZ3dqNfQMk6i3MqMVGIGi/ooPYKulYMtsd8g3qmtFYcHZ75XFWtJlPMPuL94qe+gcB
 /OqaMIU7qT+RP/SuP2RmhMgA3U6oX7uObCyXoviUZr82v6XukOL7EY/1CIeMEfLd+CKCx7
 5wbEqyL1Crt+QE5tRVjhZNX1bhTQPSwN3AehZCblTEkXrdyqgW10VyB2QZgBp5l9BDmjlE
 NtT00q/siDErT1V3Be3eFLG3kgkR3lEFmLxpphzh9OpTo54vbTxXC1Da6zzcjwDGoJ0iO9
 UcKqRtgD83BeVSAzmyVFeH5jmGussxNsUr1cs5v6eXc9tQ/3tY1ERlNy9wi5KQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fgLjxZ3d
Subject: Re: [Buildroot] [PATCH 1/1] package/delve: bump to version 1.20.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Dec 2022 13:29:41 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/go-delve/delve/blob/master/CHANGELOG.md#1200-2022-12-07
> https://github.com/go-delve/delve/releases/tag/v1.20.0
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/delve/delve.hash | 2 +-
>  package/delve/delve.mk   | 2 +-
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
