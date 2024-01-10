Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1590C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 711B243727;
	Wed, 10 Jan 2024 21:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 711B243727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SyNymRMZ1Kl; Wed, 10 Jan 2024 21:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88593436D7;
	Wed, 10 Jan 2024 21:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88593436D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 565411BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DA2D43727
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA2D43727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voexRKbIAcq0 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:44:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5ACB400C1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5ACB400C1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1508C1C0003;
 Wed, 10 Jan 2024 21:44:29 +0000 (UTC)
Date: Wed, 10 Jan 2024 22:44:27 +0100
To: Matt Flax <flatmax@flatmax.com>
Message-ID: <20240110224427.3eb96995@windsurf>
In-Reply-To: <20230331030455.1356986-1-flatmax@flatmax.com>
References: <20230331030455.1356986-1-flatmax@flatmax.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704923070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bphcT6RQrNaODW//Z47EBo1YxKAgyBZIdH4CfUQ9Gk=;
 b=B8K5Eh3sxP/oyPNhnyz1N8tfpG0jSy8+AM4oWtQMcAsH7SCLtwXmQehtDRgmZreWvnfY/u
 VtvAXuNmQmgp8XAPRShjkqz5hEghGrJxw4jRZvok7I4RNykobP7zdsz9yJfo4q0hifN3Zk
 +LpKfy0PDAnEfnPxjTZh0lcj22Oeq8vjUbKhRh50NBtYE5oGAjrqcoaewz9xna4+GmEtWk
 BAkVWY8ylYEZ3X8kR6W5isTTFF8RhHW6SGH92RiMO+w+IpbUBpV4H+Edxkrm3rK5iDlkll
 w7orwWrXKfpRPwiOO1DUGrraJiSx3IxPR6Za/YiTrvWSFAGNagOOdd3IRssDBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B8K5Eh3s
Subject: Re: [Buildroot] [PATCH 1/1] package/jack2: Add example tools build
 option
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Matt,

On Fri, 31 Mar 2023 14:04:55 +1100
Matt Flax <flatmax@flatmax.com> wrote:

> +ifeq ($(BR2_PACKAGE_JACK2_TOOLS),y)
> +JACK2_CONF_OPTS += --example-tools=yes
> +else
> +JACK2_CONF_OPTS += --example-tools=no
> +endif

Sorry for the very long delay in getting back to you. I finally wanted
to apply and merge this patch, but unfortunately it doesn't seem to
work. I'm getting the following build failure:

waf: error: no such option: --example-tools

and indeed, I don't see --example-tools in the output of waf options. I
see that this is most likely not your fault, as this option has been
removed from jack2. According to their Changelog:

* 1.9.22 (2023-02-02)

  * The waf autooption ``--example-tools`` has been removed.

So presumably, the option existed when you implemented the patch, but a
follow-up version bump of jack2 in Buildroot made us use 1.9.22, and
therefore the option is no longer available.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
