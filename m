Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACE8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3757741223;
	Fri, 27 May 2022 09:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZrKkn7KTy6Ll; Fri, 27 May 2022 09:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CEDD41335;
	Fri, 27 May 2022 09:42:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 959C91BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83F6541221
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5Z-OAv6D7aN for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:42:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEB8A4056C
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:42:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3719C20009;
 Fri, 27 May 2022 09:42:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuWUc-001mNJ-7C; Fri, 27 May 2022 11:42:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
References: <20220425111148.87319-1-tianyuanhao3@163.com>
 <20220428113929.1018091-1-tianyuanhao3@163.com>
Date: Fri, 27 May 2022 11:42:50 +0200
In-Reply-To: <20220428113929.1018091-1-tianyuanhao3@163.com> (TIAN Yuanhao's
 message of "Thu, 28 Apr 2022 04:39:29 -0700")
Message-ID: <87mtf3jopx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/udev: move render and sgx to
 package/systemd
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
Cc: Carlos Santos <unixmania@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "TIAN" == TIAN Yuanhao <tianyuanhao3@163.com> writes:

 > Moved groups render and sgx from UDEV_USERS to SYSTEMD_USERS as they
 > currently only appear in systemd's udev rules.

 > In systemd, group render was introduced since commit 4e15a73, and group
 > sgx was introduced since commit c9c4899.

 > In eudev, group render was introduced since commit bb070c1, but was
 > removed since commit a8ffcd1 [1].

 > [1]: https://github.com/eudev-project/eudev/issues/160

 > Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Carlos Santos <unixmania@gmail.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---

 > Changes v2: UDEV_USERS_SYSTEMD to SYSTEMD_USERS

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
