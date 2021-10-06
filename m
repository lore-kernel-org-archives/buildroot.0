Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24580C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:21:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E3360F41
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2E3360F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4061407CA;
	Wed,  6 Oct 2021 15:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJbXIJFtxH_R; Wed,  6 Oct 2021 15:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C29E407A6;
	Wed,  6 Oct 2021 15:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5471BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 973B3407A6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57Oavf7HycC2 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:21:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFD95407B2
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:21:51 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 21A571BF20E;
 Wed,  6 Oct 2021 15:21:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mY8jt-0001Zz-F7; Wed, 06 Oct 2021 17:21:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211001221654.3087199-1-fontaine.fabrice@gmail.com>
Date: Wed, 06 Oct 2021 17:21:49 +0200
In-Reply-To: <20211001221654.3087199-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 2 Oct 2021 00:16:54 +0200")
Message-ID: <877deq5gc2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/supervisor: bump to version
 4.2.2
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

 > Update indentation in hash file (two spaces)
 > https://github.com/Supervisor/supervisor/blob/4.2.2/CHANGES.rst

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I believe this no longer depends on the (unmaintained) python-meld3
package. In fact, neither does 4.1.0:

https://github.com/Supervisor/supervisor/commit/d09d843493eb77cb8c3df52e1f7e636ad0e5b4dd

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
