Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68AEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 13:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60EFC60AEA;
	Tue, 28 Dec 2021 13:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXWrFNTagIbv; Tue, 28 Dec 2021 13:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AADFB60ADD;
	Tue, 28 Dec 2021 13:17:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C15DD1BF363
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD93481361
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMXDN1fvGh-X for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 13:17:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D733781349
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 13:17:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1DE941C0002;
 Tue, 28 Dec 2021 13:17:45 +0000 (UTC)
Date: Tue, 28 Dec 2021 14:17:44 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211228141744.362827c7@windsurf>
In-Reply-To: <20211104182756.1313345-1-aduskett@gmail.com>
References: <20211104182756.1313345-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pcm-tools: bump to version
 202110
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

On Thu,  4 Nov 2021 11:27:56 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Changes:
>   - Update LICENSE hash due to a year bump.
> 
>   - Remove 0001-Look-for-pcm-core-at-the-default-path.patch in favor of
>     the upstream patch
>     0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch
> 
>   - Add -fPIC to the CXXFLAGS to prevent the error:
>   "msr.o: relocation R_X86_64_PC32 against symbol `_ZTVN3pcm9MsrHandleE' can
>   not be used when making a shared object; recompile with -fPIC"
> 
>   - Depend on Python3 for the pmu-query script.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...ook-for-pcm-core-at-the-default-path.patch |  46 --------
>  ...-python3-errors-add-linux-platform-s.patch | 103 ++++++++++++++++++
>  package/pcm-tools/Config.in                   |  10 +-
>  package/pcm-tools/pcm-tools.hash              |   4 +-
>  package/pcm-tools/pcm-tools.mk                |   4 +-
>  5 files changed, 111 insertions(+), 56 deletions(-)
>  delete mode 100644 package/pcm-tools/0001-Look-for-pcm-core-at-the-default-path.patch
>  create mode 100644 package/pcm-tools/0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
