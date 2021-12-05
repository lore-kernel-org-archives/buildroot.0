Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AA9C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C79404C4;
	Sun,  5 Dec 2021 10:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvCwX8SGlBkP; Sun,  5 Dec 2021 10:10:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E033404A7;
	Sun,  5 Dec 2021 10:10:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36C141BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2747D404A7
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCmkN_vC7743 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:10:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D4D240478
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:10:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6AB5AE0003;
 Sun,  5 Dec 2021 10:10:24 +0000 (UTC)
Date: Sun, 5 Dec 2021 11:10:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211205111023.5b9db88f@windsurf>
In-Reply-To: <20211124172913.3969098-1-fontaine.fabrice@gmail.com>
References: <20211124172913.3969098-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/dmalloc: bump to version
 5.6.5
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

On Wed, 24 Nov 2021 18:29:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop second to fifth patches (already in version)
> - License is ISC since version 5.6.2 and
>   https://github.com/j256/dmalloc/commit/eda734a8ba3ab4c03b3593636186dc3fc777b09d
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dmalloc/0001-mips.patch               | 18 ++++----
>  package/dmalloc/0002-fix-parallel-build.patch | 18 --------
>  package/dmalloc/0003-fix-shlibs.patch         | 46 -------------------
>  package/dmalloc/0004-fix-strdup.patch         | 24 ----------
>  package/dmalloc/0005-fix-strndup.patch        | 24 ----------
>  package/dmalloc/dmalloc.hash                  |  4 +-
>  package/dmalloc/dmalloc.mk                    |  7 ++-
>  7 files changed, 15 insertions(+), 126 deletions(-)
>  delete mode 100644 package/dmalloc/0002-fix-parallel-build.patch
>  delete mode 100644 package/dmalloc/0003-fix-shlibs.patch
>  delete mode 100644 package/dmalloc/0004-fix-strdup.patch
>  delete mode 100644 package/dmalloc/0005-fix-strndup.patch

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
