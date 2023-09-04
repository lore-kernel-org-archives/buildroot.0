Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF6AC83F2C
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 12:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E30404CB;
	Mon,  4 Sep 2023 12:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E30404CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vfrfNcxikhV; Mon,  4 Sep 2023 12:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3FA404E4;
	Mon,  4 Sep 2023 12:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC3FA404E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF0A51BF360
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 12:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB1BE404E9
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 12:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB1BE404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lokvQbouRlwy for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 12:48:27 +0000 (UTC)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A511404CB
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 12:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A511404CB
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-4135f97435eso9183091cf.2
 for <buildroot@buildroot.org>; Mon, 04 Sep 2023 05:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693831705; x=1694436505;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=id1ZHge2aqvG2oid55/fwIgLZfCkuqyoDohVtFDrlFU=;
 b=RUi4eljIV3hIIome4+Lmhf/p2hx5UeCAuDy7aQBMQxdY5osFDy3Zbs+uUP7vc50Rus
 mMqkqUTqDqf6SslhGYBEy2kP2lMGtLTZ9rmemIjJqySRnoetI4s+KoDIsoreLYpGUEMm
 T1wjJ78giZCdXaAqdQ2MvMNDqqpxkQmDclxxtC0F7yS11bWRnrlAadeeQWkJCRP0qWhn
 +xmyNqHYLeFauPrmivf+RxYGcY0UTXspHCKibcv+VE3wedl5OlO1hfoIaA5jG14W3Eqb
 2zGLQGx4bxBXdBZpaFkzoat1QyOTcpqdiNE3sVvQtEg2kSqrBFZpXDJn7THzcgUQr1gA
 qAyg==
X-Gm-Message-State: AOJu0Yz0nBgbhU2T5745ukBwK40b2Po1MCdCue8FR4xW1pBxMP9NICUm
 FcfQ7eK2/38irs7xtWMArIGHZJB5mcHvXVLlO9NMEu3M
X-Google-Smtp-Source: AGHT+IHzXHl5tjn4R1gOzKk/i4/4y61rH7VOw/DqIwrLN2xzio/QyZOEr8OJImB5Wu/R8mPS/W/GK7KbNzMqctI0Bek=
X-Received: by 2002:ac8:7f14:0:b0:403:b02c:db8d with SMTP id
 f20-20020ac87f14000000b00403b02cdb8dmr13485763qtk.7.1693831705466; Mon, 04
 Sep 2023 05:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230904124551.94741-1-nolange79@gmail.com>
In-Reply-To: <20230904124551.94741-1-nolange79@gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 4 Sep 2023 14:48:14 +0200
Message-ID: <CADYdroOi_QjoOorN6wji5Y4_sUMUe_=YSK42Eik0S8mqHiTosA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693831705; x=1694436505; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=id1ZHge2aqvG2oid55/fwIgLZfCkuqyoDohVtFDrlFU=;
 b=l34QCoTFZYVNpr/Ftg1QA+8EsdUXHodfVpv0ZoAOzfN78k0vgtuixeIR9HbFWfwZOx
 CwpLE2FaY+VeUZTG3VLsF4gEvzaSdOhxExlUpmGbkTkKJ+D3x1Q2PIc2283c/Z5JiUTo
 cWK3vT4dn4B9tN3YCBYgOo/b7njJolrO6dQfuL77EeIM0gPzdI4ip0GvAr6yrBvFYD0K
 LutWZOGOSZUo01XnzNtyvQhpvU3D26izMI3qQce0R67IZjfIcBZezeIL06sYvZyGUQxk
 Q/awdsgNYIX5NfIrhY+qT4ecbSXtbbrWw2GQo2SBcA6LQL1t7wChcIQXs+Tn7u/GbDvp
 yqlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=l34QCoTF
