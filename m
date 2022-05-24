Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15392C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 15:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A05B560B77;
	Tue, 24 May 2022 15:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxMntAceVrmY; Tue, 24 May 2022 15:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDBED60C2B;
	Tue, 24 May 2022 15:05:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF4E1BF395
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDF6460C2B
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sd4hF5e2D2AR for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 15:05:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1793060B77
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:05:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 61837E0009;
 Tue, 24 May 2022 15:05:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ntW6Z-00F6jS-HS; Tue, 24 May 2022 17:05:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220419090346.2029839-1-fontaine.fabrice@gmail.com>
Date: Tue, 24 May 2022 17:05:51 +0200
In-Reply-To: <20220419090346.2029839-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Apr 2022 11:03:45 +0200")
Message-ID: <87bkvnt1gw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/expat: disable examples,
 tests and xmlwf
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

 > Disable examples and tests (enabled by default) through
 > --without-{examples,tests} which are available since version 2.2.7 and
 > https://github.com/libexpat/libexpat/commit/1fdfd8a1b490f8ac9e7e11896298e41cc210d87d

 > Also disable xmlwf (a binary that determines if an XML document is
 > well-formed) through --without-xmlwf which is available since version
 > 2.2.4 and
 > https://github.com/libexpat/libexpat/commit/9d950527a07783c104aada685384edf3f8f23f8a

 > This will fix the following build failure on riscv64:

 > ERROR: reloc type R_RISCV_SET6 unsupported in this context

 > Fixes:
 >  - http://autobuild.buildroot.org/results/99890c9c7ebe3266dd533c81352a3cbcf4d3d738

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
