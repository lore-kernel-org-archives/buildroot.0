Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962ABC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B9B260EA8;
	Sun, 30 Jan 2022 22:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ed-ksdhIzHKV; Sun, 30 Jan 2022 22:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5160860EA4;
	Sun, 30 Jan 2022 22:43:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6EE1BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F8640211
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hb6rRy27OLBe for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:42:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7913401D1
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:42:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 41CB440002;
 Sun, 30 Jan 2022 22:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643582574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLqlLTQ6XabaFz7YThin7Al3g07sbAdn766HrVlD+Sg=;
 b=fb4/PnPH2MvLTDQSHZ+NvcpyWyvBb1tp1uN3QiZNxWrY4+UgJOIsUxPY070yzvTBQ94umU
 d86Uq5keUTLEPAo2FS5IhAkQR2M1NfI3oCJNJbJilG4qErXC9+I2OPtEG3KhcmyMmmoCO/
 3HA1TmQvFGqa2nS/NRgGF/mgqpgi205dV0ENcQsEoz8DO0JHBqdj/l3Tc74v6ImXcIAi7G
 fSnyuX8tDlPGuRer3U4FtGKEWifCw2QvfQSlO9FE4K5NJ16qTlQFCsNK5LiLirbg70hye1
 FJrzNFYpwcLUht1OEY4f73QiRpYb0fZHaq6L3CjRubTo5e7rDN2QssbjVKq+ig==
Date: Sun, 30 Jan 2022 23:42:53 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220130234253.2023aa22@windsurf>
In-Reply-To: <20220128124538.31789-3-ps.report@gmx.net>
References: <20220128124538.31789-1-ps.report@gmx.net>
 <20220128124538.31789-3-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 3/3] package/log4cxx: bump version to
 0.12.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jan 2022 13:45:38 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - drop 0001-LOGCXX-528.patch (from upstream [1])
> - renumber remainnig patch
> 
> Changelog (for deteils see [2]):
> 
> - This is a minor bugfix release to fix issues found with 0.12.0. Notably,
>   this version fixes a bug where a multithreaded application would crash
>   when using a rolling file.
> 
>   [LOGCXX-534] - Crashed in log->forcedLog function when running with multi-thread
>   [LOGCXX-528] - log4cxx fails to build on Centos 7.6 / g++ 4.8.5 / Boost 1.53
> 
> [1] https://github.com/apache/logging-log4cxx/commit/249dd85494a430d95fd69d89f42b02fd950cda51
> [2] https://logging.apache.org/log4cxx/latest_stable/changelog.html#0.12.1
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/log4cxx/0001-LOGCXX-528.patch         | 189 ------------------
>  ...ly-check-for-boost-if-really-needed.patch} |   0
>  package/log4cxx/log4cxx.hash                  |   4 +-
>  package/log4cxx/log4cxx.mk                    |   2 +-
>  4 files changed, 3 insertions(+), 192 deletions(-)
>  delete mode 100644 package/log4cxx/0001-LOGCXX-528.patch
>  rename package/log4cxx/{0002-boost-fallback-only-check-for-boost-if-really-needed.patch => 0001-boost-fallback-only-check-for-boost-if-really-needed.patch} (100%)

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
