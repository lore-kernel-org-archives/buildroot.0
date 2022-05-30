Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D91C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EB8540CA2;
	Mon, 30 May 2022 20:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHtXzbPMkln2; Mon, 30 May 2022 20:56:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 702F640C93;
	Mon, 30 May 2022 20:56:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7C4A1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C63C2417D2
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Te2lNfoaZj1R for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:56:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4003041706
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:56:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BFD1A2000B;
 Mon, 30 May 2022 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653944160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zRsqH7q73TCATwa+LuwjgxVgvRN0Q6YmzS2A7u07xo=;
 b=Gsb3lxd4Lnotm1w3N6nSb1nDcNzU7gtW0maOgXvJjZD3AETyBqJraApl+i+cRSPoGw32YP
 X+aN3l+25zSCmjxNH7BUFv/qowlddSjyr79afv9GSA7VxYBpLVoqTzycPa53Jblo379I/D
 q//Vdd0xu0yss5s0P90Dwa1W6LPGDV5E0+kVtlo2BVX2UFtJeWWV9fMsnGoV9+g+xQzsMp
 z2Za+D8AEhLYDScI2tpOLY8LHtUBvGd1Qy1l5S+0426k5BgXBR5MPJ1ed74zi74jSN4cek
 xUaTqybDJi+8aKnTb302Ft2shdwZWrghwqeXVQfGGKeCPku5WOouI2jLE88xog==
Date: Mon, 30 May 2022 22:55:58 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530225558.197a79c9@windsurf>
In-Reply-To: <20220518212015.439865-1-fontaine.fabrice@gmail.com>
References: <20220518212015.439865-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openjpeg: security bump to
 version 2.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 18 May 2022 23:20:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2021-29338: Integer Overflow in OpenJPEG v2.4.0 allows remote
> attackers to crash the application, causing a Denial of Service (DoS).
> This occurs when the attacker uses the command line option "-ImgDir" on
> a directory that contains 1048576 files.
> 
> Fix CVE-2022-1122: A flaw was found in the opj2_decompress program in
> openjpeg2 2.4.0 in the way it handles an input directory with a large
> number of files. When it fails to allocate a buffer to store the
> filenames of the input directory, it calls free() on an uninitialized
> pointer, leading to a segmentation fault and a denial of service.
> 
> Drop patches (already in version)
> 
> https://github.com/uclouvain/openjpeg/blob/v2.5.0/NEWS.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...append-flags-found-by-pkg-config-if-.patch | 72 -------------------
>  ...-append-flags-found-by-pkg-config-if.patch | 49 -------------
>  ...Lists.txt-Don-t-require-a-C-compiler.patch | 34 ---------
>  ...IR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch | 37 ----------
>  package/openjpeg/openjpeg.hash                |  2 +-
>  package/openjpeg/openjpeg.mk                  |  2 +-
>  6 files changed, 2 insertions(+), 194 deletions(-)
>  delete mode 100644 package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch
>  delete mode 100644 package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch
>  delete mode 100644 package/openjpeg/0003-CMakeLists.txt-Don-t-require-a-C-compiler.patch
>  delete mode 100644 package/openjpeg/0004-Revert-Use-INC_DIR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch

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
