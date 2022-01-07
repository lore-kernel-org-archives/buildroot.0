Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E7C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22625429DC;
	Fri,  7 Jan 2022 21:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1u3hhyVCOiiK; Fri,  7 Jan 2022 21:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B253429E7;
	Fri,  7 Jan 2022 21:09:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC8F1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E8F4429C5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:09:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79g5cflAKqPH for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:09:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 855A542986
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:09:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 95DDB240002;
 Fri,  7 Jan 2022 21:09:20 +0000 (UTC)
Date: Fri, 7 Jan 2022 22:09:19 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220107220919.74e9ab74@windsurf>
In-Reply-To: <20220105180645.388855-1-fontaine.fabrice@gmail.com>
References: <20220105180645.388855-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rtorrent: disable execinfo
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

On Wed,  5 Jan 2022 19:06:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable execinfo to avoid the following build failure raised since the
> addition of libexecinfo package in commit
> eea8ba446c10701a273432552108d80fb2224ef4:
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: main.o: in function `do_panic(int)':
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/rtorrent-0.9.8/src/main.cc:606: undefined reference to `backtrace'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/10fc9016013931c58238240216c5950b23b56b30
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...disable-execinfo-option-to-configure.patch | 34 +++++++++++++++++++
>  package/rtorrent/rtorrent.mk                  |  3 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch

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
