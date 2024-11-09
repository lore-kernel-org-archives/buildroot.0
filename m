Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0538D5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 16:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA28401CF;
	Sat,  9 Nov 2024 16:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6Iu7v-yaCyp; Sat,  9 Nov 2024 16:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20C1C4030A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C1C4030A;
	Sat,  9 Nov 2024 16:28:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F0ED8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E52D9813DA
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIdWi3Rhjazz for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 16:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56DEE80D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56DEE80D61
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56DEE80D61
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:28:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B451240002
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:28:22 +0000 (UTC)
Message-ID: <1611d739-29b0-4bc3-b4ee-54f0977dbd53@korsgaard.com>
Date: Sat, 9 Nov 2024 17:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241023095252.2742168-1-sen@hastings.org>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241023095252.2742168-1-sen@hastings.org>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add
 unsure_cves to cve_total calculation
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

On 10/23/24 11:52, Sen Hastings wrote:
> When I initially made the CVE cells collapsible, I neglected to
> count the unsure CVEs. This patch adds unsure CVEs to the cell collapsing
> calcualation to ensure that cells with lots of unsure CVEs actually get collapsed.
> 
> This patch also removes the "+ 1" from the cve_total calculation,
> which fixes the cve_total being off-by-one.
> I'm not sure *why* I did that in the first place.
> 
> demo:
> https://sen-h.codeberg.page/pkg-stats-demos/@pages/add-unsure_cves-to-cve_total-calc.html
> 
> 
> Signed-off-by: Sen Hastings <sen@hastings.org>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
