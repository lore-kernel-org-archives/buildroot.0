Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088C4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 18:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3AF460E4E;
	Mon, 28 Feb 2022 18:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLzyOfgqW0DC; Mon, 28 Feb 2022 18:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 022A760E46;
	Mon, 28 Feb 2022 18:55:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BBD31BF2CE
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59DA560E46
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycyqGcUiUq8k for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 18:55:39 +0000 (UTC)
X-Greylist: delayed 00:16:22 by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6944260E3E
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 18:55:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0E763E0002;
 Mon, 28 Feb 2022 18:55:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nOlBH-00ECHn-NW; Mon, 28 Feb 2022 19:55:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220225231816.1648877-1-fontaine.fabrice@gmail.com>
Date: Mon, 28 Feb 2022 19:55:35 +0100
In-Reply-To: <20220225231816.1648877-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 26 Feb 2022 00:18:16 +0100")
Message-ID: <87bkyqzuqg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: security bump to
 version 8.9p1
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

 > Security Near Miss
 > ==================

 >  * sshd(8): fix an integer overflow in the user authentication path
 >    that, in conjunction with other logic errors, could have yielded
 >    unauthenticated access under difficult to exploit conditions.

 >    This situation is not exploitable because of independent checks in
 >    the privilege separation monitor. Privilege separation has been
 >    enabled by default in since openssh-3.2.2 (released in 2002) and
 >    has been mandatory since openssh-7.5 (released in 2017). Moreover,
 >    portable OpenSSH has used toolchain features available in most
 >    modern compilers to abort on signed integer overflow since
 >    openssh-6.5 (released in 2014).

 > Update license (md5crypt removed, bcrypt relicensed to BSD-3-Clause:
 > https://github.com/openssh/openssh-portable/commit/a5ab4882348d26addc9830a44e053238dfa2cb58
 > https://github.com/openssh/openssh-portable/commit/158bf854e2a22cf09064305f4a4e442670562685
 > https://github.com/openssh/openssh-portable/commit/c0459588b8d00b73e506c6095958ecfe62a4a7ba)

 > https://www.openssh.com/txt/release-8.9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
