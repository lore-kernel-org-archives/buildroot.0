Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FA6C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 01:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA19419D3;
	Sun, 10 Dec 2023 01:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA19419D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUI1qU3dn5_f; Sun, 10 Dec 2023 01:37:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD1684192A;
	Sun, 10 Dec 2023 01:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1684192A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D88E51BF5A3
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 01:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8DCC40354
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 01:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8DCC40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2c_E-IJtAccu for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 01:37:02 +0000 (UTC)
X-Greylist: delayed 33317 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 10 Dec 2023 01:37:01 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEBFC40352
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEBFC40352
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 01:37:01 +0000 (UTC)
X-QQ-mid: bizesmtp81t1702172215t5i9p2bv
Received: from localhost.localdomain ( [116.30.124.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 10 Dec 2023 09:36:54 +0800 (CST)
X-QQ-SSF: 01200000000000E0Y000000A0000000
X-QQ-FEAT: uGhnJwy6xZLQfwbIeqGXfjrhCGbz66+SLzma2+lgCKPvpYPEFPQI3SInz2Zfh
 XLy0bPBuRNkofVN1AdfU0nBt9izCkOqaG3ui0dmxxZafHmq+TM8/Oag7w1c7KhwTq3vKHPz
 j4ZQZGFHm60ym0sCGxEJQHKVckm8v5QVTdkUGUSHBxlsgp9dBryENgU0N+uGm++QDx2ydOy
 HhXMvP2r1EvD21D1vFbEa8qWwj1FLVAEypLuINPw0GAEGBV90U2yMVWdXKko4lLS1q0Pmsw
 Hi8a+gKUns20NHMTbLqJdFBefj3pinkf3NgDma0xDNOdglBZcc04vYxi9sgKp6+uvUGqKDw
 l45jns3i884S7EiKMmnl3GnLaZpttfLMIQmM2JpsJcx2cesTCTi0KYHgRUT/Q==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12916442203070656051
From: Zhangjin Wu <falcon@tinylab.org>
To: yann.morin.1998@free.fr
Date: Sun, 10 Dec 2023 09:36:53 +0800
Message-Id: <20231210013653.28449-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZXSwdJFb46e_u2RX@landeda>
References: <ZXSwdJFb46e_u2RX@landeda>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
Subject: Re: [Buildroot] [PATCH 1/1] package/mpfr: Fix GNU Mirror Path
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
Cc: falcon@tinylab.org, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann

> Zhangjin Wu, All,
> 
> On 2023-12-10 00:21 +0800, Zhangjin Wu spake thusly:
> > Replacing http://www.mpfr.org with BR2_GNU_MIRROR variable
> 
> The upstream for MPFR still references their own location as the
> download location:
> 
>     https://www.mpfr.org/mpfr-4.1.1/
> 
> E.g.:
> 
>     https://www.mpfr.org/mpfr-4.1.1/mpfr-4.1.1.tar.xz
> 
> What is the rationale for switching over to the GNU mirror rather than
> use the official upstream location?
>

I have found that the downloading of mpfr from its official site is very
slow in our region, sometimes, costs several hours and even fails at
last. But the downloading from one of its local GNU mirror sites is fast
and deterministic.

And I have checked that the latest version of mpfr has been stored in
the GNU mirror site too:

http://ftpmirror.gnu.org/mpfr-4.2.1.tar.xz

So, it should be reasonable and safe for us to do such switch ;-)

Regards,
Zhangjin Wu

> Regards,
> Yann E. MORIN.
> 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  package/mpfr/mpfr.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
> > index 8d12c7502b..a5e26404d1 100644
> > --- a/package/mpfr/mpfr.mk
> > +++ b/package/mpfr/mpfr.mk
> > @@ -5,7 +5,7 @@
> >  ################################################################################
> >  
> >  MPFR_VERSION = 4.1.1
> > -MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
> > +MPFR_SITE = $(BR2_GNU_MIRROR)/mpfr
> >  MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
> >  MPFR_LICENSE = LGPL-3.0+
> >  MPFR_LICENSE_FILES = COPYING.LESSER
> > -- 
> > 2.34.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
