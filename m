Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48B6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:46:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0B260F38
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F0B260F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A314401E7;
	Sun, 25 Jul 2021 12:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0PDmVAasWeB; Sun, 25 Jul 2021 12:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E19B40207;
	Sun, 25 Jul 2021 12:46:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 202F31BF470
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09D5140154
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxYpCL6FYPgU for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:46:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF9C0400E5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:46:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 451F0E0005;
 Sun, 25 Jul 2021 12:46:28 +0000 (UTC)
Date: Sun, 25 Jul 2021 14:46:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210725144626.7e1cdcef@windsurf>
In-Reply-To: <20210724221850.764936-1-fontaine.fabrice@gmail.com>
References: <20210724221850.764936-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libffi: bump to version 3.4.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 25 Jul 2021 00:18:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use official tarball
> - Drop fourth to seventh patches (already in version)
> - Update hash of LICENSE file (update in year:
>   https://github.com/libffi/libffi/commit/2bdc8e52efb78d939f23efb4f9c515355610bff5
>   https://github.com/libffi/libffi/commit/b844a9c7f1ca792a1dfb0c09d5dae576178e6729)
> - Update indentation in hash file (two spaces)
> 
> https://github.com/libffi/libffi/blob/v3.4.2/README.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...pc.h-fix-build-failure-with-powerpc7.patch | 51 -------------------
>  ...ix-build-failure-on-power7-and-older.patch | 39 --------------
>  ...6-Address-platforms-with-no-__int128.patch | 28 ----------
>  ...y-to-help-platforms-with-no-__int128.patch | 42 ---------------
>  package/libffi/libffi.hash                    |  4 +-
>  package/libffi/libffi.mk                      |  7 +--
>  6 files changed, 6 insertions(+), 165 deletions(-)
>  delete mode 100644 package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
>  delete mode 100644 package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch
>  delete mode 100644 package/libffi/0006-Address-platforms-with-no-__int128.patch
>  delete mode 100644 package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
