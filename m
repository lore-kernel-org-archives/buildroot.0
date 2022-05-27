Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC26DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 18:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D483819D2;
	Fri, 27 May 2022 18:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4AMfaCnxTzg; Fri, 27 May 2022 18:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C44681902;
	Fri, 27 May 2022 18:56:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6211BF255
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BC0B818E6
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o22IBSdQ6g_n for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 18:56:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 295EE818C4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 18:56:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 28C26E0007;
 Fri, 27 May 2022 18:56:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuf8d-002FZP-9a; Fri, 27 May 2022 20:56:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220428213639.21B9184719@busybox.osuosl.org>
Date: Fri, 27 May 2022 20:56:43 +0200
In-Reply-To: <20220428213639.21B9184719@busybox.osuosl.org> (Yann E. MORIN's
 message of "Thu, 28 Apr 2022 23:45:07 +0200")
Message-ID: <877d66iz2s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/elf2flt: update to version
 2021.08
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=65d78dcfeb8b2eafaebe2d0c3c8c42e7e85f46ac
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > It contains several fixes and improvements compared to our current
 > version, and two of our patches have been accepted upstream. Most
 > notably, it fixes the issue we had in using elf2flt with recent
 > versions of binutils (upstream commit
 > ba379d08bb78c9300e84351c11080c26ddcc36b3).

 > Patch 0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch
 > is upstream as of commit 1c9b454336eaf38f7d037917a3120fae04193fbe

 > Patch 0002-elf2flt.c-add-new-relocation-types-for-xtensa.patch is
 > upstream as of commit d7eb73163bcea31168c438fc132a0967ac172e3d

 > The other two patches are refreshed to apply properly on 2021.08.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
