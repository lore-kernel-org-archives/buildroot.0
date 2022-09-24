Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFC5C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 16:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AAA460BD1;
	Sat, 24 Sep 2022 16:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AAA460BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRmt4EMOpJXj; Sat, 24 Sep 2022 16:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBDAE60B8E;
	Sat, 24 Sep 2022 16:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBDAE60B8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9181BF83E
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 16:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 066FA83FBE
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 16:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 066FA83FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeLnUT8S8ixB for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 16:11:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D423183F7D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D423183F7D
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 16:11:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA5A0E0002;
 Sat, 24 Sep 2022 16:11:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oc7kc-004ZLR-Nt; Sat, 24 Sep 2022 18:11:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgxwuvAGu0ydgfuShTvQjjppoUNiBSnP6xgqSKsHjifXTw@mail.gmail.com>
 <87v8pebk2s.fsf@dell.be.48ers.dk>
 <CABRndgxFQLVvusnFHXyMuByfXhg+rR0Q2-X+osOz+V+MJaqXtQ@mail.gmail.com>
 <87r101as98.fsf@dell.be.48ers.dk>
 <CABRndgw8bBeQBkyhUJonHkr-QFkENmRU7BS2jQxRg+v_Nqaeyg@mail.gmail.com>
Date: Sat, 24 Sep 2022 18:11:34 +0200
In-Reply-To: <CABRndgw8bBeQBkyhUJonHkr-QFkENmRU7BS2jQxRg+v_Nqaeyg@mail.gmail.com>
 (Zvi Vered's message of "Sat, 24 Sep 2022 17:53:51 +0300")
Message-ID: <87mtaobvm1.fsf@dell.be.48ers.dk>
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

 > Hi Peter,
 > There is no real technical reason.
 > I thought it would be right to use gcc I got from the vendor (Xilinx)
 > Also, buildroot supports using external toolchain.
 > All gcc libs are copied (by buildroot) to /lib64.
 > Should I try using gcc built by buildroot ?

Yes please, if nothing else then to verify that the issue is specific to
your toolchain. We do not have access to that petalinux toolchain, so it is
hard to help debugging.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
