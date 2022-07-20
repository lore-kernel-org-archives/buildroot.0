Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9142C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BEDA81AC1;
	Wed, 20 Jul 2022 16:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BEDA81AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWk6WMxzl-j5; Wed, 20 Jul 2022 16:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68DB1818C0;
	Wed, 20 Jul 2022 16:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68DB1818C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B60A1BF352
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 636EF60AAA
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 636EF60AAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEYjrdhKZwZE for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:40:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F00E60B43
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F00E60B43
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 16:40:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 21C811C0003;
 Wed, 20 Jul 2022 16:40:07 +0000 (UTC)
Date: Wed, 20 Jul 2022 18:40:06 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20220720184006.51fe6bbb@windsurf>
In-Reply-To: <bc4534b95dda219e91bd9b0de2ed758711bf53d3.1658328570.git.baruch@tkos.co.il>
References: <bc4534b95dda219e91bd9b0de2ed758711bf53d3.1658328570.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658335207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mx+rEsJDDzQXQJZ8HMp8F4yCf7s4NHwWfCsOwX3gBro=;
 b=PaYXRhXJZy2TYs49ssl/AzJMHypj/tiKe5NGYcfrgCg2Y0vT88uj1HnY1ocGkxAof5sJvq
 HIbVOROOBGri0gBv4Y9oVSeq2D1rZjptmFHCUHPQ2zTcfEPqFGQVaEcI+pGlhFQH5x8nF/
 WgSmSD9hbs9/JLg2lztPPbk5Knok67f+RVAY/EF7lnG2iksxbGsx3sLnSUuWO7q7tZD3f3
 9iVnwDAR1qBmtij83/sjLa17i619Lb5FZL8R+SM9CUu2FY/WW4UOAXFeaKY+GvDqHTa+Ey
 D+bWSV3gZCLHpoRYjD1QsBDUD0MdwNauVhBMsDXoZjue7gA+Xg4CwRwKBaHOKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PaYXRhXJ
Subject: Re: [Buildroot] [PATCH] package/cjson: add option to build
 cJSON_Utils
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Jul 2022 17:49:30 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> cJSON_Utils adds support for a few additional JSON RFCs. The size
> increase is small (around 12K for ARM32), but it is more than half the
> size of cJSON itself. So add a separate config option for cJSON_Utils.
> 
> Cc: Danomi Manchego <danomimanchego123@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/cjson/Config.in | 10 ++++++++++
>  package/cjson/cjson.mk  |  6 ++++++
>  2 files changed, 16 insertions(+)

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
