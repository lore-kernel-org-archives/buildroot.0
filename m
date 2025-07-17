Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19AAC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1DB4409A3;
	Thu, 17 Jul 2025 20:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJJA_E-OesQ6; Thu, 17 Jul 2025 20:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4472408B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4472408B4;
	Thu, 17 Jul 2025 20:06:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64395DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61D6F607DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5shUulcWmCxp for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7914960750
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7914960750
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7914960750
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:06:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 68E56B977AA5; Thu, 17 Jul 2025 22:06:20 +0200 (CEST)
Message-ID: <66e85e30-e859-4b5b-addc-bd767597f57a@rnout.be>
Date: Thu, 17 Jul 2025 22:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250710143244.678848-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250710143244.678848-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782780; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=zDEh5JTTw1kxhZDrUByCTAKUIcsqon0YybvW9TT3tCw=;
 b=UbZrr1NAXgyQF0Dz891F22UJ65AcKwIzBcDo+a4PDNeOANkYONArXmGNzH4En8RW/9PLKT
 BMcF9BGG1OvuXsznPQlUmUdWscP+OkdomLmb8mCTQNwY/duRM1iWJN/x2JCFH3E6mCTMga
 OO1Jva/Ky9x+hX3TYT8bh6vI/kLOe5iIVoDdlLPd5P5lqFyYP/NRzUHpvHFr4gmM9YfS/X
 u7ccsTo4CphpQv3m47FBMAQHoxmEOkOoHCh0R962BJdUMRCTKiAE/ziLm7hZn2AyOe46Dz
 1ImS9H0uMLTobfP0qN/IG6LNlL+mwns/hOnZBKTYHuEEkUmfYbYKjg1nLUEfAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UbZrr1NA
Subject: Re: [Buildroot] [PATCH] package/libargtable2: fix build error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/07/2025 16:32, Thomas Perale via buildroot wrote:
> The following build error is happening on the autobuilder:
> 
> ```
> arg_int.c:60:12: error: implicit declaration of function 'isspace' [-Wimplicit-function-declaration]
>     60 |     while (isspace(*ptr))
>        |            ^~~~~~~
> arg_int.c:33:1: note: include '<ctype.h>' or provide a declaration of 'isspace'
>     32 | #include <limits.h>
>    +++ |+#include <ctype.h>
>     33 |
> arg_int.c:89:8: error: implicit declaration of function 'toupper' [-Wimplicit-function-declaration]
>     89 |    if (toupper(*ptr++)!=toupper(X))
>        |        ^~~~~~~
> arg_int.c:89:8: note: include '<ctype.h>' or provide a declaration of 'toupper'
> ```
> 
> Both `isspace` and `toupper` are declared in the `ctype.h` header. The
> include was added in a later upstream commit.
> This patch adds that upstream commit and strip everything else to only
> patch that include.
> 
> Fixes: https://autobuild.buildroot.org/results/d38/d38e3e12f52c3fde08ab446ca14a1a7bd65c9469//
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   .../libargtable2/0001-apply-uint-patch.patch  | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 package/libargtable2/0001-apply-uint-patch.patch
> 
> diff --git a/package/libargtable2/0001-apply-uint-patch.patch b/package/libargtable2/0001-apply-uint-patch.patch
> new file mode 100644
> index 0000000000..fed0307852
> --- /dev/null
> +++ b/package/libargtable2/0001-apply-uint-patch.patch
> @@ -0,0 +1,25 @@
> +From 3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11 Mon Sep 17 00:00:00 2001
> +From: Chris McClelland <prophet3636@gmail.com>
> +Date: Thu, 12 Nov 2020 14:18:27 +0000
> +Subject: [PATCH] Apply uint patch
> +
> +Upstream: https://github.com/makestuff/libargtable2/commit/3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11
> +[thomas: strip to only have the include]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/arg_int.c     |  2 ++
> + 1 files changed, 2 insertions(+)
> +
> +diff --git a/src/arg_int.c b/src/arg_int.c
> +index 29c20e5..c51706a 100644
> +--- a/src/arg_int.c
> ++++ b/src/arg_int.c
> +@@ -24,6 +24,8 @@ USA.
> + #include "config.h"
> + #endif
> +
> ++#include <ctype.h>
> ++
> + /* #ifdef HAVE_STDLIB_H */
> + #include <stdlib.h>
> + /* #endif */

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
