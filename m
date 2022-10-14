Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B15C433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 21:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AB3825D3;
	Fri, 14 Oct 2022 21:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5AB3825D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoOLIEingDyz; Fri, 14 Oct 2022 21:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3D3B8254A;
	Fri, 14 Oct 2022 21:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3D3B8254A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A081B1BF300
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B22B60B5C
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B22B60B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zf5Ghx50Lkmx for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 21:14:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19EC660B46
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19EC660B46
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 21:14:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DFB3E240004;
 Fri, 14 Oct 2022 21:14:23 +0000 (UTC)
Date: Fri, 14 Oct 2022 23:14:22 +0200
To: Rufus Segar <rhs@riseup.net>
Message-ID: <20221014231422.652a2ef6@windsurf>
In-Reply-To: <20220507161338.2125859-2-rhs@riseup.net>
References: <20220507161338.2125859-1-rhs@riseup.net>
 <20220507161338.2125859-2-rhs@riseup.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665782064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+GmtDg72yBrKU+OcGDDtBpwIfabiegZAWbYvfUpvDs=;
 b=a7YYpNrCDJjR2TqfnjNG+kZYGOWR6sXytY1iTMdneqIWRz3IL7fRUkgbkVqJcsDw6APi9F
 VgweUyUD1mZkI9ky8NRQZ0135x5kzq7lC5kdUipL4o2Lfl6iwyUe79Xb2u3T6hy7LH7dBZ
 mBJ3vFyk/brzHoVVBEr9+zjVRkD+1ESk4jE1VHaMv0X9vt6Hg0d1yf0JemYwczBiwFKD48
 VXYt/efcb9V6OSMJzEDJUawNE0MByuPBdq41D9fcdPt7FXUYzNn8ZR+7AlDQgcvF4J9AzL
 svuAyaJCY/g9LyOKuXUp8mciq1CvHVSnpfMNAoyTCOIo5hgA3CuCm67qpA4mIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a7YYpNrC
Subject: Re: [Buildroot] [PATCH 1/1] package: add kdmx target and host
 packages
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

Hello Rufus,

On Sat,  7 May 2022 17:13:38 +0100
Rufus Segar <rhs@riseup.net> wrote:

> Signed-off-by: Rufus Segar <rhs@riseup.net>
> ---
>  package/Config.in           |  1 +
>  package/Config.in.host      |  1 +
>  package/kdmx/Config.in      | 12 ++++++++++++
>  package/kdmx/Config.in.host | 12 ++++++++++++
>  package/kdmx/kdmx.mk        | 33 +++++++++++++++++++++++++++++++++
>  5 files changed, 59 insertions(+)
>  create mode 100644 package/kdmx/Config.in
>  create mode 100644 package/kdmx/Config.in.host
>  create mode 100644 package/kdmx/kdmx.mk

Thanks a lot for your proposal!

I'm a bit confused by the difference between agent-proxy and kdmx.
Could you clarify?

Also, kdmx is part of the agent-proxy code-base. So instead of being a
separate package in Buildroot, the existing agent-proxy package should
be extended to allow the build/installation or either agent-proxy or
kdmx, or both.

Could you have a look into this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
