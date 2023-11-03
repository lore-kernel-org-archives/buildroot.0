Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE90DC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 811F54042B;
	Fri,  3 Nov 2023 19:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 811F54042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhlzeRhDnenA; Fri,  3 Nov 2023 19:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9FCB40463;
	Fri,  3 Nov 2023 19:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9FCB40463
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED24C1BF357
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6428822BC
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6428822BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0Gnv3R5RXOA for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:54:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C725822BA
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C725822BA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FA9A4000A;
 Fri,  3 Nov 2023 19:54:21 +0000 (UTC)
Date: Fri, 3 Nov 2023 20:54:20 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103205420.7fd947b3@windsurf>
In-Reply-To: <20231103173645.2069295-1-fontaine.fabrice@gmail.com>
References: <20231103173645.2069295-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699041261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lB2ScSqPB5L/71pqIk3e2gANfhauuVXGzTFgAu05n3c=;
 b=KoEc9KS9V8t/PLT9GxnDh7f8li4N7vq3W3N/nj7uj19ANw31furOAHQqaNSRHacADKu/Pg
 S/mscnf35CY51j0Yp5twVxWU4BuoWmNrR5GL5WRK1ruIyw32TsGj6ctRB+tS5x8kx62Mrs
 qBS1gT9Dr5rl3EKY4u6ZRuRelem2uu5Ke7E3kOdUlsG6QwjG21FX98Zt9eIuTBVJtMCHNF
 t+Nx6KUpj6tRBYcfCSngQWVN1LXHExorrViFzG0vTpQCxJ817zTkGpgfw2PH+iN+CDr4tR
 ZPRlkUsOPQkLA+cyTEBkrF9+O/baeJYDNtji+t2mbKyMswdWfvIlQWeTupaKkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KoEc9KS9
Subject: Re: [Buildroot] [PATCH 1/1] package/azure-iot-sdk: fix static build
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  3 Nov 2023 18:36:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable provisioning client when building statically to avoid the
> following build failure raised since bump to version LTS_01_2022_Ref01
> in commit 06bb3640c13191f7515f2140c2207f5b7a2cb7ab and
> https://github.com/Azure/azure-iot-sdk-c/commit/1de399fd4875d16eb78e8193778238b9762ed44f
> which enabled provisioning client by default:
> 
> /home/buildroot/autobuild/instance-3/output-1/build/azure-iot-sdk-c-LTS_01_2023_Ref02/provisioning_client/deps/utpm/src/tpm_comm_linux.c:13:10: fatal error: dlfcn.h: No such file or directory
>    13 | #include <dlfcn.h>
>       |          ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/894188649f66d9917e1ed94989ebe307102ab28c
>  - http://autobuild.buildroot.org/results/735b96c842796f309c33a0545eeb2e8f8d1f75ca
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

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
