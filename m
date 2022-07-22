Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB8BC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D586D409DA;
	Fri, 22 Jul 2022 06:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D586D409DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjBFfar4YaS7; Fri, 22 Jul 2022 06:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB770409D7;
	Fri, 22 Jul 2022 06:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB770409D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF2571BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A956A60BDC
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A956A60BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfKeAPcigy98 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:24:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 896D060B5A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 896D060B5A
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:24:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 166B160004;
 Fri, 22 Jul 2022 06:24:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oEm5l-0030G3-1G; Fri, 22 Jul 2022 08:24:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220628213448.2886869-1-fontaine.fabrice@gmail.com>
Date: Fri, 22 Jul 2022 08:24:52 +0200
In-Reply-To: <20220628213448.2886869-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 28 Jun 2022 23:34:48 +0200")
Message-ID: <87mtd1zmtn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libsndfile: fix libsndfile.pc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with libsamplerate or minimodem raised
 > since bump to version 1.1.0 in commit
 > c59a9d12b7805f2ac08be81fe18a4ebc197d5cd9:

 > powerpc-buildroot-linux-uclibc-gcc.br_real: error:
 > EXTERNAL_MPEG_LIBS@: No such file or directory

 > Add host-pkgconf dependency to avoid the following build failure when
 > running autoreconf:

 > configure.ac:345: error: macro PKG_INSTALLDIR is not defined; is a m4 file missing?
 > m4/ax_require_defined.m4:35: AX_REQUIRE_DEFINED is expanded from...

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6de2d7634b1958693b7cf96fbcc79121f92347e9
 >  - http://autobuild.buildroot.org/results/bf66b19cacd6394957f534035af647ddd8037d60

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Add host-pkgconf dependency

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
