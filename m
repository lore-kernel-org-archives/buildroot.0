Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B26AC74A5B
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 02:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED30404F9;
	Sun, 19 Mar 2023 02:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED30404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aAOn8zvh8Yd4; Sun, 19 Mar 2023 02:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29A44155E;
	Sun, 19 Mar 2023 02:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29A44155E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83FEF1BF3F6
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 02:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A76560ADD
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 02:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A76560ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FryG0ohQ4PeJ for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 02:24:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B209660AD2
Received: from box.stevenhay.com (box.stevenhay.com [172.104.133.13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B209660AD2
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 02:24:36 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id 77BA820318;
 Sat, 18 Mar 2023 22:24:33 -0400 (EDT)
Message-ID: <24c2a733-f517-b1ab-4f49-9f4f0c84bc3e@stevenhay.com>
Date: Sat, 18 Mar 2023 22:24:30 -0400
MIME-Version: 1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steve Hay via buildroot <buildroot@buildroot.org>
References: <20230318204407.2112290-1-me@stevenhay.com>
 <20230318215012.3d48267b@windsurf>
In-Reply-To: <20230318215012.3d48267b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1679192674;
 bh=J6+ql5wqter/CQLNp9bxin2AJogrSVIuclh58ROJMw4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KJt2hR2GmhZgMlHYK/FClbu8Sh0TPUwI6elvDHM0g41odS9rfBzlT6UYmu5UWjswP
 1hE7l6BTicgdaJefSJUVaNnVu7zA+jP3jpQYza0sZmI8CSg8D5MpEqxjodym5aayWR
 U3pjw3SW2nNaz+oJwWGlBKjp/TZ/+Ta3lObh/recibK6RzKa/pHHlxT6BaJvihUf8R
 DXTN1Mv4CbJB1PSjH1rrBn6OLTV7QW60vL3u3IIWrdZA5YxqgvScBHgy9ucZvStuET
 t6C8o1/n/Afuso1rspfL1f8eH45TBDhc074yxZKBdANqAWqwBDtQ39BPxkf9w5Gk9o
 syjdzrSu5vXWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=KJt2hR2G
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump version to
 20230311
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
Cc: Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks Thomas.

On 3/18/23 4:50 PM, Thomas Petazzoni wrote:
> The way you did that makes the patch no longer applicable with "git
> format-patch". The patch now has two From/Date/Subject fields.
>
> Could you instead make sure to apply the existing patch on
> ca-certificates using git-am, fix the conflicts, and regenerate the new
> patch with git format-patch? You should preserve the existing
> authorship, but you can do something like this:
Fixed.
> The commit log should mention why this patch is dropped. 
Fixed.
>> -CA_CERTIFICATES_VERSION = 20211016
>> +# batocera / version bump
Removed. The comment accidentally included.

The revised patch has been sent.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
