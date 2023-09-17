Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88275CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 06:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16C784117E;
	Sun, 17 Sep 2023 06:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16C784117E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFcN57IFR6o6; Sun, 17 Sep 2023 06:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7380640567;
	Sun, 17 Sep 2023 06:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7380640567
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9487C1BF424
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E47C81420
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E47C81420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0M3ulcszK3XG for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 06:45:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CE8081403
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 06:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CE8081403
Received: by mail.gandi.net (Postfix) with ESMTPSA id 586DEFF802;
 Sun, 17 Sep 2023 06:45:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qhlWr-00B1c0-21; Sun, 17 Sep 2023 08:45:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <a55c91fd6ba2fdefaf885d631c6a74eb69fb81a1.1694556946.git.yann.morin.1998@free.fr>
Date: Sun, 17 Sep 2023 08:45:12 +0200
In-Reply-To: <a55c91fd6ba2fdefaf885d631c6a74eb69fb81a1.1694556946.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 13 Sep 2023 00:15:48 +0200")
Message-ID: <87il89ti13.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/5] package/qt5: fix upstream git trees
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since commits 4e8b5f9bee9c [0], 6cfbd51d98d1 [1], and d838a416c4ed [2],
 > the repository we clone from is the cgit browser, and it does not serve
 > the git tree, only the browser:

 >     $ git clone https://code.qt.io/cgit/qt/qtcoap.git
 >     Cloning into 'qtcoap'...
 >     fatal: repository 'https://code.qt.io/cgit/qt/qtcoap.git/' not found

 > Browsing there displays the cgit UI, which gives a proper URI to clone
 > from; switch to using that.

 > [0] 4e8b5f9bee9c package/qt5/qt5mqtt: bump version to 5.15.2 (and fix download)
 > [1] 6cfbd51d98d1 package/qt5/qt5coap: bump version to 5.15.2 (and fix download)
 > [2] d838a416c4ed package/qt5/qt5knx: bump version to 5.15.2 (and fix download)

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

I guess it must be upstream changing something on the server since 2021,
otherwise how could we have a copy on s.b.o?

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
