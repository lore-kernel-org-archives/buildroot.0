Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB29C4167E
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:37:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A3E60E8C
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65A3E60E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEA583196;
	Fri, 22 Oct 2021 18:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLc1sj5cXWca; Fri, 22 Oct 2021 18:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F9E835EF;
	Fri, 22 Oct 2021 18:37:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23ADF1BF29D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 128CF60636
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyanEaWIQ_Kh for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 18:37:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46BA460F74
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 18:37:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C3A7F240006;
 Fri, 22 Oct 2021 18:37:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mdzPd-00033v-PF; Fri, 22 Oct 2021 20:37:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20211014220011.17230-1-ps.report@gmx.net>
 <20211014220011.17230-3-ps.report@gmx.net>
Date: Fri, 22 Oct 2021 20:37:05 +0200
In-Reply-To: <20211014220011.17230-3-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 15 Oct 2021 00:00:11 +0200")
Message-ID: <87a6j06h4e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 3/3] package/nftables: disable debug build
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 >  package/nftables/nftables.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
 > index 6a27975a53..2409eb0571 100644
 > --- a/package/nftables/nftables.mk
 > +++ b/package/nftables/nftables.mk
 > @@ -10,7 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 >  NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 >  NFTABLES_LICENSE = GPL-2.0
 >  NFTABLES_LICENSE_FILES = COPYING
 > -NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
 > +NFTABLES_CONF_OPTS = --disable-debug --disable-man-doc --disable-pdf-doc

Is this only for v1.0.0 or something that should be backported to the
stable branches? You have put this after the bump of nftables in
the series, but have not explicitly stated anything about it.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
