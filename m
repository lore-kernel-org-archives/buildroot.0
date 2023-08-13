Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475E3EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 22:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3A0640488;
	Sun, 13 Aug 2023 22:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3A0640488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4Y6WWB14LJC; Sun, 13 Aug 2023 22:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5118A40499;
	Sun, 13 Aug 2023 22:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5118A40499
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 543A41BF869
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 22:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00CA3814A1
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 22:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00CA3814A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjyI7R99JV70 for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 22:00:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB95A8149C
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 22:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB95A8149C
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD209E0005;
 Sun, 13 Aug 2023 22:00:35 +0000 (UTC)
Date: Mon, 14 Aug 2023 00:00:34 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230814000034.35275fc0@windsurf>
In-Reply-To: <20230604025204.324443-1-aduskett@gmail.com>
References: <20230604025204.324443-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691964036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ei03V9rK90VavJtaMefJgKPk6olUNOWoJ4IgfNy/W4o=;
 b=h+QaWBffCmYLjxn+H0LHn/+PGNZd1pjo2m2DV2KpcrSEv840QiUcv/rQETrlnody61Koob
 EwvzpZtyJrmMbTs1KfRvVK31wP0M8XFHrprsBLg0NHFL4EvC9k3ZA3eNZArQO4Rn0Ib9hM
 vwB1itLLa1frFjISG0DsUuv9h0RbnpSKNvw0RBpUDz+vvB4sArd4bjOIFhJkNoIKxj+gOM
 kC2qwd/hIMF+hGsOIAcrv6QQtQPGjmiWfjR6F9beoc7vRGAih6GB+xzuVV5hIsipYP+fQB
 0Gb7mVJopTeJKlUP8lIQbXngRV98PnEO5AS76slYsVPbQ9KMuYkimEPCCF4PPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h+QaWBff
Subject: Re: [Buildroot] [PATCH v2 1/1] package/firewalld: new package
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Jun 2023 19:52:04 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Firewalld provides a dynamically managed firewall with
> support for network or firewall zones to define the trust level of network
> connections or interfaces.

One thing that would be really nice as a follow-up patch would be a
test case for the runtime test infrastructure. This is especially
relevant as it is Python based, so it is easy to miss runtime
dependencies that might be needed. I've added Julien Olivain in Cc, who
can provide guidance on that, as he has probably written some of the
most complex/elaborate test cases we gave in our runtime infrastructure.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
