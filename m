Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113DEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 18:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7680140AC8;
	Wed, 16 Mar 2022 18:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqEbF4W_KR8W; Wed, 16 Mar 2022 18:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7755B40AE3;
	Wed, 16 Mar 2022 18:10:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB0681BF3E0
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 18:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A504783E39
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 18:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubpBw86FoB8w for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 18:10:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2889983F2C
 for <buildroot@busybox.net>; Wed, 16 Mar 2022 18:10:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1nUY61-0002V3-JN
 for buildroot@busybox.net; Wed, 16 Mar 2022 19:10:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 16 Mar 2022 18:10:01 -0000 (UTC)
Message-ID: <t0t95p$8on$1@ciao.gmane.io>
References: <t0t2su$mdo$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
Subject: Re: [Buildroot] Can buildroot use existing host fakeroot?
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

On 2022-03-16, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I maintain some firmware that uses buildroot 2016.11.2 (with some
> local package upgrades). Unfortunately, it seems I can no longer do
> builds because host-fakeroot won't compile (it's too old for my
> kernel/libc version of stat?).

I've updated fakeroot, acl, and attr packages so that I can build
again, but I'm still curious about whether you can tell buildroot
to use pre-existing versions of host-side tools like fakeroot.

--
Grant

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
