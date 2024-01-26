Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12188C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 21:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4E794018F;
	Fri, 26 Jan 2024 21:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E794018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9x3RWCl1i-n; Fri, 26 Jan 2024 21:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00515402C3;
	Fri, 26 Jan 2024 21:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00515402C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E32A1BF2EC
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 305AA4018F
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 305AA4018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 91GkEAvs1LiL for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 21:33:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D600740142
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 21:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D600740142
Received: by mail.gandi.net (Postfix) with ESMTPSA id C315FE0004;
 Fri, 26 Jan 2024 21:33:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rTTpP-00ATTt-2x;
 Fri, 26 Jan 2024 22:33:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240126173215.1630553-1-fontaine.fabrice@gmail.com>
Date: Fri, 26 Jan 2024 22:33:35 +0100
In-Reply-To: <20240126173215.1630553-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 26 Jan 2024 18:32:15 +0100")
Message-ID: <87a5or230w.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/faad2: force arm mode instead
 of Thumb mode
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure in Thumb mode:
 > /tmp/ccfzn6FH.s:36: Error: selected processor does not support `smull r2,r3,r1,r0' in Thumb mode

 > Fixes:
 >  - http://autobuild.buildroot.org/results/838808b4751244ee01cde6b8261212b49e511a32

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/faad2/faad2.mk | 7 +++++++
 >  1 file changed, 7 insertions(+)

 > diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
 > index 686e5045c0..0e66ebc8e1 100644
 > --- a/package/faad2/faad2.mk
 > +++ b/package/faad2/faad2.mk
 > @@ -12,4 +12,11 @@ FAAD2_CPE_ID_VENDOR = audiocoding
 >  FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
 >  FAAD2_INSTALL_STAGING = YES
 
 > +# faad2 has some assembly function that are not present in thumb1 mode:
 > +# Error: selected processor does not support `smull r2,r3,r1,r0' in Thumb mode
 > +# so, we desactivate thumb mode
 > +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 > +FAAD2_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
 > +endif

Committed after rewording this slightly, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
