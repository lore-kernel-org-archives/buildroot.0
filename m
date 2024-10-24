Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315CCCE8E8D
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 15:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA94B81292;
	Thu, 24 Oct 2024 15:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id en8JZJRtbAd0; Thu, 24 Oct 2024 15:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 092A681272
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 092A681272;
	Thu, 24 Oct 2024 15:51:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C7DE972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 15:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 516434055E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 15:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNffx0DU0AWj for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 15:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 286E140E14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 286E140E14
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 286E140E14
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 15:51:19 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 407ItYoqVbsng407ItJTIU; Thu, 24 Oct 2024 17:51:17 +0200
Message-ID: <533948e2-0cee-4526-b67e-a3d5a7d91cdc@benettiengineering.com>
Date: Thu, 24 Oct 2024 17:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Pierre Floury <pierre.floury@gmail.com>
References: <20241023170447.778547-1-giulio.benetti@benettiengineering.com>
 <20241023215915.7c23d3fa@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20241023215915.7c23d3fa@windsurf>
X-CMAE-Envelope: MS4xfGYxfzbeIvOUNJkXt627EqhJlZCIH/c9jKHKqJF1k5sDP0CU4duky75IHqXgYUsfiUW1iNhCRJiRP4YveTL017llozdgzD1nsDGlusO7GT0juuZqZcbd
 vbtV97dkRgfgkcDcminvDE14VMYxr+Q4jLKhHl1nyOie6XlztUqQqjNm3/p6pACCyWbLdN8FiZn5RcEdPimnCn2Elvm+PTD0c/8gdEPbxTR3PAN0tVbE5++t
 RU5POPGVIc+8xnLnV+PHzM3+FvkgfZF7bn73kSfQHkSFRhEqT+EvnvyzEaWgbzWnHs9ozAVXuefuy/L1LGBE71TbHpq6kCWZ/B8/Nr9GCa8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1729785077; bh=tUG/Q2MSFrqdBmGpq1wHlz7n+jEeaf2zL8SBh0cgYCQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jo7aQZXbVzq6tQmcjzdph6w2bXty1UHGv6JWir3OplCfKQ+K5c/VtbVXCpFAlnR7Y
 sxfuRa52VPvm6ETXHTdXm3mWSSBr116seGAaaBiZtAMuJos9fxM0U0iobWkhP2c2Xw
 gdhd/xRd7OhCNBvC+tf7DokNCy4a0gKbPLedGk/HaxCzvG+LTDHgilJCANbJianUw0
 XzBW/tRmeWqQcRBUD3ynKMvqNqpMw/ou3H0jBiN9ufQo1vES7eYAfNMKqjCbDEdyuU
 THiQZ3Mh34Sy46zO2QEVaA80BQDqD0HoSCjgZikcn7Dspfg2zOArKsjaNMBXIhmPXE
 aT0kTJbGeH0Jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jo7aQZXb
Subject: Re: [Buildroot] [PATCH] package/libtraceevent: bump to version 1.8.4
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

On 10/23/24 21:59, Thomas Petazzoni wrote:
> On Wed, 23 Oct 2024 19:04:46 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/libtraceevent/libtraceevent.hash | 2 +-
>>   package/libtraceevent/libtraceevent.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> I wanted to apply this series, but at least today, it seems like
> git.kernel.org has an issue:
> 
> wget -nd -t 3 -O '/home/thomas/projets/buildroot/output/build/.libtraceevent-1.8.4.tar.gz.ApJr7e/output' 'https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-1.8.4.tar.gz'
> --2024-10-23 21:57:02--  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-1.8.4.tar.gz
> Resolving git.kernel.org (git.kernel.org)... 2604:1380:45d1:ec00::3, 147.75.193.91
> Connecting to git.kernel.org (git.kernel.org)|2604:1380:45d1:ec00::3|:443... connected.
> HTTP request sent, awaiting response... Read error (The request is invalid.) in headers.
> Retrying.

It works correctly now. Same couple of hours before sending the patch.
I think it's been a momentary interruption.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
