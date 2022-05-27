Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72EEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 07:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CD68494E;
	Fri, 27 May 2022 07:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Vw_uaERnuSU; Fri, 27 May 2022 07:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6534084949;
	Fri, 27 May 2022 07:38:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC1211BF35C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB4E084949
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNRXam77CB_i for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:38:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1E1484913
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:38:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C0E39100005;
 Fri, 27 May 2022 07:38:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuUXs-000uEk-My; Fri, 27 May 2022 09:38:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
 <20220423203924.1796541-2-fontaine.fabrice@gmail.com>
Date: Fri, 27 May 2022 09:38:04 +0200
In-Reply-To: <20220423203924.1796541-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 23 Apr 2022 22:39:22 +0200")
Message-ID: <87fskvpgrn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 2/4] package/clamav: doesn't build with zlib-ng
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Peter Seiderer <ps.report@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > clamav doesn't build with zlib-ng since bump to version 1.9.9-b1 in
 > commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and the removal of FAR:
 > https://github.com/zlib-ng/zlib-ng/commit/0db1040667b13c0f9405af810f669857a487b08e:

 > In file included from nsis/nsis_zlib.h:32,
 >                  from nsis/nulsft.c:38:
 > nsis/nsis_zutil.h:36:17: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'uchf'
 >    36 | typedef uch FAR uchf;
 >       |                 ^~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/524ee31face8be6a813829b036c4d6134ee5ca98

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Force libzlib instead of depending on it to avoid a recursive
 >    dependency

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
