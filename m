Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A41C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 18:51:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876FC611EE
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 18:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 876FC611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E05060673;
	Sat, 13 Nov 2021 18:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-NgZPOLJaw3; Sat, 13 Nov 2021 18:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C8660674;
	Sat, 13 Nov 2021 18:51:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9D31BF863
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 18:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7560E4018D
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 18:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THvixg0E5imy for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 18:51:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54F6040173
 for <buildroot@uclibc.org>; Sat, 13 Nov 2021 18:51:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1mly7I-0004i0-7g
 for buildroot@uclibc.org; Sat, 13 Nov 2021 19:51:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Nov 2021 19:50:46 +0100
Message-ID: <pan$5dd7f$70401f45$5083c352$9afab98b@ID-313208.user.individual.net>
References: <20211113170403.2795532-1-bernd.kuhls@t-online.de>
 <20211113180846.2009b6e4__48491.8654475891$1636823353$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.147 (Sweet Solitude; afc1447)
Subject: Re: [Buildroot] [PATCH/next 1/2] package/postgresql: security bump
 version to 13.5
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

Am Sat, 13 Nov 2021 18:08:46 +0100 schrieb Thomas Petazzoni:

>> Added this patch for master branch to next branch for easier merging.
> 
> Sorry, but I don't understand what you mean here. You're using the past
> tense "Added", which I don't really understand. This commit is a
> security bump, so why would it go to "next" as specified in your patch
> title?

Hi Thomas,

this patch is the security bump for the master branch:
http://patchwork.ozlabs.org/project/buildroot/patch/
20211113170147.2795149-1-bernd.kuhls@t-online.de/

I cherry-picked that patch mentioned above to the -next branch which is 
the patch I am here replying to:
http://patchwork.ozlabs.org/project/buildroot/patch/
20211113170403.2795532-1-bernd.kuhls@t-online.de/

On top of the security bump for the -next branch I sent the bump to 14.1:
http://patchwork.ozlabs.org/project/buildroot/patch/
20211113170403.2795532-2-bernd.kuhls@t-online.de/

The two patches for the -next branch should avoid a merge conflict when 
the -next branch is merged back to the master branch.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
