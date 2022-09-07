Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0FCC54EE9
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 20:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD86340928;
	Wed,  7 Sep 2022 20:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD86340928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id df3XC31r1fl1; Wed,  7 Sep 2022 20:33:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C4B408E4;
	Wed,  7 Sep 2022 20:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C4B408E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7FE1BF20D
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 20:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5759A813FE
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 20:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5759A813FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bLcaaV7Ysyh for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 20:33:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 718D7813D4
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 718D7813D4
 for <buildroot@busybox.net>; Wed,  7 Sep 2022 20:33:35 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1oW1jo-0008Jg-G8
 for buildroot@busybox.net; Wed, 07 Sep 2022 22:33:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 7 Sep 2022 20:33:24 -0000 (UTC)
Message-ID: <tfav6k$uda$1@ciao.gmane.io>
References: <CADYjeSu2TUq3Wkk-AFK8TM=xazH66jKPD8Vg6HA9W3WnX2xymg@mail.gmail.com>
User-Agent: slrn/1.0.3 (Linux)
Subject: Re: [Buildroot] How to include prebuilt binary using buildroot?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-09-07, Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
> I think this is rather a basic question:
>
> An application package is not part of buildroot But I am looking for
> possibilities to include it in my image.

I configured buildroot to run a post-build script. In that script, I
copy various files to various places in the output/target tree. I'm
admittedly


But there are prebuilt binary
> available for the application in github. Now I am thinking to include them
> by downloading and extracting the downloaded package (.tar.gz). I believe
> this is something possible using Yocto using SRC_URI. But is this feasible
> with buildroot also, may be with BR2_ROOTFS_POST_IMAGE_SCRIPT?
>
> *Or*, using rootfs overlay the only solution?
>
> Can someone please let me know what is the best approach?
>
> Thanks in advance
>
> -
> Sourabh
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
