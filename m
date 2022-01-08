Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92477C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F53A40761;
	Sat,  8 Jan 2022 18:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jrd1FTfLf5A4; Sat,  8 Jan 2022 18:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76F7C4055E;
	Sat,  8 Jan 2022 18:33:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1771BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BAFA4055E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZefMOrOkrQX for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:33:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1DD44050F
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:33:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 95E61200002;
 Sat,  8 Jan 2022 18:33:08 +0000 (UTC)
Date: Sat, 8 Jan 2022 19:33:07 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108193307.6db645fa@windsurf>
In-Reply-To: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
References: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/2] package/libcap: drop host-gperf
 dependency
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

On Sun, 30 Aug 2020 12:00:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-gperf dependency was added in commit
> 5d8926add5da1b0bdfb90a41f4d7f857864c5524 without any explanation in the
> commit message but gperf can be disabled through BUILD_GPERF since
> https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=3c22870c762f7925b5ff143d76f9affbade275ba
> 
> So use this variable and drop this unneeded dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcap/libcap.mk | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

So we discussed this with Yann, Peter and Arnout and found that
host-gperf is really quick to build, and provides a better way for
libcap to lookup symbols, thanks to a hash table. So we prefer to keep
things as they are with the host-gperf dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
