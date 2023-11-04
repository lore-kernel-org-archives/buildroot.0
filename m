Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD62EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86CE482342;
	Sat,  4 Nov 2023 14:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86CE482342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvWiqYg7c98t; Sat,  4 Nov 2023 14:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B887E82361;
	Sat,  4 Nov 2023 14:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B887E82361
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9331BF37C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 126928232D
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 126928232D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwVDl4Jed5uY for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:23:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C197882329
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C197882329
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0152B20002;
 Sat,  4 Nov 2023 14:23:49 +0000 (UTC)
Date: Sat, 4 Nov 2023 15:23:49 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231104152349.67ffb55c@windsurf>
In-Reply-To: <20231011092250.3739529-1-adam.duskett@amarulasolutions.com>
References: <20231011092250.3739529-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699107830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dlYq3jAEYNSsfZEVPjCG7C4Yz2Z5os5fs+XWh8PE4bw=;
 b=afpj5fsV5iWZgbxAGbqVNlG0bTGmV59OjEnYFwIGaQJFexnwxzAoykZ+EaLIIzLh6kspea
 eJeR/DlYvWlmawzJDn8ndKqg5uUwx30mN7jjTIn5k9GjE0BxS4JvK20NPkBG86xPWlDxgB
 1Q8fP6KZ+qr/zL/lW6o9CLkAIdajtf5gLMw8J0B+TM+qkfv9/hF/DQ4QjlQnVJCVVxvzDI
 x9OJQOPJtJVIr7xSndeJlgc1CKp7A+3GX4/jcJeve8ZSsAog+Hh/KLsIeBVejrU4yvAaBZ
 n5mJMn+/6vOAuDJfkIEl5W8/E3ghfyWTMhOdAXggN+NaVmwNZyMO9dgMz9KHDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=afpj5fsV
Subject: Re: [Buildroot] [PATCH 1/2] package/firewalld: enable missing
 kernel config options
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

On Wed, 11 Oct 2023 11:22:49 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Firewalld requires IPV6 to function. We also should enable the
> other dependencies such as networking support to ensure all other
> options in the giant list of kernel config options are selected
> properly.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/firewalld/firewalld.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
