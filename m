Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0686AEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89DDA81E08;
	Sun, 25 Jun 2023 14:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89DDA81E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7P_j6qlCNrA; Sun, 25 Jun 2023 14:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C68819BE;
	Sun, 25 Jun 2023 14:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6C68819BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5D41BF909
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E33ED60B8F
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33ED60B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSYH0mJICtm8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:08:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C56AA60B45
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56AA60B45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B266684AC0; Sun, 25 Jun 2023 14:08:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 15:54:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7347b438eb4782e34add5ffdf3b6786ff874820
X-Git-Newrev: 01aa39247c239f0dfdee13b0861e0a98bb1f2547
X-Patchwork-Hint: ignore
Message-Id: <20230625140857.B266684AC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: switch back to
 local setuptools distutils
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=01aa39247c239f0dfdee13b0861e0a98bb1f2547
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We overrode the default in 4386bbdf0895dbb35e02c25f42603bae9af64451 to
work around target shebang bug, as this issue no longer appears to be
present lets revert back to the local version as this is what will be
use in the future when distutils is removed from the python stdlib.

Tested with:
$ support/testing/run-tests -d dl -o output_folder -k tests.package.test_ipython.TestIPythonPy3
15:43:26 TestIPythonPy3                           Starting
15:43:27 TestIPythonPy3                           Building
15:49:35 TestIPythonPy3                           Building done
Downloading to /home/buildroot/buildroot/dl/tmp_iyk_fn6
Renaming from /home/buildroot/buildroot/dl/tmp_iyk_fn6 to /home/buildroot/buildroot/dl/kernel-versatile-5.10.7
Downloading to /home/buildroot/buildroot/dl/tmpokk23l2z
Renaming from /home/buildroot/buildroot/dl/tmpokk23l2z to /home/buildroot/buildroot/dl/versatile-pb-5.10.7.dtb
15:50:04 TestIPythonPy3                           Cleaning up
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
