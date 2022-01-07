Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F93FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E68A42986;
	Fri,  7 Jan 2022 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRAnDegNNyXh; Fri,  7 Jan 2022 21:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3DFA429E7;
	Fri,  7 Jan 2022 21:10:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D57C1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C31460AFA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agcddM-C0d2Y for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:10:01 +0000 (UTC)
X-Greylist: delayed 03:01:33 by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A3D16070A
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:10:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 86D3D1BF205;
 Fri,  7 Jan 2022 21:09:59 +0000 (UTC)
Date: Fri, 7 Jan 2022 22:09:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220107220958.246f3c5f@windsurf>
In-Reply-To: <20220105180751.388943-1-fontaine.fabrice@gmail.com>
References: <20220105180751.388943-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xxhash: fix uclibc build
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

On Wed,  5 Jan 2022 19:07:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following uclibc build failure raised since bump to version
> 0.8.1 in commit 5dbdb2535c649ee617595b8c4ae3cbba0ee37b97:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: xxhash.o: in function `XXH3_hashLong_128b_internal.constprop.0':
> (.text+0xcbc): undefined reference to `static_assert'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/559/5595b21a711b482b84e582fc9f56e5468c9eb6d6/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nd-on-assert-h-for-XXH_STATIC_ASSERT.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
