Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FE3FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A522580C53;
	Sun, 30 Oct 2022 11:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A522580C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NXzVyxw4tiBK; Sun, 30 Oct 2022 11:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE2E80C3F;
	Sun, 30 Oct 2022 11:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE2E80C3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90EF11BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CADB812E2
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CADB812E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7kAGHvQyOgF for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:06:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79375812DF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79375812DF
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:06:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 39FDE60002;
 Sun, 30 Oct 2022 11:06:18 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:06:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120617.1faf349a@windsurf>
In-Reply-To: <20221029171948.232254-1-fontaine.fabrice@gmail.com>
References: <20221029171948.232254-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667127978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5UiR5C+vZP4BiQM3g/pCQFoUSl/FMfp0Z8oStvkv/w0=;
 b=iC0Q6IIz+uw/CpKHBdCOsYMdoVp/uFoGIY+Hq8s0xmAroNxDIf0EC6JlABrcMqflsKQAFK
 Lx6zRSX4ivgep3QwxbuxJutjo5VEKbVZ101LDjPaoieVGdq6ZVI3KVGnAwdGFR+KTntpeq
 G3n3GsrItKg6XMfuNE5LvYghDPeU/buDNWr7wnVCUislMX0H+BON8czHkUkxOO5118eEAh
 aL/nfUCL/obhMt02PHMlFpstYlLQ32PmfC9kAC9FG5ZVsdCiOCmPw4WVw0ZOwZUZKTWvp3
 Tw+fVjGTn509aIjERsmcPWUp0Z5Br/C0dFBvkAhTHndJl02kM10zclLkDlaEQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iC0Q6IIz
Subject: Re: [Buildroot] [PATCH 1/1] package/pps-tools: bump to version 1.0.3
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

On Sat, 29 Oct 2022 19:19:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/ago/pps-tools is redirecting to
> https://github.com/redlab-i/pps-tools
> 
> https://github.com/redlab-i/pps-tools/compare/e2b25049df9a4da28168b7378016f1650d0dfa6b...v1.0.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pps-tools/Config.in      | 2 +-
>  package/pps-tools/pps-tools.hash | 2 +-
>  package/pps-tools/pps-tools.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

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
