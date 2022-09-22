Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8252C6FA82
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 06:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D32961055;
	Thu, 22 Sep 2022 06:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D32961055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ivc2287tKqc; Thu, 22 Sep 2022 06:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58C1360F2C;
	Thu, 22 Sep 2022 06:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58C1360F2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BB2C1BF957
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 06:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71AE6418FE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 06:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71AE6418FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HeMlCOKtFgR for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 06:12:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87EAC4186A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87EAC4186A
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 06:12:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CFA3FF805;
 Thu, 22 Sep 2022 06:12:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1obFRU-002enV-1S; Thu, 22 Sep 2022 08:12:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220916190308.579267-1-giulio.benetti@benettiengineering.com>
Date: Thu, 22 Sep 2022 08:12:12 +0200
In-Reply-To: <20220916190308.579267-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 16 Sep 2022 21:03:08 +0200")
Message-ID: <87illgc4zn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to latest version
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/4ba/4baf7b753a16e9cd798eaf51a4cb994a22f437e8/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Some more information would be good for me to know if this needs to be
backported or not. Since what kernel version does it break?

Alternatively a git shortlog since that previous commit, which also
pretty much explains it:

git shortlog --no-merges 19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3..
Denis Klester (1):
      fix build for 5.19.2

Larry Finger (4):
      rtl8723bu: Fix build under kernel 5.17 and clean up some warnings
      rtl8723bu: Fix multiple definition errors
      rtl8723bu: Fin compile warning
      rtl8723bu: Fix builds for kernel 6.0

So apparently it fixes builds with kernel 5.17+.

Committed to 2022.02.x, 2022.05.x and 2022.08.x with a more detailed
commit message, thanks.

> ---
 >  package/rtl8723bu/rtl8723bu.hash | 2 +-
 >  package/rtl8723bu/rtl8723bu.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
 > index 1dad7154b4..9119abad76 100644
 > --- a/package/rtl8723bu/rtl8723bu.hash
 > +++ b/package/rtl8723bu/rtl8723bu.hash
 > @@ -1,2 +1,2 @@
 >  # Locally computed
 > -sha256  1cd658742ce10b21c92877e09cecc98880680d5f150de3845553005abc542977  rtl8723bu-19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3.tar.gz
 > +sha256  07fece152704f4b5dbd0fd3af842816f95824317f3158fea774f15a6eddac009  rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2.tar.gz
 > diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
 > index 838bbedb74..3da8d9cecf 100644
 > --- a/package/rtl8723bu/rtl8723bu.mk
 > +++ b/package/rtl8723bu/rtl8723bu.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -RTL8723BU_VERSION = 19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3
 > +RTL8723BU_VERSION = d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2
 >  RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 >  RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
 > -- 

 > 2.34.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
