Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B181DC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 229C260BC6;
	Sun, 14 Aug 2022 12:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 229C260BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VFQ45Q4vi10V; Sun, 14 Aug 2022 12:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46AA060BB5;
	Sun, 14 Aug 2022 12:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46AA060BB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77A751BF364
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44630410D0
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44630410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tNJMmttfKLN for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:30:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1414410CB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1414410CB
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 12:30:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 907E560004;
 Sun, 14 Aug 2022 12:30:29 +0000 (UTC)
Date: Sun, 14 Aug 2022 14:30:27 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814143027.49944cb1@windsurf>
In-Reply-To: <20220813194142.2389181-1-fontaine.fabrice@gmail.com>
References: <20220813194142.2389181-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660480229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTXVkBNIkgkHeLWaAotyVaUhJJcMfcr4WvQXYzL0qzw=;
 b=X2pSZlOa5BF5Hc0AXfsrOb573PuuE2akSaQuA2m8XzDA67/itXsspJ/AXISfHrZox93NXv
 8mvWzBFbLyDljye0qrpw5AnT1Ngji3L1LaJqGcK5b6Fx38BoK+1Od5Luy/BdjQkMe0hVV2
 TxqA0kaXr7gahJLumKIT0Lk1Fpr3nRqkDfc3usoX/UuowuEXgM+zaku9RMu9lgLz8AkblH
 3aEIYHFVI17jF2/8aRWDxHjsmB3JFjz8edgKh/4AYQpMPEZ8lqP8HDxrqyamUI9S9Y94QE
 hzmBrUrA8A2C2lMM79ehPekeIpg099x0Od4SSlJ4RSEBBELkvzPbJAHoxxKP5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X2pSZlOa
Subject: Re: [Buildroot] [PATCH 1/1] package/domoticz: needs minizip-zlib
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

On Sat, 13 Aug 2022 21:41:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit fdd6fe927b8f2d99dbd0a5f5c58b92430d20e1be wrongly added minizip
> dependency instead of minizip-zlib
> 
> Makefile:575: *** minizip is in the dependency chain of domoticz that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c51bed081b9ef9ecca809810cb41e1474d8fd9ef
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/domoticz/domoticz.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
