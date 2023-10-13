Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA31C41513
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 21:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED92F60F30;
	Fri, 13 Oct 2023 21:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED92F60F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dLDRAxPlteqs; Fri, 13 Oct 2023 21:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF1860FB7;
	Fri, 13 Oct 2023 21:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF1860FB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05C341BF3C0
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3A1F40301
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3A1F40301
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2RO0w31Idsm for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 21:30:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 155664038C
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 21:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 155664038C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 964C01BF209;
 Fri, 13 Oct 2023 21:30:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrPjH-007jkj-8A; Fri, 13 Oct 2023 23:29:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgyUFq2nfXU2Bi0o+aVjfuQ7eMtWbEFSJ1V9ipOHjaN_Aw@mail.gmail.com>
Date: Fri, 13 Oct 2023 23:29:55 +0200
In-Reply-To: <CABRndgyUFq2nfXU2Bi0o+aVjfuQ7eMtWbEFSJ1V9ipOHjaN_Aw@mail.gmail.com>
 (Zvi Vered's message of "Sat, 14 Oct 2023 00:09:19 +0300")
Message-ID: <87wmvqyzvw.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] buildroot 2021.02.1: black screen after Xorg
 launched
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
 > Using buildroot 2021.02.1 for x64 I built root file system that contain Xorg.
 > Right after Xorg is launched I got black screen.

2021.02.1 is a release from almost 3 years ago, which has been end of
life since April 2022. Please use a supported version (E.G. 2023.02.x or
2023.08.x).

 > According to Xorg.0.0.log (attached) there is no error.
 > I tried to run: xeyes and got:
 > Can't open display

Does it work if you set the DISPLAY environment variable?

export DISPLAY=:0

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
