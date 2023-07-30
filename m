Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD014C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9953F60BA7;
	Sun, 30 Jul 2023 10:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9953F60BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9anvrWAfcnVP; Sun, 30 Jul 2023 10:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D900260AFF;
	Sun, 30 Jul 2023 10:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D900260AFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE0DD1BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B46FE817B5
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B46FE817B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ksydwaTgWTTD for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:36:21 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5E7D817EB
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5E7D817EB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52E4BE0004;
 Sun, 30 Jul 2023 10:36:18 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:36:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230730123617.3d22a205@windsurf>
In-Reply-To: <20230706105347.229550-1-dario.binacchi@amarulasolutions.com>
References: <20230706105347.229550-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690713379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTYBBHdb6HwaG0D+dtS1cNPYtBp3LibtSkSfnE46gYs=;
 b=Ct+3feR19WdLvKN7UVedPoZx/I0gPSkOJs89+TI0A7LeCpX/YBsp6pJImoSc79gPNTSoVj
 QNblORHvibtiL5ws5SNlewLZ4+Gi2ilUWT1X2h1LBrN4eWGbKorlId7lRYICeJbLPnsAw4
 JP8xVXi2I6iw+vAJMU2j2o2WcrBnomw5f6Rqelcr6/Pn55ge0mzdeSKzn7IY0ypfiC3Wuk
 jPMLQKS0Udi20HIEUeGH2Z6ImUkQ3nXqJE6UFqEhYqV7RpzoSkYSRX1BZvgI9nAFr+1QUh
 AdHrdH1q5pu+mS7076QiTgPri4Pzdjk8WHqP869MO2ARr5SDeX8VC3RCY02jow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ct+3feR1
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2/readme.txt:
 fix typo
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  6 Jul 2023 12:53:47 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> It was a leftover from the copy-and-paste of the readme.txt file of its
> almost twin sister BSH SMM S2 PRO.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  board/bsh/imx8mn-bsh-smm-s2/readme.txt | 2 +-
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
