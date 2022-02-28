Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAE2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 18:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45E0F60E52;
	Mon, 28 Feb 2022 18:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYVCQ37-CS4N; Mon, 28 Feb 2022 18:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C4F60E4C;
	Mon, 28 Feb 2022 18:46:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6141BF2CE
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 065AC40110
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJjaUS1pdBzb for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 18:46:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82AF4400CD
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 18:46:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 56739E0004;
 Mon, 28 Feb 2022 18:46:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nOl2J-00EBsE-Gd; Mon, 28 Feb 2022 19:46:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220226160503.2703879-1-fontaine.fabrice@gmail.com>
Date: Mon, 28 Feb 2022 19:46:19 +0100
In-Reply-To: <20220226160503.2703879-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 26 Feb 2022 17:05:03 +0100")
Message-ID: <87sfs2zv5w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: security bump to
 version 2.12
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following security issues (i.e. CVE-2021-37706, CVE-2021-41141,
 > CVE-2021-43804, CVE-2021-43845, CVE-2022-21722 and CVE-2022-21723):
 > - Potential integer underflow upon receiving STUN message
 >   (GHSA-2qpg-f6wf-w984)
 > - Use after free of dialog set (GHSA-ffff-m5fm-qm62)
 > - Missing unreleased of locks in failure cases (GHSA-8fmx-hqw7-6gmc)
 > - Potential out-of-bounds read when parsing RTCP BYE message
 >   (GHSA-3qx3-cg72-wrh9)
 > - Prevent OOB read for RTCP XR block (GHSA-r374-qrwv-86hh)
 > - Potential buffer overflow in pjsua_player_create(),
 >   pjsua_recorder_create(), pjmedia_wav_player_create(), and
 >   pjsua_call_dump() (GHSA-qcvw-h34v-c7r9)
 > - Potential out-of-bound read during RTP/RTCP parsing
 >   (GHSA-m66q-q64c-hv36)
 > - Prevent OOB read in multipart parsing (GHSA-7fw8-54cv-r7pm)
 > - Use after free of dialog set (GHSA-ffff-m5fm-qm62)

 > https://github.com/pjsip/pjproject/releases/tag/2.12

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/libpjsip/libpjsip.hash | 2 +-
 >  package/libpjsip/libpjsip.mk   | 4 ++--
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
 > index f39ebf4060..74331ab6fb 100644
 > --- a/package/libpjsip/libpjsip.hash
 > +++ b/package/libpjsip/libpjsip.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256  45f6604372df3f49293749cd7c0b42cb21c4fb666c66f8ed9765de004d1eae38  pjproject-2.11.1.tar.gz
 > +sha256  b3b94d9be4aba8f6d2d1cb164603e81b0a6ee17352f9e2ba5b58e325e610ca5a  pjproject-2.12.tar.gz
 >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 > diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
 > index b05cc31a83..32cfa8c53c 100644
 > --- a/package/libpjsip/libpjsip.mk
 > +++ b/package/libpjsip/libpjsip.mk
 > @@ -4,10 +4,10 @@
 >  #
 >  ################################################################################
 
 > -LIBPJSIP_VERSION = 2.11.1
 > +LIBPJSIP_VERSION = 2.12
 >  LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 >  LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 > -# https://github.com/pjsip/pjproject/archive/2.11.1.tar.gz
 > +# https://github.com/pjsip/pjproject/archive/2.12.tar.gz

That comment doesn't look very useful. Oh well - Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
