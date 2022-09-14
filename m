Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178DEC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B220819ED;
	Wed, 14 Sep 2022 22:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B220819ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mPNpfmLWjSF; Wed, 14 Sep 2022 22:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA2F181951;
	Wed, 14 Sep 2022 22:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA2F181951
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EFED1BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26A4D40272
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26A4D40272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jO0ik5QGmxsG for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:07:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF13740124
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF13740124
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:07:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A23551C0003;
 Wed, 14 Sep 2022 22:07:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYaXh-007qNE-VP; Thu, 15 Sep 2022 00:07:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220807135357.3940300-1-fontaine.fabrice@gmail.com>
Date: Thu, 15 Sep 2022 00:07:37 +0200
In-Reply-To: <20220807135357.3940300-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Aug 2022 15:53:57 +0200")
Message-ID: <87wna5obiu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/waffle: bump to version 1.7.0
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure raised since bump of
 > wayland to version 1.20.0 in commit
 > f94ba5c31cf7f863e6fae996fc042a56e20118f3 thanks to
 > https://gitlab.freedesktop.org/mesa/waffle/-/commit/71d46212a9d23a951d5d38f0bfd1cdf1194c8c8e
 > and
 > https://gitlab.freedesktop.org/mesa/waffle/-/commit/2c33597245bb74f19104f0a858cd40e80b26991d:

 > /home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld:
 > ../../lib/libwaffle-1.so.0.6.1: undefined reference to
 > `wl_proxy_get_version'
 > /home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld:
 > ../../lib/libwaffle-1.so.0.6.1: undefined reference to
 > `wl_proxy_marshal_flags'

 > https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.7.0
 > https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.6.3
 > https://gitlab.freedesktop.org/mesa/waffle/-/tags/v1.6.2

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1fb1540b0ae6037140f386f44d6e17735f0674c4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
