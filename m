Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C77AC76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 12:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FECA41BD5;
	Tue, 11 Apr 2023 12:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FECA41BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1PcsH_yqU-Ec; Tue, 11 Apr 2023 12:28:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4664141BDE;
	Tue, 11 Apr 2023 12:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4664141BDE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0FD1C3BF5
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65DC060740
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65DC060740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G10xVLi2blQp for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 12:28:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50D5360709
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50D5360709
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 12:28:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B955560003;
 Tue, 11 Apr 2023 12:28:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pmD63-0065wB-PK; Tue, 11 Apr 2023 14:27:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20230407141930.694756-1-ovlevin@sberdevices.ru>
 <3eff15aa-5790-604e-d6de-90ed5d2d3eb7@mind.be>
Date: Tue, 11 Apr 2023 14:27:19 +0200
In-Reply-To: <3eff15aa-5790-604e-d6de-90ed5d2d3eb7@mind.be> (Arnout
 Vandecappelle's message of "Mon, 10 Apr 2023 17:24:58 +0200")
Message-ID: <877cuisixk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: use host-make
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
Cc: olegartys@gmail.com, Oleg Lyovin <ovlevin@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 07/04/2023 16:19, Oleg Lyovin wrote:
 >> GNU make package from the host machine may be too old,
 >> so use the one built by buildroot.
 >> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>

 >  Applied both to master, after reworking the commit messages to
 >  reflect that this was introduced in Linux 6.2.

Thanks. Maybe time has come to also require make >= 3.82 globally in
Buildroot?  It was released almost 10 years ago by now:

https://lists.gnu.org/archive/html/info-gnu/2010-07/msg00023.html

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
