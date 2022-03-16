Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AA8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 16:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20E9D80F04;
	Wed, 16 Mar 2022 16:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_-d13hv_Rxq; Wed, 16 Mar 2022 16:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E06B80B6D;
	Wed, 16 Mar 2022 16:23:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BAC91BF2F9
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 16:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A8D880B6D
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 16:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOvsLCqvsZvq for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 16:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DC8180B34
 for <buildroot@busybox.net>; Wed, 16 Mar 2022 16:23:03 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1nUWQN-00067w-N1
 for buildroot@busybox.net; Wed, 16 Mar 2022 17:22:59 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 16 Mar 2022 16:22:54 -0000 (UTC)
Message-ID: <t0t2su$mdo$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
Subject: [Buildroot] Can buildroot use existing host fakeroot?
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

I maintain some firmware that uses buildroot 2016.11.2 (with some
local package upgrades). Unfortunately, it seems I can no longer do
builds because host-fakeroot won't compile (it's too old for my
kernel/libc version of stat?). I tried updating the fakeroot package,
but that won't build because it doesn't know how to build
host-acl. [My target doesn't even support ACLs, so trying to get that
installed and working seems a bit pointless.]

My development hosts all have working versions of fakeroot already
installed.

Is there any way I can just tell buildroot to use the existing
fakeroot instead of trying to build its own private copy?

--
Grant

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
