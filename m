Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B00BE7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E91460648;
	Thu,  9 Jan 2025 09:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0MlAIabGIfA; Thu,  9 Jan 2025 09:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC5160752
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CC5160752;
	Thu,  9 Jan 2025 09:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C215A942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC4EF6079B
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFkp6JoGHElZ for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB80B60648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB80B60648
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB80B60648
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:20:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1387724106; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 09:20:11 +0000 (UTC)
Message-ID: <a9c52611-febe-4d52-bd60-d78fe638d894@korsgaard.com>
Date: Thu, 9 Jan 2025 10:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
Cc: Richard Braun <rbraun@sceen.net>, Martin Bark <martin@barkynet.com>
References: <20250107002702.191013-1-nemaakhilesh@gmail.com>
 <20250107002702.191013-2-nemaakhilesh@gmail.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250107002702.191013-2-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LKirYV1PP/uS6l9HjTMrdPVyhBSBPHTY843cJsqa6zjj78IsHuTKM3uZ6RfQzSCYEtlPJMAAfGKZuTJjz6APfoUzjrnUk6k5PPGcO9oAUc1YJqctFc9DqnMwm7U/PamdeAV7NELy+usyHaHT5/GBNQQghGO8qh94yq9hpAc1sQfa01d0Um4HaHX6T3USIzVyMTSoLkWeWt2OohYDi3YEVZ7E+lQ772Xmiaze/OZeMcp2lx5uCPqb5LZJ5Mrk95dlCKpfga8xrQP4yUn44DnqH2pUOs+7naQUfXJKnnSR8O7KRwMxEus/RM7siIU/7NCNBzm7dujMcFF/lap6ilonnA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=dXbPxj/LXP8rse17RdOCDyoaAGnbQk9f81o6Gk/y4CM=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LKirYV1P
Subject: Re: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2024b
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

On 1/7/25 01:27, Akhilesh Nema wrote:
> Release notes:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/
> 
> Updated the hash URL.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
