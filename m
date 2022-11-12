Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB69DC433FE
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 09:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C94813DC;
	Sat, 12 Nov 2022 09:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C94813DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcYDGdc77iUC; Sat, 12 Nov 2022 09:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672658175E;
	Sat, 12 Nov 2022 09:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 672658175E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE3E11BF57B
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 09:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A90AE4018B
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 09:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A90AE4018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSmpZ5iu4tv9 for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 09:07:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27F79400C8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27F79400C8
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 09:07:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:12bc:32e:ad2a:4f42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9646719F58C;
 Sat, 12 Nov 2022 10:07:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Nov 2022 10:07:31 +0100
Date: Sat, 12 Nov 2022 10:07:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <aduskett@gmail.com>
Message-ID: <20221112090731.GA2123054@scaer>
References: <20221111215321.7cfdbc46@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111215321.7cfdbc46@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668244056;
 bh=qVbYMBUFlyIznWAKSp0cg2ALGst8Iy8NqYIQizUoOng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PVVZlgseMDnVpXr+n4R3P3TePprQYQf1D1SjO+WWC8WU23P9wiDqjMvmufWakdWJv
 x4hpUWiwfWeK5/OW37mhMq1YjLTj1IZDUSK+7gjCJCrT5yrOQFCNGWyZs+HJHF4nUl
 AnSjgi2HK4YwE2JsPr02svdUZyRNIRreSAP6burLosJUi3przY5is3kD5yyyfBxVNx
 xsjnpEmj2T0Ed1HQ+SBd3d4GvTkap8cvktFtx6rvuxC12IezqLHVI84HfoSCOhlB9W
 bow+p3Nsbf8L6adrFvhItss6byxbepvfaObpaQMq9zver+pOezsNjt+IQN1EFem2fc
 Lz5JpCUFRva3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PVVZlgse
Subject: Re: [Buildroot] Remaining issue with Dracut runtime tests
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

+Thierry, who submitted dracut in the first place,
+Adam, who I know uses dracut

On 2022-11-11 21:53 +0100, Thomas Petazzoni spake thusly:
> Even after your recent Dracut runtime tests fixes there is still one issue:
> 
> ======================================================================
> FAIL: test_run (tests.fs.test_cpio.TestCpioDracutUclibcMergedUsr)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/support/testing/tests/fs/test_cpio.py", line 105, in test_run
>     self.check_dracut()
>   File "/builds/buildroot.org/buildroot/support/testing/tests/fs/test_cpio.py", line 60, in check_dracut
>     self.assertNotEqual(out.find("usr/lib/libz.so"), -1)
> AssertionError: -1 == -1
> ----------------------------------------------------------------------
> 
> See:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261241
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261239
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261236
> 
> Could you have a look?

The error occurs because we can't find usr/lib/libz.so in the list of
files in the cpio archive:

    $ cat -n support/testing/tests/fs/test_cpio.py
    [...]
    60          self.assertNotEqual(out.find("usr/lib/libz.so"), -1)
    [...]

And it is indeed not there (I used the cpio from the pipeline, of course):

    $ cpio --list <rootfs.cpio |grep lib/libz.so
    lib/libz.so
    lib/libz.so.1
    lib/libz.so.1.2.13

So, wtf? Why is libz in /lib when we expect it in /usr/lib?
Especially since this is a merged-usr to begin with!

    $ grep MERGED_USR .config
    BR2_ROOTFS_MERGED_USR=y

Seriously, what?

Now, where did libzlib install its files?

    cp libz.a /builds/buildroot.org/buildroot/test-output/TestCpioDracutGlibcMergedUsr/target/usr/lib
    chmod 644 /builds/buildroot.org/buildroot/test-output/TestCpioDracutGlibcMergedUsr/target/usr/lib/libz.a
    cp libz.so.1.2.13 /builds/buildroot.org/buildroot/test-output/TestCpioDracutGlibcMergedUsr/target/usr/lib
    chmod 755 /builds/buildroot.org/buildroot/test-output/TestCpioDracutGlibcMergedUsr/target/usr/lib/libz.so.1.2.13

Cool, they were installed in /usr/lib...

Thierry, Adam, presumably you would have an idea on how to investigate
further? Why would dracut misplace files?

Oh, and I looked at dracut, and it is really not meant to be installed
out of / (i.e. with --prefix=/) , because it really hard-codes calls to
files in there. For example, host/lib/dracut/modules.d/99base/dracut-lib.sh
has a line like:
    type wait_for_dev >/dev/null 2>&1 || . /lib/dracut/dracut-dev-lib.sh

So, meh... :-(

Final data point: as usual, the tests run OK here: libz is in /usr/lib,
and /lib is a symlink to /usr/lib, exactly as expected.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
