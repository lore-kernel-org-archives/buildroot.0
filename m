Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9790C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 801E260BD6;
	Mon, 15 Aug 2022 20:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 801E260BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jw2ByfUmT9tn; Mon, 15 Aug 2022 20:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D2460BB1;
	Mon, 15 Aug 2022 20:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D2460BB1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78FB71BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 615C681764
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 615C681764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEnrVhbMM0hO for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:21:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4257681761
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4257681761
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:21:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D8441C0005;
 Mon, 15 Aug 2022 20:21:54 +0000 (UTC)
Date: Mon, 15 Aug 2022 22:21:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815222152.292134b2@windsurf>
In-Reply-To: <20220814220241.203440-1-fontaine.fabrice@gmail.com>
References: <20220814220241.203440-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660594914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3IyRsbxrHK4wbVeDpQzJXYGORLlbOoIPApMgKfMonU=;
 b=TffGyG8zb5/GB37CZCXvPLSkvOvyNaOxsAGSfKKETXrXHyw685XLSGwOcPjaPiT4Mhgw6F
 jWCf9+K1neotRB6mWt3UktivAZKBHrYu3uKfLzB7YkC9PQL0l8IY9cQm5YIqZ4+R5rQkVl
 yjgFholSt/5F83JJuXDb2rJJXg+Abrvs5S3MMRStS7fMar/cPLCZ3w2uUYrtplaux2+ixH
 BFt9x4xtUJ+BeW1ZwXkUZ7Q9khzuYf9AMIcLFQ3vG6ohL1o8fU30P2Jf7Md6Rzw4Wir98w
 iqPo/TWTJTYDIvhFOQBgQP39exxwW5i2A0q7xhCC5Rcv4SrLMrmDW0Fp0sCRfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TffGyG8z
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: fix libkrb5
 build
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Aug 2022 00:02:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following libkrb5 build failure raised since the addition of the
> package in commit 736c4c1655d93652a9a7e79235bbe726b3d46176:
> 
> configure: error: in `/home/giuliobenetti/autobuild/run/instance-2/output-1/build/freeradius-server-3.2.0/src/modules/rlm_krb5':
> configure: error: cannot run test program while cross compiling
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3968d611458060480d341bd60f7c50209a0ace15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freeradius-server/freeradius-server.mk | 6 ++++++
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
