Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5080CFA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF00440356;
	Mon, 31 Oct 2022 10:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF00440356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4SVBkIAaNfu; Mon, 31 Oct 2022 10:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E283C40336;
	Mon, 31 Oct 2022 10:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E283C40336
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43E691BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B16840336
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B16840336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68LWIe629p-r for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:40:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 485214031E
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 485214031E
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:40:26 +0000 (UTC)
Date: Mon, 31 Oct 2022 10:40:14 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Message-Id: <2N5MKR.3RVYNROA50C41@crapouillou.net>
In-Reply-To: <20221030230410.982946-1-paul@crapouillou.net>
References: <20221030230410.982946-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1667212823; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fs2tOBa0jL8yTUnjR/lKb7p/zblRkcHUUkA39d3Xewc=;
 b=FEDFqJS1UQ1mB4MSz9aPPELv6w5U11WveElJGtlr38jKYQ59d3NQikx3y+rwQVitmaMiL+
 ScN7Gr8vBNLliCa725E24xZ4rOgALyE5MZg8ZfleYSdf4eWBlkwTCM0yy6aMRvUeI/KJp1
 Qq832xuyEPkhow/dDFoYNugAWcx6Fps=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=FEDFqJS1
Subject: Re: [Buildroot] [PATCH 1/1] package/glmark2: add patch to fix GCC
 12 build
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



Le dim. 30 oct. 2022 =E0 23:04:10 +0000, Paul Cercueil =

<paul@crapouillou.net> a =E9crit :
> Add a patch cherry-picked from upstream to fix the build with GCC 12.
> =

> Upstream commit is d1ca3f53c96dc8a4048b17dc16147a8fac782d4a.
> I don't know if it fixes any autobuilder errors, I noticed the bug =

> when
> building locally.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  ...ibmatrix-Add-missing-utility-include.patch | 29 =

> +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 =

> package/glmark2/0002-libmatrix-Add-missing-utility-include.patch
> =

> diff --git =

> a/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch =

> b/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch
> new file mode 100644
> index 0000000000..2a658393ae
> --- /dev/null
> +++ b/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch
> @@ -0,0 +1,29 @@
> +From d1ca3f53c96dc8a4048b17dc16147a8fac782d4a Mon Sep 17 00:00:00 =

> 2001
> +From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
> +Date: Mon, 14 Feb 2022 13:54:09 +0200
> +Subject: [PATCH] libmatrix: Add missing <utility> include
> +
> +Fixes compilation with GCC 12.
> +
> +Fixes #169

Forgot I had to sign the patch too:
Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> +---
> + Upstream commit: d1ca3f53c96dc8a4048b17dc16147a8fac782d4a
> +
> + src/libmatrix/program.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/libmatrix/program.h b/src/libmatrix/program.h
> +index f95b470..1c9de08 100644
> +--- a/src/libmatrix/program.h
> ++++ b/src/libmatrix/program.h
> +@@ -15,6 +15,7 @@
> + #include <string>
> + #include <vector>
> + #include <map>
> ++#include <utility>
> + #include "mat.h"
> +
> + // Simple shader container.  Abstracts all of the OpenGL bits, but =

> leaves
> +--
> +2.35.1
> +
> --
> 2.35.1
> =



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
