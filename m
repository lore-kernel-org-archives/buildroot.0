Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8449BECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 19:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D32883E93;
	Sun, 18 Sep 2022 19:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D32883E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StV6pzyLo95H; Sun, 18 Sep 2022 19:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4847883E94;
	Sun, 18 Sep 2022 19:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4847883E94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 231B41BF3F6
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0D3783E94
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0D3783E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tYfpyZtEirTK for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 19:50:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 485AD83E93
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 485AD83E93
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 19:50:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4908:486:8484:20b8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6A00619F57C;
 Sun, 18 Sep 2022 21:50:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 21:50:30 +0200
Date: Sun, 18 Sep 2022 21:50:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220918195030.GL1419013@scaer>
References: <20220918101317.171735-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918101317.171735-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663530633;
 bh=DDlpRuj4OUZYZF82TTh6TS1qKvcXsZZC2gUPTC5jOoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hieZJ8+Xw+v91rpTTRWIalCpfWb6ElgaZZR7aZeds0bjcPnlTqYrJQEZnLLVgbRQM
 d2irthWUaG3OcEeduCLBMohwRThf481SKkamKNAZvNhaKPukD3bTyHin71bZ2xayvR
 YZwtc3R8KVWFmZVqTvL+eRQrO+ZT0YTbWKjdRCUOKs10ryQMkuutRhwX9RgiPsYbLm
 Sw/lmm5HMsy1fQv8olMB5sUq9d+S5InYDfQqwMBW+sEJwlH/VaeWl9glKTqsI5lZvQ
 gF/gaUnH24u3qPS+RlTkkJ/tzzzzxgFkDOMo9H/DNJOGCVflAqVzcxp2jedMxWH4xc
 Kazj18QqR17Lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hieZJ8+X
Subject: Re: [Buildroot] [PATCH 1/1] package/libconfuse: fix CVE-2022-40320
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
Cc: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

+Joachim, which I understand is now handling maintenance upstream

On 2022-09-18 12:13 +0200, Fabrice Fontaine spake thusly:
> cfg_tilde_expand in confuse.c in libConfuse 3.3 has a heap-based buffer
> over-read.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Joachim, do you want to extend your entry in DEVELOPPERS with
libconfuse?

Regards,
Yann E. MORIN.

> ---
>  ...rminated-username-used-with-getpwnam.patch | 43 +++++++++++++++++++
>  package/libconfuse/libconfuse.mk              |  3 ++
>  2 files changed, 46 insertions(+)
>  create mode 100644 package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> 
> diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> new file mode 100644
> index 0000000000..9ff3f5ec1c
> --- /dev/null
> +++ b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> @@ -0,0 +1,43 @@
> +From d73777c2c3566fb2647727bb56d9a2295b81669b Mon Sep 17 00:00:00 2001
> +From: Joachim Wiberg <troglobit@gmail.com>
> +Date: Fri, 2 Sep 2022 16:12:46 +0200
> +Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
> +
> +Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> +
> +[Retrieved (and backported) from:
> +https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/confuse.c | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/confuse.c b/src/confuse.c
> +index 6d1fdbd..05566b5 100644
> +--- a/src/confuse.c
> ++++ b/src/confuse.c
> +@@ -1894,18 +1894,20 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
> + 			passwd = getpwuid(geteuid());
> + 			file = filename + 1;
> + 		} else {
> +-			/* ~user or ~user/path */
> +-			char *user;
> ++			char *user; /* ~user or ~user/path */
> ++			size_t len;
> + 
> + 			file = strchr(filename, '/');
> + 			if (file == 0)
> + 				file = filename + strlen(filename);
> + 
> +-			user = malloc(file - filename);
> ++			len = file - filename - 1;
> ++			user = malloc(len + 1);
> + 			if (!user)
> + 				return NULL;
> + 
> +-			strncpy(user, filename + 1, file - filename - 1);
> ++			strncpy(user, &filename[1], len);
> ++			user[len] = 0;
> + 			passwd = getpwnam(user);
> + 			free(user);
> + 		}
> diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
> index 2beb0e4fbf..e7c2ef0a84 100644
> --- a/package/libconfuse/libconfuse.mk
> +++ b/package/libconfuse/libconfuse.mk
> @@ -14,5 +14,8 @@ LIBCONFUSE_LICENSE_FILES = LICENSE
>  LIBCONFUSE_CPE_ID_VENDOR = libconfuse_project
>  LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  
> +# 0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> +LIBCONFUSE_IGNORE_CVES += CVE-2022-40320
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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
