Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC41C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 22:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA0DA4094E;
	Sat, 11 Dec 2021 22:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WeGkcvHzDknu; Sat, 11 Dec 2021 22:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FBF405C8;
	Sat, 11 Dec 2021 22:42:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FB721BF328
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 22:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DC2860D5F
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 22:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZCOfH4M2axJd for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 22:42:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5387660D5C
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 22:42:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8B0B9240005;
 Sat, 11 Dec 2021 22:42:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwB4Z-00069W-HB; Sat, 11 Dec 2021 23:42:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1637700992.git.yann.morin.1998@free.fr>
 <5c509bf436607ed0fad88c8588973edbee3d0713.1637700992.git.yann.morin.1998@free.fr>
Date: Sat, 11 Dec 2021 23:42:31 +0100
In-Reply-To: <5c509bf436607ed0fad88c8588973edbee3d0713.1637700992.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 23 Nov 2021 21:56:54 +0100")
Message-ID: <8735my3grs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/docker: don't use sudo to build
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > On a properly setup machine, it is totally useless to use sudo to run
 > docker; it is very bad practice. Instead, users really should add
 > themselves to the docker group.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
