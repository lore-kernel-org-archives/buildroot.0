Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A17C47DB3
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 20:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9CD60B6A;
	Wed, 31 Jan 2024 20:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9CD60B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZ5KNlX3qTjw; Wed, 31 Jan 2024 20:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D924260B1A;
	Wed, 31 Jan 2024 20:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D924260B1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F70A1BF5A4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44FF14206B
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44FF14206B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xmzG3wicO0B for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 20:25:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15DB942049
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 20:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15DB942049
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F98DFF806;
 Wed, 31 Jan 2024 20:25:07 +0000 (UTC)
Message-ID: <722e1fda-9abb-45af-98e5-16914325932e@korsgaard.com>
Date: Wed, 31 Jan 2024 21:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240130164930.3909227-1-peter@korsgaard.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240130164930.3909227-1-peter@korsgaard.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/syslog-ng: needs pcre2, not pcre
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/01/2024 17.49, Peter Korsgaard wrote:
> Syslog-ng-uses pcre2 instead of pcre since 4.3.0 with:
> https://github.com/syslog-ng/syslog-ng/commit/cb6de08dc9078644d48ca536b5660e406b1a50d6
> 
> No autobuilder failures, as pcre2 is implicitly available through libglib2.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
