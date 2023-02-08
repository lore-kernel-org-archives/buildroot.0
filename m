Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68175C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9191610DC;
	Wed,  8 Feb 2023 11:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9191610DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CqvblJLwjBdR; Wed,  8 Feb 2023 11:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19224610C4;
	Wed,  8 Feb 2023 11:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19224610C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68C761BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4327D40BDE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4327D40BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8EfLkKD7IgfY for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:13:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D6BB40BD2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D6BB40BD2
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:13:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 663D124000B;
 Wed,  8 Feb 2023 11:13:47 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:13:46 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208121346.1d1318b0@windsurf>
In-Reply-To: <20230207171721.2973997-9-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-9-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkapPWT25kAOh5WB+JrcBVz86WTJlm4qACqbAj43asA=;
 b=OY5Z+eZyRkMREmws7CDIoRFz3Ui+CAdGi2btrLqfMSF5alfd4R3MboKSh3eUfxSrC33gaM
 JHmO7zXryRIrE8BHGM1tHL0hrPP6HNZw9jpczx5YWnx/noUsT++NpT76eWIfqyOZniKQyL
 eIAF+oKp2WZ/Vk7+Zn45PK+n50lE7TqNPJ/BHU9BlIfbUwkwduOxe7iF52czsUAPyfhAnN
 EUlmQNLVdNDHqF801xd44s+sNeE7ukEuTf+OgFDC2VgaNuyEZX0I4h6HYVk5rYBPTm3Udk
 19MzYoDY3KnrYhTmCOZsy6oWI34tqaRmQNf7b6/IfQe2Gauourf1YaEskfo1cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OY5Z+eZy
Subject: Re: [Buildroot] [PATCH v6 08/13] package/qt6/qt6base: add support
 for tslib
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 18:17:16 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Jesse Van Gavere <jesseevg@gmail.com>
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/qt6/qt6base/Config.in  | 6 ++++++
>  package/qt6/qt6base/qt6base.mk | 7 +++++++
>  2 files changed, 13 insertions(+)

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
