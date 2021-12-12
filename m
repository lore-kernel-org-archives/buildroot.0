Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D56C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC4BB40645;
	Sun, 12 Dec 2021 22:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ALeJDgpF7Fu; Sun, 12 Dec 2021 22:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E98F4400D2;
	Sun, 12 Dec 2021 22:09:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C34851BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE7BA41F7A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgytQOxC7m6R for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:08:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7442A41F76
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:08:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0F489200003;
 Sun, 12 Dec 2021 22:08:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwX1a-00029x-Vf; Sun, 12 Dec 2021 23:08:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211109165435.1937116-1-yann.morin.1998@free.fr>
Date: Sun, 12 Dec 2021 23:08:54 +0100
In-Reply-To: <20211109165435.1937116-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 9 Nov 2021 17:54:35 +0100")
Message-ID: <87ilvtwk5l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] core/show-info: report build_dir relative
 to CONFIG_DIR
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the build_dir field is reported relative to $(BASE_DIR), to
 > avoid leaking local paths.

 > However, BASE_DIR is not a directory that is very convenient: for
 > in-tree builds, it is $(CONFIG_DIR)/output/, while for out-of-tree
 > builds, it is $(CONFIG_DIR). This difference is purely an idiosyncracy
 > of how out-of-tree builds have been implemented in Buildroot, and is
 > not under the control of the user.

 > What the user is in control of, however, is where the .config file is
 > located. This, really, is the directory we should base relative paths
 > on.

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
