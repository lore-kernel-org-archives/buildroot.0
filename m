Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1971C47DDF
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 11:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58F3A4044A;
	Thu,  1 Feb 2024 11:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58F3A4044A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lia_udIT2gNG; Thu,  1 Feb 2024 11:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CC0140AB9;
	Thu,  1 Feb 2024 11:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC0140AB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 712211BF2AB
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47D5860BE9
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47D5860BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nknJ7mVlsUzS for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 11:02:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 243FB60B8A
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 11:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243FB60B8A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E1BE40011;
 Thu,  1 Feb 2024 11:02:53 +0000 (UTC)
Message-ID: <9a26b0d0-120f-4ff9-b72f-7b99edbca93c@korsgaard.com>
Date: Thu, 1 Feb 2024 12:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240131081254.175261-1-peter@korsgaard.com>
 <20240131081254.175261-2-peter@korsgaard.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240131081254.175261-2-peter@korsgaard.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: security bump to version
 glibc-2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 31/01/2024 09.12, Peter Korsgaard wrote:
> Fixed the following security issues:
> 
> CVE-2023-6246: syslog: Fix heap buffer overflow in __vsyslog_internal
> https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2024-0001;hb=HEAD
> 
> CVE-2023-6779: syslog: Heap buffer overflow in __vsyslog_internal
> https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2024-0002;hb=HEAD
> 
> CVE-2023-6780: syslog: Integer overflow in __vsyslog_internal
> https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2024-0003;hb=HEAD
> 
> For details, see the Qualys advisory:
> https://www.openwall.com/lists/oss-security/2024/01/30/6
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
