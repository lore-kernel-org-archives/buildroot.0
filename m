Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5244DC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF13F823AA;
	Mon,  1 Aug 2022 17:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF13F823AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Ds1Ni0_FIEI; Mon,  1 Aug 2022 17:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE2A481B14;
	Mon,  1 Aug 2022 17:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE2A481B14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA8B1BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 326B64047D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 326B64047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1i8n0x-9WJi for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:40:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1402B400F2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1402B400F2
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:40:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DA5821C0005;
 Mon,  1 Aug 2022 17:40:34 +0000 (UTC)
Date: Mon, 1 Aug 2022 19:40:33 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220801194033.0cb5457a@windsurf>
In-Reply-To: <20220727192948.18653-3-guillaume.bressaix@gmail.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
 <20220727192948.18653-3-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659375635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXUarBoF9SXsGxVkqoXyMQ/fQ0AvjADrDgkDKOHSSgs=;
 b=p5c9j6bXrQQIPGhkLEyaSxlWKsh0EHZVRqHe7zN44gjmQVYzfFxOllfMTDCw2Ok1OG7XhD
 tEWiav8v/5hAGnIhMZW1c7Pqybq6NqOHECQjK5GRNfRe1loBIahoGBLrm4jMsKiZsmAwJ+
 lhrGBFKrpoFQTQZrAO+HMO9voV/B3hB8ScSzjt8PTMpkkAHue/Ki/xrg1tRTiOtiEgUDu/
 2TQEMeV2ykh6SK0dXGz8cKiTvx5BaEVtjz7sOlMhkvHf9Vyxv6ycLXGcjz0XYlNNtm7p++
 J9zFRbak6QSrMULnm0NOhS7brfH6LevnHcG6o6MMWjLnNwyblPk28lMlFV5W8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p5c9j6bX
Subject: Re: [Buildroot] [PATCH v5 3/4] package/python-pythran: new
 host-only package
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
Cc: jmfriedt@femto-st.fr, gwen@trabucayre.com,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 21:29:47 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Generated with scanpypi and converted to host.
> 
> It is a dependency of python-scipy.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/python-pythran/python-pythran.hash |  6 ++++++
>  package/python-pythran/python-pythran.mk   | 19 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 package/python-pythran/python-pythran.hash
>  create mode 100644 package/python-pythran/python-pythran.mk

Applied to master with an entry in the DEVELOPERS file pointing to
Guillaume, assuming he is willing to maintain this package. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
