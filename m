Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF91C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 18:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2844252E;
	Tue, 26 Jul 2022 18:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F2844252E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWCy20ZgwDJI; Tue, 26 Jul 2022 18:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2577542525;
	Tue, 26 Jul 2022 18:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2577542525
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CCDB1BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E356847A5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E356847A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7R5__qyGYET for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 18:41:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69602846F5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69602846F5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 18:41:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33A261BF204;
 Tue, 26 Jul 2022 18:41:27 +0000 (UTC)
Date: Tue, 26 Jul 2022 20:41:25 +0200
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20220726204125.014eb8a2@windsurf>
In-Reply-To: <20220208162409.496110-1-gwenj@trabucayre.com>
References: <20220208162409.496110-1-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658860887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46olwzFNhh8hORK/WKjkn0sVfJQpyDyxkl5ljvZhwi8=;
 b=p5Ag4B0X3nZKRaozB28lWlhnUERibt+BeOAOHdKr+0TNDX17xwUhJ/+XC4+ipmMpW4+OEi
 VAar6QP9ee8852w8JQ1xPgcxL8xROETkvFkHfFr5Ja4BTbBPeWYIFSU8q8oLZQeb0zM48P
 FiFdBmpLcheecYYcwWLfyIx7zE30wrNV60DZPu5RzGbqFj+J37TXAjpcF86l6Ul533sFI1
 nA1eTqp1XvGTIEBMgadzCNu6RGEBJJZ6EXhw1HBcmVhevBpR8ULbfh/WBUOT7pIY2ZK69C
 YsnSqGaFfBpszVSMmp+5maRQPSBeUJYE4AuMV6E2VCPo33UMxRniQEv8/vkplQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p5Ag4B0X
Subject: Re: [Buildroot] [PATCH 1/2] package/volk: new package
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Feb 2022 17:24:08 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> VOLK is the Vector-Optimized Library of Kernels
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/volk/Config.in | 31 +++++++++++++++++++++++++++++++
>  package/volk/volk.hash |  3 +++
>  package/volk/volk.mk   | 39 +++++++++++++++++++++++++++++++++++++++
>  5 files changed, 75 insertions(+)
>  create mode 100644 package/volk/Config.in
>  create mode 100644 package/volk/volk.hash
>  create mode 100644 package/volk/volk.mk

I've updated to version 2.5.1, switched to the .tar.xz tarball, added
COPYING-LGPL as a license file, added a missing
BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS dependency, and
applied.

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
