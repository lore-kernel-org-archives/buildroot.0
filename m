Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24B5C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B6CA60D78;
	Sat,  4 Nov 2023 20:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B6CA60D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ll_05oSQ8BXO; Sat,  4 Nov 2023 20:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA63460B8A;
	Sat,  4 Nov 2023 20:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA63460B8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D54C81BF5AE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEB45416CD
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEB45416CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9pzquk4GfO7 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:50:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 990634154D
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 990634154D
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBA1B1C0009;
 Sat,  4 Nov 2023 20:50:20 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:50:19 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104215019.26617084@windsurf>
In-Reply-To: <20231002165345.346937-1-fontaine.fabrice@gmail.com>
References: <20231002165345.346937-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699131021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HakBpAHljM0eWh1DgtHd7oWga77qTZduDOOPiUb7PbI=;
 b=C/BQ0fNIGQUaH3eAS/IbPdmM0mwtQttsyabEht3qWPUCfmzNlsmvauBtWLXpaSuGdkFBit
 COfmCFKvFjVjkHcXebgH5Lk2GMiFQVc0L6PRjLyLu4l1PO2gl1WG+95/SIGIvdiT95A3b0
 4L1CRlkK7pjrVcsTb0p8LnGGDCfj0Ubf5E+zEuVhunnz9Y2mUn9l612KU0WiM8BqnzWYhF
 8Ggv8hF9J75KAOvqWxgg82zgEhHrzXKpHMUIearFcnixxW+D+O4uY3EBasDtbvbS1Z736f
 XsjHQgg7pyxYXqZE/syaeI4HMa1JiWaRvEuNtK62ZoiONCCwNlYBxnDL+Os1VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C/BQ0fNI
Subject: Re: [Buildroot] [PATCH 1/1] package/libnvme: fix python build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Oct 2023 18:53:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the addition of the package
> in commit cd7bc6b1c410514765c51821bb8d843f136fea4a:
> 
> Program python3 found: YES (/home/autobuild/autobuild/instance-6/output-1/host/bin/python3)
> Program swig found: NO
> 
> ../output-1/build/libnvme-1.5/libnvme/meson.build:15:11: ERROR: Program 'swig' not found or not executable
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3cb05b4939eb7d1ce0460088c365402ffcd6b13b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnvme/libnvme.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Sorry, I did not notice this patch from you, and merged a similar patch
from Giulio submitted later. Sorry about this :/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
