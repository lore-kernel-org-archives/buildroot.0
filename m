Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48D9C6FA82
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 07:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285F0417BD;
	Fri, 23 Sep 2022 07:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 285F0417BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pF24PdGUnUAH; Fri, 23 Sep 2022 07:56:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C62A41751;
	Fri, 23 Sep 2022 07:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C62A41751
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC5E91BF343
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 07:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7ACB60B79
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 07:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7ACB60B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmTvmdHM6yMC for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 07:56:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 950AB60B77
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 950AB60B77
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 07:56:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A9EDDC0003;
 Fri, 23 Sep 2022 07:56:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1obdXf-003OWD-Hx; Fri, 23 Sep 2022 09:56:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgxwuvAGu0ydgfuShTvQjjppoUNiBSnP6xgqSKsHjifXTw@mail.gmail.com>
Date: Fri, 23 Sep 2022 09:56:11 +0200
In-Reply-To: <CABRndgxwuvAGu0ydgfuShTvQjjppoUNiBSnP6xgqSKsHjifXTw@mail.gmail.com>
 (Zvi Vered's message of "Thu, 22 Sep 2022 05:27:50 +0300")
Message-ID: <87v8pebk2s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] buildroot 2022.02.1: apache (httpd) - libgcc_s.so.1
 must be installed for pthread_cancel to work
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

>>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:

 > Hello,
 > I created a root file system that also contains apache.
 > During boot, when apache starts running, it logs the following error:

 > libgcc_s.so.1 must be installed for pthread_cancel to work

 > This happens before a browser is trying to get data.

 > When I launched a browser, no data was page was displayed.

 > I double checked: libgcc_s.so.1 installed.
 > My application (which runs Ok) uses this library.

 > Can you please help ?

You will need to provide some more details about your setup. As a start,
can you please run:

make BR2_DEFCONFIG=defconfig savedefconfig

and reply with the content of the defconfig file.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
