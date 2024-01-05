Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315A0C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 05:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE94D61165;
	Fri,  5 Jan 2024 05:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE94D61165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykUr7p-BeUCd; Fri,  5 Jan 2024 05:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15A38610AD;
	Fri,  5 Jan 2024 05:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A38610AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E18D1BF3F2
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 05:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61AD3610AD
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 05:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61AD3610AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_CYktnci3-f for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 05:57:27 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C361661063
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 05:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C361661063
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A014D3520902; Fri,  5 Jan 2024 06:57:24 +0100 (CET)
Date: Fri, 5 Jan 2024 06:57:24 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <ZZeaRKqDAiE5m4kW@waldemar-brodkorb.de>
References: <20240104190529.1521901-1-abrodkin@synopsys.com>
 <20240104190529.1521901-3-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104190529.1521901-3-abrodkin@synopsys.com>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704434244; bh=S9s+BzFNFNRQehIkClPQSY7ChAfJJMIBcv9jqzAQ2WA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZIAHJys2Mi1w16pzoFHGNYQ8U17/z6eUgCAALN+u3dRkuNRJrGreX6+yvl53JSxo
 HZWEgXifxtdldH/ZDZEE8D/3TVYg0SrmMoG5gSr3v8mWbey+QEnzJWQyWrB2+YGJvq
 4qPB8j4H+P1qEtpmCoQArTbiYbs4INj8D7BtFP8PYan/Zivgd/I+1y5fNgT+/tii8Y
 1N5BG9kPac2Nn73HFvaDEl4UySynr5E2d1xoECrf9A4yZBTJT0gJ+M7Vx1gYDXf5ha
 jmCKHWaoROAs8wMSUbf98jvudOyDTE5IcKpdNBn5/uDNd7M+aO2XRzvjMqvnJ/XoHi
 n0qjN+jASd0ww==
Subject: Re: [Buildroot] [PATCH 2/3] ARC: Add defconfigs for ARC HS58 & HS68
 processors in simulators
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
Cc: geomatsi@gmail.com, artem.panfilov@nokia.com, Shahab.Vahedi@synopsys.com,
 VVIsaev@gmail.com, vgupta@kernel.org, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexey, All,
Alexey Brodkin via buildroot wrote,

> To simplify ramp-up with Linux on32-bit  ARC HS58 & 64-bit ARC HS68
                                 ^^^^^^^^
                                 missing space.
> processors we introduce 2 defconfigs with instructions on how to build
> embedded Linux image for them and how to run resultoing image.
> 
> As with earlier images for simulated platforms it's possible to
> use the same image with either proprietary Synopsys nSIM simulator,
> QEMU or even with real FPGA-based prototyping platform called HAPS.
> 
> That not only convenient, but also helps to work on observed issues,
> i.e. run the same image on so very different platforms and see if
> earlier observed problem is still there. That way we may easily
> verify various platforms against each other.
> 
> For example, if one image works on nSIM & FPGA but doesn't work
> on QEMU, it's clear something needs to be fixed in QEMU.
> 
> But if exactly the same though unexpected behavior is observed on all
> the platforms, we may say with quite some confidence, that we're dealing
> with a pure software or tools issue.

It seems networking is broken in nsimdrv for both defconfigs.
I am using nsimdrv -v
nSIM, Version: 2022.06 (Build: 006_FREE)

Is there a reason arc32 is using uclibc toolchain and arc64 is using
glibc by default?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
