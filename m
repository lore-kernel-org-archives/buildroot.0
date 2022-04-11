Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826DCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 09:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336A841553;
	Mon, 11 Apr 2022 09:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDXabMrVyTOl; Mon, 11 Apr 2022 09:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C1C14152B;
	Mon, 11 Apr 2022 09:43:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6A361BF44A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B34744019F
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHnBIHWPjX2V for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 09:43:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C07B9400E4
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 09:43:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6A77F1C0010;
 Mon, 11 Apr 2022 09:43:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndqaF-0062Zs-HS; Mon, 11 Apr 2022 11:43:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220406162344.4005462-1-fontaine.fabrice@gmail.com>
Date: Mon, 11 Apr 2022 11:43:43 +0200
In-Reply-To: <20220406162344.4005462-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 6 Apr 2022 18:23:44 +0200")
Message-ID: <87bkx8hs4w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-gmmlib: needs C++
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
 Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > intel-gmmlib needs C++ since its addition in commit
 > 93e4ee81a2e3e163bf74c24b6ec68f9446f96ae4 and
 > https://github.com/intel/gmmlib/commit/7a1ec78c0bc74939ba3ef61854f98eb4d7267cc3:

 > CMake Error at /nvmedata/autobuild/instance-15/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
 >   The C++ compiler

 >     "/usr/bin/clang++"

 >   is not able to compile a simple test program.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8cadfee0288a05676868e05d56243d866cbf051d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
