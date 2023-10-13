Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95AFCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72CBA4018B;
	Fri, 13 Oct 2023 18:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72CBA4018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xj6_8lM6htlX; Fri, 13 Oct 2023 18:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B022401D8;
	Fri, 13 Oct 2023 18:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B022401D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7C9A1BF2BA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 807A941FBA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 807A941FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08n2xqp9hq_R for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:44:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55DBE41F8B
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DBE41F8B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B32E240002;
 Fri, 13 Oct 2023 18:44:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrN8k-007eXj-Pq; Fri, 13 Oct 2023 20:44:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231011114736.311388-1-peter@korsgaard.com>
Date: Fri, 13 Oct 2023 20:44:02 +0200
In-Reply-To: <20231011114736.311388-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 11 Oct 2023 13:47:35 +0200")
Message-ID: <875y3a1hxp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.21.3
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2023-39325: rapid stream resets can cause excessive work
 > A malicious HTTP/2 client which rapidly creates requests and immediately
 > resets them can cause excessive server resource consumption.  While the
 > total number of requests is bounded to the http2.Server.MaxConcurrentStreams
 > setting, resetting an in-progress request allows the attacker to create a
 > new request while the existing one is still executing.

 > go1.21.3 (released 2023-10-10) includes a security fix to the net/http
 > package.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

For 2023.02.x and 2023.08.x I have instead bumped to 1.20.10 which
contains the same fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
