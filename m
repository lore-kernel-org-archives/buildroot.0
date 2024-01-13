Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F82C4707C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0398360B83;
	Sat, 13 Jan 2024 21:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0398360B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtGSfKdU8VBD; Sat, 13 Jan 2024 21:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9D260AC3;
	Sat, 13 Jan 2024 21:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9D260AC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 674B81BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C8024032A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C8024032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRcQED1UQMko for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:14:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 385BB40578
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 385BB40578
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58750240002;
 Sat, 13 Jan 2024 21:14:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOlL1-00DPzZ-2E;
 Sat, 13 Jan 2024 22:14:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZZQO5Te/A8SzdRLn@waldemar-brodkorb.de>
Date: Sat, 13 Jan 2024 22:14:43 +0100
In-Reply-To: <ZZQO5Te/A8SzdRLn@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Tue, 2 Jan 2024 14:25:57 +0100")
Message-ID: <87h6jhndfg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/asterisk: bump to 20.5.2
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Tested on a Raspberry PI4 with a SNOM 360 and a SIP Trunk to Easybell.
 > Attention: chan_sip is deprecated, use chan_pjsip instead.
 > For chan_pjsip you need to enable openssl otherwise the module will not
 > load.

 > Patches 0005 and 0006 are applied upstream.
 > Remove unused configure options:
 > --without-curses
 > --without-isdnnet
 > --without-misdn
 > --without-nbs
 > --without-oss
 > --without-sqlite
 > --without-suppserv
 > --without-termcap
 > --without-tinfo
 > --without-vpb

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  .checkpackageignore                           |  2 -
 >  DEVELOPERS                                    |  1 +
 >  ...tection-of-re-entrant-resolver-funct.patch | 38 -------------------
 >  ...n-iostream.c-fix-build-with-libressl.patch | 38 -------------------
 >  package/asterisk/asterisk.hash                |  2 +-
 >  package/asterisk/asterisk.mk                  | 18 ++-------
 >  6 files changed, 6 insertions(+), 93 deletions(-)
 >  delete mode 100644 package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch
 >  delete mode 100644 package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch

 > diff --git a/.checkpackageignore b/.checkpackageignore
 > index def465e802..807752c5f4 100644
 > --- a/.checkpackageignore
 > +++ b/.checkpackageignore
 > @@ -159,8 +159,6 @@ package/asterisk/0001-sounds-do-not-download-and-check-sha1s.patch Upstream
 >  package/asterisk/0002-configure-fix-detection-of-libcrypt.patch Upstream
 >  package/asterisk/0003-build-ensure-target-directory-for-modules-exists.patch Upstream
 >  package/asterisk/0004-install-samples-need-the-data-files.patch Upstream
 > -package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch Upstream
 > -package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch Upstream
 >  package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch Upstream
 >  package/at/S99at Indent Variables
 >  package/attr/0001-build-with-older-GCCs.patch Upstream
 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index cc089e8ff6..d8e8d58026 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -3106,6 +3106,7 @@ N:	Wade Berrier <wberrier@gmail.com>
 >  F:	package/ngrep/
 
 >  N:	Waldemar Brodkorb <wbx@openadk.org>
 > +F:	package/asterisk/

Thanks for stepping up to maintain asterisk!

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
