Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7DDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACFD685A3F;
	Sun, 12 Dec 2021 22:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhPdOFJH3n8s; Sun, 12 Dec 2021 22:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23EEF85A18;
	Sun, 12 Dec 2021 22:13:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88FC71BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 785DC404B7
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wfVhnf9QZ2RG for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:13:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F97E4043E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:13:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6E3E6E0003;
 Sun, 12 Dec 2021 22:12:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwX5U-0002VS-Pp; Sun, 12 Dec 2021 23:12:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211109165908.1942790-1-yann.morin.1998@free.fr>
 <20211109165908.1942790-2-yann.morin.1998@free.fr>
Date: Sun, 12 Dec 2021 23:12:56 +0100
In-Reply-To: <20211109165908.1942790-2-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 9 Nov 2021 17:59:08 +0100")
Message-ID: <87a6h5wjyv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] support/dependencies: avoid spurious
 warning on print-vars
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When calling 'printvars', the 'suitable-host-package' macro is printed
 > (a macro is just a variable like the others, after all, just with some
 > parameters). Because it is printed as a variable, it is missing its
 > parameters, but it still tries to evaluate the $(shell) construct.

 > This causes spurious warning:

 >     make[1]: support/dependencies/check-host-.sh: Command not found

 > Only try and call the script if there is actually a tool to check for.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
