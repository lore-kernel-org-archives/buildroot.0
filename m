Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369C0C25B50
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 20:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C4860FBD;
	Mon, 23 Jan 2023 20:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C4860FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvIIHNCQUJj8; Mon, 23 Jan 2023 20:16:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B0660FB7;
	Mon, 23 Jan 2023 20:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B0660FB7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7489F1BF28C
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 20:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50E49404BB
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 20:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E49404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2c7Zcr-0O6e for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 20:16:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12E7040B60
Received: from box.stevenhay.com (box.stevenhay.com
 [IPv6:2a01:7e01:e001:325::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12E7040B60
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 20:16:07 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id 96F8A22CB1
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 15:16:01 -0500 (EST)
Message-ID: <928ea3fa-30fb-f39a-e6f5-aab6c5e17691@stevenhay.com>
Date: Mon, 23 Jan 2023 15:15:58 -0500
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230122234309.2111129-1-me@stevenhay.com>
 <20230123070133.GB2632@scaer>
 <f1b4fdfa-786f-2b09-5396-33ad4e79b64f@stevenhay.com>
In-Reply-To: <f1b4fdfa-786f-2b09-5396-33ad4e79b64f@stevenhay.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1674504964;
 bh=zUuMT30qwfBAkxW8NTcaHKDjowsMfJXDHrKN5J6md0M=;
 h=Date:Subject:From:To:References:In-Reply-To:From;
 b=UCdtM2qsdEQIjhNUfVTsMPKvMAY1bu4e3TJvSTDVx7/m4YZbaFmbQiSVWYr9ykHdC
 4P15SMy64gpbjkgXJfD9PH2QwIIVmYWcntSjF2R5CCjT1jdRmhLNXaweNVQQ+ALgE2
 fjyWHoTUvR4QrrQlATYcvvzVOKRi5oCxQDzxhNDRWeubJTakOSrqPEKehfPCmboZ7X
 8SzsGoNIc49X/u9sG2pSJptCJrD34JY1GGWQYCHSFiCC1P0cNiZ6mXRDNqYvKAuKvO
 VqZdtZmYbNoMIZCP1klWhZMVrl89W/O6p8Ji5Z9q/laYD+BdfRMMunUtafiuivKmuZ
 KrqEAyNRznVnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=UCdtM2qs
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/graph-depends cleanup
 done_deps global
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
From: =?utf-8?b?yo7JkEggx53KjMedyodTIHZpYSBidWlsZHJvb3Q=?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?yo7JkEggx53KjMedyodT?= <me@stevenhay.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Yann, All,

Thank you.

> On 1/23/23 2:01 AM, Yann E. MORIN wrote:
>> On 2023-01-23 00:43 +0100, Steve Hay via buildroot spake thusly:
>>> From: Steve <me@stevenhay.com>
>> Please use you full name as author (not just your first name).
>>
>> Please provide a (potentially terse) explanation for the change. 
I don't know why the git client did that with my first name. I will try 
to fix it.
>> Make the default be the empty list: done_deps=[] 

I don't think this works because it essentially moves the global list 
into the Python interpreter:

https://docs.python.org/3/faq/programming.html#why-are-default-values-shared-between-objects 


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
