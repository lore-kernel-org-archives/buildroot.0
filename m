Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CB0E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 08:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 760DD402B1;
	Sat, 28 Dec 2024 08:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1AdFEjWwLhj; Sat, 28 Dec 2024 08:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5388F402ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5388F402ED;
	Sat, 28 Dec 2024 08:48:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB355E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC56B402B1
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnCF18QUh2D9 for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 08:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9849E402ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9849E402ED
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9849E402ED
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:48:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B52F40004;
 Sat, 28 Dec 2024 08:48:41 +0000 (UTC)
Message-ID: <58fa1721-42b8-4aa2-a390-f3492a87467d@korsgaard.com>
Date: Sat, 28 Dec 2024 09:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Buildroot Development <buildroot@buildroot.org>
References: <20241215122434.3906915-1-peter@korsgaard.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241215122434.3906915-1-peter@korsgaard.com>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/opensc: security bump to version
 0.26.0
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

On 12/15/24 13:24, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> 0.25.0:
> 
> CVE-2023-5992: Side-channel leaks while stripping encryption PKCS#1.5
> padding in OpenSC
> https://github.com/OpenSC/OpenSC/wiki/CVE-2023-5992
> 
> CVE-2024-1454: Potential use-after-free in AuthentIC driver during card
> enrollment in pkcs15init
> https://github.com/OpenSC/OpenSC/wiki/CVE-2024-1454
> 
> 0.26.0:
> 
> CVE-2024-45615: Usage of uninitialized values in libopensc and pkcs15init
> https://github.com/advisories/GHSA-3q68-hm47-94vg
> 
> CVE-2024-45616: Uninitialized values after incorrect check or usage of APDU
> response values in libopensc
> https://github.com/advisories/GHSA-2mjg-798r-mxwh
> 
> CVE-2024-45617: Uninitialized values after incorrect or missing checking
> return values of functions in libopensc
> https://github.com/advisories/GHSA-cf2w-h975-2fpg
> 
> CVE-2024-45618: Uninitialized values after incorrect or missing checking
> return values of functions in pkcs15init
> https://github.com/advisories/GHSA-f2v6-mw6x-qmwc
> 
> CVE-2024-45619: Incorrect handling length of buffers or files in libopensc
> https://github.com/advisories/GHSA-9vxw-3j77-cj78
> 
> CVE-2024-45620: Incorrect handling of the length of buffers or files in
> pkcs15init
> https://github.com/advisories/GHSA-9c2g-6v5v-57qg
> 
> CVE-2024-8443: Heap buffer overflow in OpenPGP driver when generating key
> https://github.com/advisories/GHSA-mgc5-p43f-72pc
> 
> Release notes:
> https://github.com/OpenSC/OpenSC/releases/tag/0.26.0
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.02.x and 2024.11.x, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
