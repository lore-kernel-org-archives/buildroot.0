Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37816D2E9D4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 10:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB2EC40542;
	Mon, 11 Nov 2024 10:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5-nj9W7BvEu; Mon, 11 Nov 2024 10:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBFD40549
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBFD40549;
	Mon, 11 Nov 2024 10:31:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9687B6C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82ED040542
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXkrSyJo2CXw for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 10:31:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 925F040549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 925F040549
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 925F040549
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:31:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CD0BC0008
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:31:20 +0000 (UTC)
Message-ID: <61e8f48d-0878-4b31-be61-3dad5a4638c4@korsgaard.com>
Date: Mon, 11 Nov 2024 11:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241009-check-package-requirements-v2-0-df3e7b79788b@collins.com>
 <20241009-check-package-requirements-v2-1-df3e7b79788b@collins.com>
 <20241026134040.7084d913@windsurf>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241026134040.7084d913@windsurf>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/3] docs/manual/adding-packages-tips:
 mention check-package requirements
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

On 10/26/24 13:40, Thomas Petazzoni via buildroot wrote:
> On Wed, 09 Oct 2024 14:14:56 +0000
> Brandon Maier via buildroot <buildroot@buildroot.org> wrote:
> 
>> Call out the requirements to run check-package and mention that Docker
>> can be used to run check-package without installing dependencies.
>>
>> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
>> ---
>>   docs/manual/adding-packages-tips.adoc | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
> 
> Applied to master after rewording the part that bothered Arnout.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