Subject: Re: [Buildroot] [PATCH] package/util-linux: fix build with old glibc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mo., 4. Sept. 2023 um 14:46 Uhr schrieb Norbert Lange <nolange79@gmail.com>:
>
> The build still fails with older glibc versions (2.28 for example).
> Apply an upstream fix from
> https://github.com/util-linux/util-linux/issues/2448.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  .../0001-libmount-fix-statx-includes.patch    | 127 ++++++++++++++++++
>  .../0001-libmount-fix-statx-includes.patch    |   1 +
>  2 files changed, 128 insertions(+)
>  create mode 100644 package/util-linux/0001-libmount-fix-statx-includes.patch
>  create mode 120000 package/util-linux/util-linux-libs/0001-libmount-fix-statx-includes.patch
>
> diff --git a/package/util-linux/0001-libmount-fix-statx-includes.patch b/package/util-linux/0001-libmount-fix-statx-includes.patch
> new file mode 100644
> index 0000000000..c818423769
> --- /dev/null
> +++ b/package/util-linux/0001-libmount-fix-statx-includes.patch
> @@ -0,0 +1,127 @@
> +From 7d679f29aee9f56b07bd792e07b5b4e1ca2f3fa7 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Wed, 23 Aug 2023 11:50:37 +0200
> +Subject: [PATCH] libmount: fix statx() includes
> +
> +Using sys/stat.h and linux/stat is too tricky.h together. It seems
> +better to rely on libc and use sys/stat.h only. Users affected
> +by old libc must update to use recent util-linux.
> +
> +Fixes: https://github.com/util-linux/util-linux/issues/2448
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +Signed-off-by: Norbert Lange <nolange79@gmail.com>
> +---
> + configure.ac              | 5 ++---
> + include/fileutils.h       | 4 ++--
> + libmount/src/hook_mount.c | 2 +-
> + libmount/src/utils.c      | 2 +-
> + meson.build               | 5 ++---
> + 5 files changed, 8 insertions(+), 10 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 738b369ee8..e6114aac36 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -326,7 +326,6 @@ AC_CHECK_HEADERS([ \
> +       linux/nsfs.h \
> +       linux/pr.h \
> +       linux/raw.h \
> +-      linux/stat.h \
> +       linux/securebits.h \
> +       linux/tiocl.h \
> +       linux/version.h \
> +@@ -518,7 +517,6 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> + ])
> +
> + AC_CHECK_TYPES([struct mount_attr], [], [], [[#include <linux/mount.h>]])
> +-AC_CHECK_TYPES([struct statx], [], [], [[#include <linux/stat.h>]])
> + AC_CHECK_TYPES([enum fsconfig_command], [], [], [[#include <linux/mount.h>]])
> +
> + AC_CHECK_MEMBERS([struct termios.c_line],,,
> +@@ -527,8 +525,9 @@ AC_CHECK_MEMBERS([struct termios.c_line],,,
> + AC_CHECK_MEMBERS([struct stat.st_mtim.tv_nsec],,,
> +     [[#include <sys/stat.h>]])
> +
> ++AC_CHECK_TYPES([struct statx], [], [], [[#include <sys/stat.h>]])
> + AC_CHECK_MEMBERS([struct statx.stx_mnt_id],,,
> +-    [[#include <linux/stat.h>]])
> ++    [[#include <sys/stat.h>]])
> +
> + AC_CHECK_DECLS([_NL_TIME_WEEK_1STDAY],[],[],[[#include <langinfo.h>]])
> +
> +diff --git a/include/fileutils.h b/include/fileutils.h
> +index a5fe517266..538eab0b74 100644
> +--- a/include/fileutils.h
> ++++ b/include/fileutils.h
> +@@ -94,13 +94,13 @@ static inline int close_range(unsigned int first, unsigned int last, int flags)
> + #  define HAVE_CLOSE_RANGE 1
> + # endif       /* SYS_close_range */
> +
> +-# if !defined(HAVE_STATX) && defined(HAVE_STRUCT_STATX) && defined(SYS_statx) && defined(HAVE_LINUX_STAT_H)
> +-#  include <linux/stat.h>
> ++# if !defined(HAVE_STATX) && defined(HAVE_STRUCT_STATX) && defined(SYS_statx)
> + static inline int statx(int fd, const char *restrict path, int flags,
> +                   unsigned int mask, struct statx *stx)
> + {
> +       return syscall(SYS_statx, fd, path, flags, mask, stx);
> + }
> ++#  define HAVE_STATX 1
> + # endif /* SYS_statx */
> +
> + #endif        /* HAVE_SYS_SYSCALL_H */
> +diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
> +index 056338c491..0ebb829985 100644
> +--- a/libmount/src/hook_mount.c
> ++++ b/libmount/src/hook_mount.c
> +@@ -294,7 +294,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
> +               /* cleanup after fail (libmount may only try the FS type) */
> +               close_sysapi_fds(api);
> +
> +-#if defined(HAVE_STRUCT_STATX) && defined(HAVE_STRUCT_STATX_STX_MNT_ID)
> ++#if defined(HAVE_STATX) && defined(HAVE_STRUCT_STATX) && defined(HAVE_STRUCT_STATX_STX_MNT_ID)
> +       if (!rc && cxt->fs) {
> +               struct statx st;
> +
> +diff --git a/libmount/src/utils.c b/libmount/src/utils.c
> +index 1d3f4abcec..3817b39271 100644
> +--- a/libmount/src/utils.c
> ++++ b/libmount/src/utils.c
> +@@ -111,7 +111,7 @@ static int safe_stat(const char *target, struct stat *st, int nofollow)
> +
> +       memset(st, 0, sizeof(struct stat));
> +
> +-#if defined(AT_STATX_DONT_SYNC) && defined (HAVE_STRUCT_STATX)
> ++#if defined(HAVE_STATX) && defined(HAVE_STRUCT_STATX) && defined(AT_STATX_DONT_SYNC)
> +       {
> +               int rc;
> +               struct statx stx = { 0 };
> +diff --git a/meson.build b/meson.build
> +index 221ae373b6..6beb9dbaba 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -79,7 +79,7 @@ have_mountfd_api = cc.sizeof('struct mount_attr', prefix : '#include <linux/moun
> + conf.set('HAVE_STRUCT_MOUNT_ATTR', have_mountfd_api ? 1 : false)
> + conf.set('HAVE_MOUNTFD_API', have_mountfd_api ? 1 : false)
> +
> +-have_struct_statx = cc.sizeof('struct statx', prefix : '#include <linux/stat.h>') > 0
> ++have_struct_statx = cc.sizeof('struct statx', prefix : '#include <sys/stat.h>') > 0
> + conf.set('HAVE_STRUCT_STATX', have_struct_statx ? 1 : false)
> +
> + build_libmount = not get_option('build-libmount').disabled()
> +@@ -177,7 +177,6 @@ headers = '''
> +         linux/nsfs.h
> +         linux/mount.h
> +         linux/pr.h
> +-        linux/stat.h
> +         linux/securebits.h
> +         linux/tiocl.h
> +         linux/version.h
> +@@ -640,7 +639,7 @@ have = cc.has_member('struct stat', 'st_mtim.tv_nsec',
> + conf.set('HAVE_STRUCT_STAT_ST_MTIM_TV_NSEC', have ? 1 : false)
> +
> + have = cc.has_member('struct statx', 'stx_mnt_id',
> +-                     prefix : '#include <linux/stat.h>')
> ++                     prefix : '#include <sys/stat.h>')
> + conf.set('HAVE_STRUCT_STATX_STX_MNT_ID', have ? 1 : false)
> +
> + # replacement for AC_STRUCT_TIMEZONE
> diff --git a/package/util-linux/util-linux-libs/0001-libmount-fix-statx-includes.patch b/package/util-linux/util-linux-libs/0001-libmount-fix-statx-includes.patch
> new file mode 120000
> index 0000000000..bc21ebedb7
> --- /dev/null
> +++ b/package/util-linux/util-linux-libs/0001-libmount-fix-statx-includes.patch
> @@ -0,0 +1 @@
> +../0001-libmount-fix-statx-includes.patch
> \ No newline at end of file
> --
> 2.39.2
>

I think this, together with the version bugfix bump to 2.39.2 should
end up in BR 2023.08.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
