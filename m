Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578C9C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 12:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF18D40941;
	Sat, 15 Mar 2025 12:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXBd0L27SbiJ; Sat, 15 Mar 2025 12:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9275C409C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9275C409C3;
	Sat, 15 Mar 2025 12:48:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3475FC8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1927740941
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7T5E4Ka3JVJV for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 12:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E96640C26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E96640C26
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E96640C26
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:48:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 17DA119F72F;
 Sat, 15 Mar 2025 13:47:56 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Mar 2025 13:47:55 +0100
MIME-Version: 1.0
Date: Sat, 15 Mar 2025 13:47:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: Vladimir Oltean <olteanv@gmail.com>, buildroot@buildroot.org, Ioana
 Ciornei <ciorneiioana@gmail.com>, Brandon Maier <Brandon.Maier@collins.com>,
 Romain Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <7ppsoggazufebwywfwqqlkmssypneyqtmbg4tr4dx76o5dx7q7@iyndbkzeo2zl>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-6-olteanv@gmail.com>
 <7ppsoggazufebwywfwqqlkmssypneyqtmbg4tr4dx76o5dx7q7@iyndbkzeo2zl>
User-Agent: Webmail Free/1.6.10
Message-ID: <616d3621a153da86972c8b1497f71c53@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742042882;
 bh=0p6Ls6NEq7od24v1GzDsMt1wOd+UBTThmPLoWMTRBGE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m5sCLMCZfu35PqRV7b2E/nFiUqxvj+dclo0BeuzRoOau/KLBARH9oLpok+sGDqmzd
 +80u5xYmZRkCGxAPM9t+SGSa2do3JK/aD45FSw8A+bOAXRUljBKvIv7a/Yxa9diG+a
 JcH1ymi008ngsJKg/otLelPYks9SEiFciQ3HU/NbYOUQenk/2g+ImNIXcahapkUwrs
 H7sJ/ttujqQMdHMtiBHxkIJZFtfMGWZ34NWfws5STpP5wzqu5EbslpsFAYZnG3S/uc
 eeo1mn0mzPEO8DjixXKaSiJgng8sEeeNhJa77qvVs/8cbgBXl4NjIAgc6faWOOxfrr
 0TDWXrGpzpXmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m5sCLMCZ
Subject: Re: [Buildroot] [PATCH 05/15] package/qoriq-mc-binary: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent, Vladimir, All,

On 15/03/2025 01:40, Vincent Jardin wrote:
> Hi Vladimir,
> 
> On Sun, Mar 02, 2025 at 11:52:09PM +0100, Vladimir Oltean wrote:
>> Add a package which deploys the NXP MC (Management Complex) firmware
>> to the target. This is necessary for NXP DPAA2 SoCs (LS1088A, LS2080A,
>> LS2088A, LX2160A).
>> 
>> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> 
> See inline
> 
>> ---
>> Change log:
>> - Shorten help text a little bit
>> - 
>> s/BR2_PACKAGE_QORIQ_MC_TARGET_*/BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_*/
>> +
>> +QORIQ_MC_BINARY_VERSION = 10.39.0
> 
> The latest version is 10.39.103, let's use it.

I do see a tag "mc_release_10.39.103" here:
https://github.com/nxp-qoriq/qoriq-mc-binary/tree/mc_release_10.39.103/lx216xa
but it contains only the "lx216xa" directory and firmware.

If such a version is used, the Config.in help text should be updated
accordingly, to say that only LX216x is supported.

Also, looking the tag lists:
https://github.com/nxp-qoriq/qoriq-mc-binary/tags

I also see a "mc_release_10.39.200" tag, so from here it is hard
to tell which one is the "latest".

So, it would be nice to add a comment here describing how to select
the version. For example, following the nxp-qoriq yocto bsp:
https://github.com/nxp-qoriq/meta-qoriq/tree/rel_ls_6.6.52_2.2.0/meta-qoriq-bsp/recipes-dpaa2/management-complex

Or even upstream? In:
https://git.yoctoproject.org/meta-freescale/tree/recipes-dpaa2/management-complex/
since the recipe seems to have been removed in later version in:
https://github.com/nxp-qoriq/meta-qoriq/commit/f65a8aa1c1eccbdfe3a563cd1d94ed59ff421056

Anyways, if we follow the Yocto version, it is indeed "10.39.0".

Vladimir: could you add a comment describing how to find the
"best" version? And also, describe to what other components version
it should be aligned.

To keep track of that, the way we're trying to do it on i.MX
components, is to add the tag name of the nxp bsp it's coming from,
in the commit log.
For example:
"""
qoriq-mc-binary version 10.39.0 is aligned with
nxp-qoriq yocto bsp lf-6.6.36-2.1.0.
"""
This helps further debug, when some components are misaligned.

>> +QORIQ_MC_BINARY_SITE = $(call 
>> github,nxp-qoriq,qoriq-mc-binary,mc_release_$(QORIQ_MC_BINARY_VERSION))
> 
> best regards,
>   Vincent

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
