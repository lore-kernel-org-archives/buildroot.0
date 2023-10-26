Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A71C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 11:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5DD8417E6;
	Thu, 26 Oct 2023 11:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5DD8417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6lAxQXAnpVUm; Thu, 26 Oct 2023 11:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0D49418ED;
	Thu, 26 Oct 2023 11:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0D49418ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D15C71BF59D
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6795416D9
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6795416D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25yezfS-BZY7 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 11:10:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAA634047B
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 11:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA634047B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F8CB20003;
 Thu, 26 Oct 2023 11:10:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qvyGG-006IPk-IU; Thu, 26 Oct 2023 13:10:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20221125123801.4233-1-wdouglass@carnegierobotics.com>
 <4fb78d21-73ee-d85f-8b53-12b4777c941b@mind.be>
Date: Thu, 26 Oct 2023 13:10:48 +0200
In-Reply-To: <4fb78d21-73ee-d85f-8b53-12b4777c941b@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 15 Oct 2023 20:53:31
 +0200")
Message-ID: <87v8atoczr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] Properly note many dependencies for opencv
 modules
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 >  Hi Woodrow,
 >  The subject of the patch should always start with "package/opencv4-contrib: ..."

 >  Applied to master with that fixed, and one more fix...

 > On 25/11/2022 13:38, Woodrow Douglass via buildroot wrote:
 >> Also, add myself to the DEVELOPERS file
 >> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

 > [snip]
 >> config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
 >> bool "face"
 >> +	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECCT
 >                                        ^^^^^^^^^^ OBJDETECT

 >  This was detected by check-package (but perhaps at the time you sent
 >  this patch, that feature hadn't been added to check-package yet).

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
