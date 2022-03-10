Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03EFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 19:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67CE14056E;
	Thu, 10 Mar 2022 19:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iE_J-ZT4G6K; Thu, 10 Mar 2022 19:38:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33A804032A;
	Thu, 10 Mar 2022 19:38:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D42B11BF3BD
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 19:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2FF460A9C
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 19:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0z8JoECLyY2 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 19:38:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C16B60804
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 19:38:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D3E9940002;
 Thu, 10 Mar 2022 19:38:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nSOcE-003QG7-PQ; Thu, 10 Mar 2022 20:38:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220219122831.2961097-1-fontaine.fabrice@gmail.com>
 <20220219122831.2961097-2-fontaine.fabrice@gmail.com>
Date: Thu, 10 Mar 2022 20:38:26 +0100
In-Reply-To: <20220219122831.2961097-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 19 Feb 2022 13:28:31 +0100")
Message-ID: <87mthxzjgt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/expat: security bump to version
 2.4.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Security fixes:
 >  #562  CVE-2022-25235 -- Passing malformed 2- and 3-byte UTF-8
 >        sequences (e.g. from start tag names) to the XML
 >        processing application on top of Expat can cause
 >        arbitrary damage (e.g. code execution) depending
 >        on how invalid UTF-8 is handled inside the XML
 >        processor; validation was not their job but Expat's.
 >        Exploits with code execution are known to exist.
 >  #561  CVE-2022-25236 -- Passing (one or more) namespace separator
 >        characters in "xmlns[:prefix]" attribute values
 >        made Expat send malformed tag names to the XML
 >        processor on top of Expat which can cause
 >        arbitrary damage (e.g. code execution) depending
 >        on such unexpectable cases are handled inside the XML
 >        processor; validation was not their job but Expat's.
 >        Exploits with code execution are known to exist.
 >  #558  CVE-2022-25313 -- Fix stack exhaustion in doctype parsing
 >        that could be triggered by e.g. a 2 megabytes
 >        file with a large number of opening braces.
 >        Expected impact is denial of service or potentially
 >        arbitrary code execution.
 >  #560  CVE-2022-25314 -- Fix integer overflow in function copyString;
 >        only affects the encoding name parameter at parser creation
 >        time which is often hardcoded (rather than user input),
 >        takes a value in the gigabytes to trigger, and a 64-bit
 >        machine.  Expected impact is denial of service.
 >  #559  CVE-2022-25315 -- Fix integer overflow in function storeRawNames;
 >        needs input in the gigabytes and a 64-bit machine.
 >        Expected impact is denial of service or potentially
 >        arbitrary code execution.

 > https://blog.hartwork.org/posts/expat-2-4-5-released/
 > https://github.com/libexpat/libexpat/blob/R_2_4_5/expat/Changes

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
