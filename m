Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95AEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D1D742685;
	Sat, 28 May 2022 19:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffEnSFFzKrzx; Sat, 28 May 2022 19:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4761942655;
	Sat, 28 May 2022 19:24:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 993421BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 873EC610CB
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eqr4SVVli5UE for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:23:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 603276076A
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:23:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 57ECFC0002;
 Sat, 28 May 2022 19:23:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nv22T-004JeF-Cy; Sat, 28 May 2022 21:23:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220509204641.464787-1-fontaine.fabrice@gmail.com>
Date: Sat, 28 May 2022 21:23:53 +0200
In-Reply-To: <20220509204641.464787-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 9 May 2022 22:46:41 +0200")
Message-ID: <87k0a58nqu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcgi: disable tests
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

 > Disable tests to avoid the following static build failure on sh4aeb:
 > In file included from
 > /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:20:
 > /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/include/libcgi/cgi.h:81:31:
 > note: expected 'char *' but argument is of type 'const char *'
 >    81 | extern int slist_delete(char *name, formvars **start, formvars **last);
 >       |                         ~~~~~~^~~~
 > /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1:
 > error: unable to find a register to spill in class 'FPUL_REGS'
 >   352 | }
 >       | ^
 > /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1: error: this is the insn:
 > (insn 1084 1081 1085 105 (set (reg:SI 4 r4)
 >         (mem/f:SI (post_inc:SI (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])) [0 MEM[base: _414, offset: 0B]+0 S4 A32])) "/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c":323:3 189 {movsi_ie}
 >      (expr_list:REG_INC (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])
 >         (nil)))

 > Fixes:
 >  - http://autobuild.buildroot.org/results/84a2339568d23b328af2416bfcec1ef41eccdce5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
