Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F23DC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 11:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C05B416C9;
	Sat, 13 Aug 2022 11:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C05B416C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3oILAy-1DcL; Sat, 13 Aug 2022 11:04:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE2B4161B;
	Sat, 13 Aug 2022 11:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE2B4161B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE4E41BF3A8
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97012404DF
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97012404DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_No_xWuddNY for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 11:04:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FE2C402E5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FE2C402E5
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 11:04:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ADA361BF204;
 Sat, 13 Aug 2022 11:04:22 +0000 (UTC)
Date: Sat, 13 Aug 2022 13:04:21 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220813130421.37bef91a@windsurf>
In-Reply-To: <20220812205623.175869-1-fontaine.fabrice@gmail.com>
References: <20220812205623.175869-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660388663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oLFRzOwwVusQpaFgNJ2FzCQCwtT8WBj4W9wyYC2DW8=;
 b=bwoy5Kao1ocRvdi9MPf9PKVr0L4ySoiUAF/E1YHRAqIVC1xtqTzTlqheSlV1BOcLoGfgLN
 6dQASJjwyZXt991H5U5LJT+OcuRStv/J+9o1+qO1WMdsO3oNIed/vSMBLX8ZhXhAFOQef9
 XJf+cc5G0U2QP7EcTVcld/UEJW+LLTfGJ6QF1H1GRYju/WIrsyM/F0t5GccCPVUSvaM255
 BoUAkhX8IB7HjrDIS8t3TjlCR+2KaGwNABV0RO6reeZagihCBpl+D81IF0KTLtgGjKebJZ
 iajvvIXwocIUKAxk7Un4xtiMy136cScqOoBXdwkio9GbDRjCIW0Su/ciIFOWZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bwoy5Kao
Subject: Re: [Buildroot] [PATCH 1/1] package/jack2: add host-pkgconf
 dependency
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

Hello,

On Fri, 12 Aug 2022 22:56:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure:
> 
> Checking for program 'pkg-config'        : not found
> The above check failed, but the checkee is required for --alsa.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cbdc251980f5571f75281202ebffc04ddecbf28d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Why is this suddenly happening? Since then it is needed? As usual, we
need to understand since when a particular issue occurs, so that we
have some information on whether the patch needs to be backported to
our maintenance branches or not.

Could you have a look?

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
