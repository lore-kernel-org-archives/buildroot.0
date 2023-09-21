Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4EEE71060
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 12:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54F9983C32;
	Thu, 21 Sep 2023 12:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54F9983C32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YI3bvVDCrtEx; Thu, 21 Sep 2023 12:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 964CA83BE2;
	Thu, 21 Sep 2023 12:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 964CA83BE2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D96121BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2A62409BD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2A62409BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rB3WuQMlELso for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 12:52:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 972C04002B
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 972C04002B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C91A1C0006;
 Thu, 21 Sep 2023 12:52:15 +0000 (UTC)
Date: Thu, 21 Sep 2023 14:52:14 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230921145214.5ec2846c@windsurf>
In-Reply-To: <20230919153708.2804432-1-angelo@amarulasolutions.com>
References: <20230919153708.2804432-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695300735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i23njtjHrBtVN2+4IbyyI39R1RJJjIRPGYyCf+oy5Zg=;
 b=HXNCvBq8hG5rSdQ9yRtIqHLqzm4X2DWfhWJ8S4ncqHIyLLvZtMn0v3tmN7NAveXztXHRT5
 G112UK1VQ+f/cNqi3AaFcCFvbF/IcZjz/c3NJyJyTzVlWFKJ+9leBQ98jY9Q/3SOeaPLvR
 Z++kbl25i7pZdq0LRA8bq6JvWWuhg6Iyt3IKzhni96gFlo79an+khxxyd1IuUBmIXk7stt
 FpAhoKcwv/2Q745N/C8ETCj591/zOLC8EGLY80qggg9v3e3uqyHu73MHz31zMGbENQKJ1C
 57TMuJUlQpntyodHTNToHMPV+NMQFfn3G2pkkPvaS0Jj3CY9j3AwO+nwvf5SXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HXNCvBq8
Subject: Re: [Buildroot] [PATCH] package/python-web2py: bump to version
 2.24.1
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

On Tue, 19 Sep 2023 17:37:08 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/python-web2py/python-web2py.hash | 2 +-
>  package/python-web2py/python-web2py.mk   | 2 +-
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
