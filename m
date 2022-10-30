Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70333C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6D82402EF;
	Sun, 30 Oct 2022 21:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D82402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9tB--6Tgy2V; Sun, 30 Oct 2022 21:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D56D2402B1;
	Sun, 30 Oct 2022 21:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D56D2402B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECC701BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C829780D5A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C829780D5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMS_DsXs7pZY for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:49:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 017E680D2A
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 017E680D2A
 for <buildroot@uclibc.org>; Sun, 30 Oct 2022 21:49:25 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1opGBH-0009io-Ke
 for buildroot@uclibc.org; Sun, 30 Oct 2022 22:49:23 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Oct 2022 22:48:49 +0100
Message-ID: <pan$10554$d40e1cca$b9dc16f5$57e1b66e@ID-313208.user.individual.net>
References: <20220708142150.234611-1-bernd.kuhls__17925.5718061299$1657290142$gmane$org@t-online.de>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/pixman: fix powerpc64le build
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

Am Fri,  8 Jul 2022 16:21:50 +0200 schrieb Bernd Kuhls:

> Disable vmx support to fix build error:
> 
> pixman-vmx.c:268:5: note: in expansion of macro 'LOAD_VECTOR'
>   268 |     LOAD_VECTOR (src);
>       |     ^~~~~~~~~~~
> pixman-vmx.c:268:5: error: cannot convert a value of type 'int' to
>  vector type '__vector(4) unsigned int' which has different size
> 
> Fixes:
> http://autobuild.buildroot.net/results/
fda886768fce25ccd9b52b635ff5b13da7ba2d0c/

Marked as "Handled Elsewhere" in patchworks due to
https://git.buildroot.net/buildroot/commit/?
id=fdb23693a4bff5e9e9472738a0278ae0b13411e0

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
