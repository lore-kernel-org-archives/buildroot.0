Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B99BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1841241581;
	Mon, 27 Jun 2022 22:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1841241581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMuOhVBoG2pK; Mon, 27 Jun 2022 22:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90F04155B;
	Mon, 27 Jun 2022 22:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90F04155B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD9681BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97C8A607FF
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C8A607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSRJ8-e7d8Q6 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:34:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75BC0606C0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75BC0606C0
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:34:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6FD44240002;
 Mon, 27 Jun 2022 22:34:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o5xJA-00D5vK-Ll; Tue, 28 Jun 2022 00:34:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220619163255.636101-1-fontaine.fabrice@gmail.com>
Date: Tue, 28 Jun 2022 00:34:16 +0200
In-Reply-To: <20220619163255.636101-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 19 Jun 2022 18:32:54 +0200")
Message-ID: <87v8slsplj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/tcpreplay: replace
 TCPREPLAY_CPE_ID_VENDOR
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > tcpreplay has been replaced by broadcom since April 2022:
 > <cpe-item name="cpe:/a:tcpreplay:tcpreplay:4.3.1" deprecated="true" deprecation_date="2022-04-02T03:29:17.303Z">
 >     <title xml:lang="en-US">tcpreplay 4.3.1</title>
 >       <reference href="http://tcpreplay.synfin.net/wiki/Download">Vendor</reference>
 >       <reference href="https://sourceforge.net/projects/tcpreplay/">Product</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:tcpreplay:tcpreplay:4.3.1:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:broadcom:tcpreplay:4.3.1:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

 > https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abroadcom%3Atcpreplay

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/tcpreplay/tcpreplay.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
 > index ef65403974..9f2da6439b 100644
 > --- a/package/tcpreplay/tcpreplay.mk
 > +++ b/package/tcpreplay/tcpreplay.mk
 > @@ -9,7 +9,7 @@ TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPRE
 >  TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 >  TCPREPLAY_LICENSE = GPL-3.0
 >  TCPREPLAY_LICENSE_FILES = docs/LICENSE
 > -TCPREPLAY_CPE_ID_VENDOR = tcpreplay
 > +TCPREPLAY_CPE_ID_VENDOR = broadcom

Odd, but OK - Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
