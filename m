Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42110C83F09
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 10:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA00406D8;
	Wed,  9 Jul 2025 10:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-EEYQWLEfA6; Wed,  9 Jul 2025 10:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DA2540539
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DA2540539;
	Wed,  9 Jul 2025 10:18:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C92B15F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 10:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E26B400E4
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 10:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tubSYpoHcIWG for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 10:18:19 +0000 (UTC)
X-Greylist: delayed 731 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 09 Jul 2025 10:18:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59F274004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59F274004E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=b.bilas@grinn-global.com;
 receiver=<UNKNOWN> 
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59F274004E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 10:18:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (15)
Received: from [192.168.10.54] (ip-194.4.60.197.edial.pl [194.4.60.197])
 by server220076.nazwa.pl (Postfix) with ESMTP id 2FB6A1BDDF5
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 12:06:04 +0200 (CEST)
Message-ID: <bb0f03fe-0c72-4275-bdfc-fc0c43691e4e@grinn-global.com>
Date: Wed, 9 Jul 2025 12:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot <buildroot@buildroot.org>
References: <686b3ba5.170a0220.1f7e31.e08d@mx.google.com>
Content-Language: en-US
From: Bartosz Bilas <b.bilas@grinn-global.com>
In-Reply-To: <686b3ba5.170a0220.1f7e31.e08d@mx.google.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2025-07-06
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

Hello,

the bump is not possible due to an issue with the python-click 
dependency [1].

https://github.com/espressif/esptool/issues/1089

Best
Bartek
On 7/7/25 05:14, Buildroot Notifications wrote:
> Hello,
>
> Outdated packages
> =================
>
> This is the list of packages for which a new version has been detected
> and for which you are a registered developer. Please help us improving
> the quality of Buildroot by bumping these packages to their latest
> version.
>
>               name              | found by |        link to release-monitoring.org         |   version    |   upstream
> -------------------------------+----------+-----------------------------------------------+--------------+--------------
>                  python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 4.8.1        | 5.0.0
>
> Thanks for your contribution to Buildroot!
>
-- 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
