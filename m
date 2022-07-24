Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30517C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82F52610B6;
	Sun, 24 Jul 2022 10:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82F52610B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rU-O1dyX_Spl; Sun, 24 Jul 2022 10:02:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC90A60B20;
	Sun, 24 Jul 2022 10:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC90A60B20
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6FCB1BF312
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99D6784B09
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99D6784B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cf323IXS6oQS for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:02:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5090C84B01
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5090C84B01
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:02:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id B098C1814B9; Sun, 24 Jul 2022 12:01:58 +0200 (CEST)
In-Reply-To: <d672e040-67d8-2fd6-705d-4ff62e2bfec5@mind.be>
Date: Sun, 24 Jul 2022 12:01:58 +0200
To: "Arnout Vandecappelle" <arnout@mind.be>
MIME-Version: 1.0
Message-ID: <48-62dd1880-1-54f5770@160071919>
User-Agent: SOGoMail 5.7.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1658656918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=GlR69WF36blg31CQ+DnJPUZD5/M1ALzF5zria4tBrzU=;
 b=ROC7W17pY3MTV2IbMSRaCxouJuV1KNJtKF2yNnsrVpnTM21dyM01wQ9NGFb+5e22/ZDAAJ
 Kiowyh9hC3p8GwKEtN7z7Q6D2RXBwRUD5uii7NhPA561B0uQCmJZ1ABhvBpig4CSCU5X6w
 B/c7ozJx4bmoKuKKnsX8WLP/ImzfmbQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=ROC7W17p
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/re2=3A_bump_to_version?=
 =?utf-8?q?_2022-06-01?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Saturday, July 23, 2022 00:10 CEST, Arnout Vandecappelle <arnout@mind.be> wrote:

> 
> 
> On 21/07/2022 20:34, Michael Nosthoff via buildroot wrote:
> 
>   You're signoff is missing. You can simply reply with it, patchwork will pick 
> it up.

Oop, sorry!

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
>   Regards,
>   Arnout
> 
> > ---
> >   package/re2/re2.hash | 2 +-
> >   package/re2/re2.mk   | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/re2/re2.hash b/package/re2/re2.hash
> > index 28f407cc32..380b547658 100644
> > --- a/package/re2/re2.hash
> > +++ b/package/re2/re2.hash
> > @@ -1,3 +1,3 @@
> >   # locally calculated
> > -sha256  1ae8ccfdb1066a731bba6ee0881baad5efd2cd661acd9569b689f2586e1a50e9  re2-2022-04-01.tar.gz
> > +sha256  f89c61410a072e5cbcf8c27e3a778da7d6fd2f2b5b1445cd4f4508bee946ab0f  re2-2022-06-01.tar.gz
> >   sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
> > diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> > index b6d29c3caf..39b2c8d990 100644
> > --- a/package/re2/re2.mk
> > +++ b/package/re2/re2.mk
> > @@ -4,7 +4,7 @@
> >   #
> >   ################################################################################
> >   
> > -RE2_VERSION = 2022-04-01
> > +RE2_VERSION = 2022-06-01
> >   RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
> >   RE2_LICENSE = BSD-3-Clause
> >   RE2_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
