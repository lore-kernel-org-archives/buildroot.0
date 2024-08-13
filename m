Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B8CC52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 18:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4AE404D8;
	Tue, 13 Aug 2024 18:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIf9C3WgQvMH; Tue, 13 Aug 2024 18:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8FC840574
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FC840574;
	Tue, 13 Aug 2024 18:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DB2C1BF343
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 18:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10C6240574
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 18:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhXYeAMqQ9Q3 for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 18:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CB66404D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB66404D8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CB66404D8
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 18:25:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ECC940004;
 Tue, 13 Aug 2024 18:25:31 +0000 (UTC)
Date: Tue, 13 Aug 2024 20:25:30 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240813202530.4189cd25@windsurf>
In-Reply-To: <ZrsJ8SVroNPEWSXC@waldemar-brodkorb.de>
References: <ZrhLQMty5kRy7Oo4@waldemar-brodkorb.de>
 <20240812221448.40e4d87a@windsurf>
 <ZrsED1PkoKznI94O@waldemar-brodkorb.de>
 <20240813091927.32682ebe@windsurf>
 <ZrsJ8SVroNPEWSXC@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723573531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2k1/rhVIJ2o0h7hYX355392xdJKTrneKdxhr7nuM6c=;
 b=PM+hEC+qf5j3HwPWFba8c/mZdEm38CmfeNzlq3hh+jvY7DZVCdSvvdMzITp46UQE0ak7tr
 zpX8eJjyRJ5FERgSgc1VC94H1uGFKCcExDlqblKO7nyIKAviXXUDvUZ3wbXobcTo8nPa5F
 LuKz5TNVgDH2XsXskg/MTAcofpb/wxPUFjjFg+QY02pAsK4OR4qqJg++TdtWvEPOGewHLY
 mBcPew7qf8Kv1a3w+CUHoWSGzl0cgjyqqgdWAAI187TpUuIhOjtmEaeCjG+5u698a9yrUO
 2+KXMfHMhCQ9AQ9faVNZ8GKokxPLX5gq9sayZ1vTXCgSWT6Xk6k8xgzeV30yPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PM+hEC+q
Subject: Re: [Buildroot] [PATCH next] package/hiawatha: update to 11.6
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

Hello Waldemar,

On Tue, 13 Aug 2024 09:23:29 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> > Would be OK for me. However, if upstream is not active anymore, should
> > we drop the package instead?  
> 
> He is still doing releases and added TLS 1.3 support recently.
> I would like to update it and keep the package. I can sent him an
> email to report the issue with TLS off and see what he says.

Then please report the issue with building without TLS support,
hopefully the maintainer will be interested in fixing what really is a
regression.

> Would you like two patches, one with URL updates for master and
> the update and TLS removal for next?

URL updates for master, for sure.

TLS removal, I would like to wait for the maintainer feedback. I'd
prefer to see it fixed instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
