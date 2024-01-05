Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE7CC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4BB42176;
	Fri,  5 Jan 2024 10:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC4BB42176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PtMgLbQpwzQp; Fri,  5 Jan 2024 10:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4358F4216E;
	Fri,  5 Jan 2024 10:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4358F4216E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C969B1BF378
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1CB080BF9
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1CB080BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LRWdKWV9G58D for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:43:23 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B005808A2
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B005808A2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62FE520007;
 Fri,  5 Jan 2024 10:43:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rLhfb-005dm7-25;
 Fri, 05 Jan 2024 11:43:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231209200916.250950-1-peter@korsgaard.com>
Date: Fri, 05 Jan 2024 11:43:19 +0100
In-Reply-To: <20231209200916.250950-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 9 Dec 2023 21:09:15 +0100")
Message-ID: <87edew3vso.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libcurl: security bump to version
 8.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2023-46218: cookie mixed case PSL bypass

 >   This flaw allows a malicious HTTP server to set "super cookies" in curl
 >   that are then passed back to more origins than what is otherwise allowed
 >   or possible.  This allows a site to set cookies that then would get sent
 >   to different and unrelated sites and domains.

 >   https://curl.se/docs/CVE-2023-46218.html

 > - CVE-2023-46219: HSTS long file name clears contents

 >   When saving HSTS data to an excessively long file name, curl could end up
 >   removing all contents, making subsequent requests using that file unaware
 >   of the HSTS status they should otherwise use.

 >   https://curl.se/docs/CVE-2023-46219.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
