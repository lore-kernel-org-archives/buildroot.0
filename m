Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB08C001B0
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 19:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DB88410AC;
	Mon, 17 Jul 2023 19:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB88410AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEW3j3F_0OLZ; Mon, 17 Jul 2023 19:17:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4AD410A8;
	Mon, 17 Jul 2023 19:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D4AD410A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9324F1BF36A
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 19:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78D4D60EAA
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 19:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D4D60EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DaC6uSzDQSf for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 19:16:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 459B960D75
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 459B960D75
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 19:16:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6cdc:9b6a:15a8:aa0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5227BB0072A;
 Mon, 17 Jul 2023 21:16:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Jul 2023 21:16:52 +0200
Date: Mon, 17 Jul 2023 21:16:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230717191652.GB1080294@scaer>
References: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
 <20230717183817.GA1080294@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717183817.GA1080294@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689621416;
 bh=ORNMfIo/JxH1913lLeUZ+wtjOJv/c4d5TrZCmkIK0NI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f+GiYmzU67Di+N2rvh7n2TnGt+CWsJsvA2xDFpuYWL6UgFUP5NhGMlBgmCt9wW5Ri
 PRMSdJMsZnXzRHyiwH+uWwaAy0Lgc5lhON7KWXopLDXNmIzAkVQTU5+jBRvJhunXbt
 xSW2q2ImWuRcpwtlB8ej+xMiQQzz7YiQRT1b66sl2AeuMLLOzIIac36vE/YP6d+HCA
 oyE0alAyYH6dOceAHwyBYLO6nr/Ziu2xsIrYt5VjTLbNRnOXKGdRZPpMbVrQS3TfjS
 lS1cyY33JInxN11YlNTopy/UBUZ01zThKRQNy8d2w17S5fV3qFYNkLDZrFPSJ9SKeA
 Ly1v7iF+ecH2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f+GiYmzU
Subject: Re: [Buildroot] Flutter-engine package help wanted.
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

Folloing our discussion on IRC, it turns out that I got it partly
(mostly) wrong.

On 2023-07-17 20:38 +0200, Yann E. MORIN spake thusly:
> On 2023-07-14 20:02 -0700, Adam Duskett spake thusly:

So, we do not need to download anything from the flutter repo; we just
need a file, .gclient, that contains directives for gclient to perform
the actual download.

As an aside, gclient is like repo (another google tool, I guess), right?

So, basically, what you did in your .mk looks like I would have done,
except no using _DL_DIR as a scratch-dir to do the download, but in a
sub-dir of the package dir (see my previous reply).

Finally: gclient runs git-clone, we can't have stability in that, it's
not reproducible.

If the .git dirs really need to be present at configure/build time,
we're borked, we can't hash the generated tarball.

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
