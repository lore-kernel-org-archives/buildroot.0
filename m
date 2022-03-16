Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD789C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7322660F70;
	Wed, 16 Mar 2022 21:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkRAeSUxrMwH; Wed, 16 Mar 2022 21:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 973F860F6A;
	Wed, 16 Mar 2022 21:39:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A40361BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9296260AD6
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNXPoZQ9olrC for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:38:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A17960A9D
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:38:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6da3:2756:3f87:4127])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 62E0013F814;
 Wed, 16 Mar 2022 22:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647466706;
 bh=Y99l8AfZApWqtlOR+sHYkhFSLFR3rWgPXevmovnFVIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OiMmbC0XW3kQVYS52ZRP3URSrHCub/PO+1KfML91WkLy+aRbHmYzy7zvJP0aiJzOI
 gvZgz/aBRF/609FIiOpUgL49BbOjoKm43DJgeYgIxUwGC1v3+uyckYYYcXAY8SRN9i
 22tCMoZ8+nBwAES1CVDksn29e8ytoAYVQWP5q5M/i2e7Nje1qXzC3klMvmPvJeJhvG
 gAgty8xvlR67J4DwDUZiKHYd16fY5Y23xhfUvVOWffEv09HRyxL5amg/W5wWZeyy39
 dMXkQ5srebkSK143zTJmu4cJ4tMATM5CHEDSKgq2oTdqZJyB+sTK3wUDvqGIrtN8bp
 nA6dP3AOoEPnw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 22:38:24 +0100
Date: Wed, 16 Mar 2022 22:38:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220316213824.GA283544@scaer>
References: <20220316203734.3081600-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316203734.3081600-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libgcrypt: fix musl build
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

Fabrice, All,

On 2022-03-16 21:37 +0100, Fabrice Fontaine spake thusly:
> Fix the following musl build failure raised since bump to version 1.10.0
> in commit d96b9ed0738bae270c479bdaf21eebd4c1f9930d:
> 
> In file included from ./jitterentropy.h:98,
>                  from ./jitterentropy-base.c:32,
>                  from ./rndjent.c:88:
> ./jitterentropy-base-user.h: In function 'jent_get_cachesize':
> ./jitterentropy-base-user.h:191:8: warning: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
>   191 |   fd = open(file, O_RDONLY);
>       |        ^~~~
>       |        popen
> ./jitterentropy-base-user.h:191:19: error: 'O_RDONLY' undeclared (first use in this function)
>   191 |   fd = open(file, O_RDONLY);
>       |                   ^~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f6182fca6a4e2ba29a89f770f17df691d7861f8d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...entropy-Include-fcntl-h-and-limits-h.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
> 
> diff --git a/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch b/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
> new file mode 100644
> index 0000000000..8f76f24c64
> --- /dev/null
> +++ b/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
> @@ -0,0 +1,38 @@
> +From ffaef0be613121d3ee37867d82932a7a30c2bc6d Mon Sep 17 00:00:00 2001
> +From: Heiko Becker <heirecka@exherbo.org>
> +Date: Thu, 3 Feb 2022 22:46:41 +0000
> +Subject: [PATCH] jitterentropy: Include <fcntl.h> and <limits.h>
> +
> +* random/jitterentropy-base-user.h: Include <fcntl.h> for O_RDONLY
> +* random/jitterentropy-base-user.h: Include <limits.h> for LONG_MAX
> +
> +--
> +
> +Fixes the build with musl libc.
> +
> +Signed-off-by: Heiko Becker <heirecka@exherbo.org>
> +
> +[Retrieved from:
> +https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=ffaef0be613121d3ee37867d82932a7a30c2bc6d]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + random/jitterentropy-base-user.h | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/random/jitterentropy-base-user.h b/random/jitterentropy-base-user.h
> +index 326dfbed..389106ff 100644
> +--- a/random/jitterentropy-base-user.h
> ++++ b/random/jitterentropy-base-user.h
> +@@ -39,6 +39,9 @@
> +  * DAMAGE.
> +  */
> + 
> ++#include <fcntl.h>
> ++#include <limits.h>
> ++
> + #ifndef GCRYPT_JITTERENTROPY_BASE_USER_H
> + #define GCRYPT_JITTERENTROPY_BASE_USER_H
> + 
> +-- 
> +2.11.0
> +
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
