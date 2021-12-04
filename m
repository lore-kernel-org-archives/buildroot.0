Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06053C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6FD0400E9;
	Sat,  4 Dec 2021 22:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_ZcrSMx8U9S; Sat,  4 Dec 2021 22:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6728401AF;
	Sat,  4 Dec 2021 22:00:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7641BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B480405B3
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOdKG-Kdds5O for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:00:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11EDF40290
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:00:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F22631C0005;
 Sat,  4 Dec 2021 22:00:48 +0000 (UTC)
Date: Sat, 4 Dec 2021 23:00:47 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211204230047.6169f746@windsurf>
In-Reply-To: <20211125223043.397316-1-fontaine.fabrice@gmail.com>
References: <20211125223043.397316-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/azmq: bump to version 1.0.3
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
Cc: RJ Ascani <rj.ascani@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Nov 2021 23:30:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch and use AZMQ_NO_TESTS which is available since
>   https://github.com/zeromq/azmq/commit/3548638b9b3452a0526a1acb340ca7a92acf4f7c
> - boost log (and so NPTL) is not a dependency since
>   https://github.com/zeromq/azmq/commit/3548638b9b3452a0526a1acb340ca7a92acf4f7c
> - boost regex is not a dependency since
>   https://github.com/zeromq/azmq/commit/209ccdc318bee195c92eaf86ed2fcc4acf08be1e
> - Update indentation in hash file (two spaces)
> 
> https://github.com/zeromq/azmq/releases/tag/v1.0.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...tionally-disable-test-and-doc-builds.patch | 43 -------------------
>  package/azmq/Config.in                        |  8 ++--
>  package/azmq/azmq.hash                        |  5 +--
>  package/azmq/azmq.mk                          |  4 +-
>  4 files changed, 8 insertions(+), 52 deletions(-)
>  delete mode 100644 package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
