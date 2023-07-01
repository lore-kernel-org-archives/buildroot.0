Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A3BEB64DD
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 18:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20DA8415C9;
	Sat,  1 Jul 2023 18:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20DA8415C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Me24XP2Udzi; Sat,  1 Jul 2023 18:24:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28CB3415B5;
	Sat,  1 Jul 2023 18:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28CB3415B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FC7D1BF329
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 18:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 098B781E99
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 18:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098B781E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8iLF6qw3uhH7 for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 18:24:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E74981E8F
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E74981E8F
 for <buildroot@uclibc.org>; Sat,  1 Jul 2023 18:24:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qFfGT-0009l5-7b
 for buildroot@uclibc.org; Sat, 01 Jul 2023 20:24:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 01 Jul 2023 20:23:48 +0200
Message-ID: <pan$8b2ae$6d7db6b5$ffc13cb3$ea5ebebc@ID-313208.user.individual.net>
References: <20230621160050.359493-1-bernd@kuhls.net>
 <20230621160050.359493-2-bernd@kuhls.net>
 <cf615eaf-5d13-6f83-ff88-fbbb7db79221__28111.5516483382$1687720273$gmane$org@mind.be>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 2/2] package/gupnp: bump version to 1.4.4
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

Am Sun, 25 Jun 2023 21:10:44 +0200 schrieb Arnout Vandecappelle via
buildroot:

> On 21/06/2023 18:00, Bernd Kuhls wrote:
>> Release notes:
>> https://download.gnome.org/sources/gupnp/1.4/gupnp-1.4.4.news
> 
>   Why not 1.6.3? Are they not compatible or something?

Hi Arnout,

since 1.5.0 gupnp depends on libsoup3:
https://download.gnome.org/sources/gupnp/1.5/gupnp-1.5.0.news

After reading the discussion bumping libsoup [1] I stopped my efforts to 
update gupnp to 1.6.x and backported the xml fix to the 1.4 branch:
https://patchwork.ozlabs.org/project/buildroot/patch/
20230701180655.4192877-1-bernd@kuhls.net/

I am not using any of these packages, just trying to fix the fallout of 
the libxml2 bump ;)

Regards, Bernd

[1] https://patchwork.ozlabs.org/project/buildroot/patch/
20220128105917.30421-2-thomas.devoogdt@barco.com/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
