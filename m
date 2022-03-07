Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE3DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 20:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F16C60EF3;
	Mon,  7 Mar 2022 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUGYLxATS-DF; Mon,  7 Mar 2022 20:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B9B60EAD;
	Mon,  7 Mar 2022 20:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5B691BF3A0
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0F234016A
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYvQHHz6uYuV for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 20:50:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B1024012E
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 20:50:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82A37C0004;
 Mon,  7 Mar 2022 20:50:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRKJS-00113B-FZ; Mon, 07 Mar 2022 21:50:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220222201418.3087618-1-fontaine.fabrice@gmail.com>
Date: Mon, 07 Mar 2022 21:50:38 +0100
In-Reply-To: <20220222201418.3087618-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 22 Feb 2022 21:14:18 +0100")
Message-ID: <87zgm14hcx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: disable JIT with
 mips32r6
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, Peter Seiderer <ps.report@gmx.net>,
 =?utf-8?Q?Ga=C3=ABl?= Portay <gael.portay@collabora.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable JIT with mips32r6 to avoid the following build failure raised
 > since bump to version 5.212.0-alpha4 in commit
 > df0b0fe6919c0d0f3750f439a3cfa765232bd569:

 > /tmp/ccHw2rHQ.s:18: Error: opcode not supported on this processor: mips32r6 (mips32r6) `addi $a0,$sp,-8'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/5191600b463cda078203eeffae880ed989f8ac0f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/qt5/qt5webkit/qt5webkit.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
 > index 2e96acc00f..6f8714140a 100644
 > --- a/package/qt5/qt5webkit/qt5webkit.mk
 > +++ b/package/qt5/qt5webkit/qt5webkit.mk
 > @@ -20,6 +20,10 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
 >  # in the archive.
 >  QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
 
 > +ifeq ($(BR2_MIPS_CPU_MIPS32R6),y)
 > +QT5WEBKIT_CONF_OPTS += -DENABLE_JIT=OFF

Looking a webkitgtk.mk we might need to disable it for older ARM and
MIPS64R6 as well, but OK - That can be done later if needed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
