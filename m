Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5078EC32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE93161125;
	Sat, 24 Sep 2022 21:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE93161125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfVfx6nbIeJQ; Sat, 24 Sep 2022 21:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9696860C04;
	Sat, 24 Sep 2022 21:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9696860C04
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 212921BF95D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6474A41D32
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6474A41D32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuPhw-y8MM-8 for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:42:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBD17415E6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBD17415E6
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:42:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33FBAC0002;
 Sat, 24 Sep 2022 21:42:16 +0000 (UTC)
Date: Sat, 24 Sep 2022 23:42:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220924234215.78ffe271@windsurf>
In-Reply-To: <20220924213217.183647-1-fontaine.fabrice@gmail.com>
References: <20220924213217.183647-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664055736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLGs5rtlWJdJhljXtLpJQ8x8GRzqu0S7PBYKmjScQts=;
 b=bc5/WmyK2ujD2ueFaDGg5Km+PoNz+fMeA/h4PnsGTdYpteVNtC8vTxWuxyK9LZWiZwoFVM
 mpJBA6eXscx+oUHs2xpADlO75fJtf0e5oGCh2V0UXaZpGwJOiWznoDe+pMu8mDps6ViacR
 NtPk3NkF4y3ShoGfg9G13JaXscv4BUE/iN0XHDTaJhdE883i+V99W6u8wL/eXS/bEvbM7b
 zYvtvke3YkxnJtfFvX6dT3CGEz1iy/uGwyggk+GE+gP3HGa1B86CqwS0HK/EjHUEWcZlJ/
 6h9eSTRhQ9GYb3rDyM+U0tfY9cyaTG8909Kz4Sh0tNDOk6ReUcskgGylQQ9p4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bc5/WmyK
Subject: Re: [Buildroot] [PATCH 1/1] package/sane-backends: bump to version
 1.1.1
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

On Sat, 24 Sep 2022 23:32:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop second to fifth patches (already in version)
> 
> https://gitlab.com/sane-project/backends/-/releases/1.1.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-genesys-fix-gcc-4.8-compile.patch    | 50 ----------------
>  ...ep-instead-of-std-this_thread-sleep_.patch | 46 ---------------
>  ...-fix-uclibc-compile-include-stdarg.h.patch | 58 ------------------
>  ...canutil-fix-uclibc-compile-include-s.patch | 59 -------------------
>  package/sane-backends/sane-backends.hash      |  4 +-
>  package/sane-backends/sane-backends.mk        |  4 +-
>  6 files changed, 4 insertions(+), 217 deletions(-)
>  delete mode 100644 package/sane-backends/0002-genesys-fix-gcc-4.8-compile.patch
>  delete mode 100644 package/sane-backends/0003-genesys-use-usleep-instead-of-std-this_thread-sleep_.patch
>  delete mode 100644 package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch
>  delete mode 100644 package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch

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
