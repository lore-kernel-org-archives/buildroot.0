Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F4CC433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 14:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 808494025F;
	Thu, 17 Nov 2022 14:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 808494025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvxxgsIVXp-B; Thu, 17 Nov 2022 14:56:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4558B40211;
	Thu, 17 Nov 2022 14:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4558B40211
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CF5E1BF3EC
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 14:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F21940453
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 14:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F21940453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHNLP_Mky8ca for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 14:56:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0307240383
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0307240383
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 14:56:53 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id g10so1822776plo.11
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 06:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7OdRXKs+PzpFNd+YQK1ZLw6xaQra+FcIzhP+KI2QZH0=;
 b=pTLQr/nVWx0zsNbxEznpZUnp3+3mA2+XsEqZfzXD6Ppku+81eYr0VRsv7UY6BmYsFL
 SLePJu0lW4oiKDcg3dyiKJtLGCeo0X4W7h4OV29bgTup+qGC5HCvsG4mu2CBRGWCOzQn
 WXYMrtwz/GbP1AFxahvDw/k83ApVq//4Cabt/CmMOKb+ngKTMjon+aLnspyid7D8FtUB
 OLTrPW3y1ega1mUxjdini75oei6gN72IgWqcYSIisdAI8dJbcucjyv/hkhjS4eki397s
 /ZH5MzFPwGGMQCt8MVWlUU8d+YsL7b/5m83hKhlzEuGK7YxfgM7tAm1ZnYT+q6CzVe2B
 9xAQ==
X-Gm-Message-State: ANoB5pk5FYcM+2kOlfu1Hv0suwtpfLxzM49Vb7yhVvK63lxUXEFsmfZP
 LVCrqO7JGfZUVYelqF7c1kCFvQtKrHSSgNlNpJA=
X-Google-Smtp-Source: AA0mqf5/K4Z/XTt1OlZo9DxqL3DJr7kM8O+yhiA4dgqWGTm/6DqJfI7ewBkaSekkIT37UYxKqoPcrkTaFnGiHNmaiqY=
X-Received: by 2002:a17:90b:2552:b0:212:f8d0:a075 with SMTP id
 nw18-20020a17090b255200b00212f8d0a075mr3126370pjb.92.1668697013252; Thu, 17
 Nov 2022 06:56:53 -0800 (PST)
MIME-Version: 1.0
References: <20221117144136.688703-1-martin.elshuber@theobroma-systems.com>
In-Reply-To: <20221117144136.688703-1-martin.elshuber@theobroma-systems.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Nov 2022 10:56:40 -0400
Message-ID: <CADvTj4rdfyePk-+gsgibRH_ARqVuoe62FrWZ_-S0pxFpxmeU8A@mail.gmail.com>
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7OdRXKs+PzpFNd+YQK1ZLw6xaQra+FcIzhP+KI2QZH0=;
 b=MPPQwnMg/m7MNyiAGINOKEMhJZA+dOndR3/JISCl2yaABAMBxKj1P5GVmwg65Vs+Z+
 KkpPTPLm1IxXo/nUhQcjsR6gZ3Y4Sy204y5TRlDabH/99kbF+VD3HfW2tXQaM0gnwouW
 KUHE09pAk/w60posLORuxIYhUCmKV/9qPvvCuX4VG1JbJ+2PL7HN5E0tJcLvCp/knLva
 L85eT/qdIZq/IKLBCPbN0uE/x5ekDBjsIEJkjU9c4DpjXFpc3rFAguVC7R6UNpOQIyaX
 yD829G3r8pj9wTPo0eCwr9dLYkDbmY4wSR3NLMLculE0Rx0XCVCe73Qtk1rbAWihdYiA
 y1+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MPPQwnMg
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 252
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 17, 2022 at 10:42 AM Martin Elshuber via buildroot
<buildroot@buildroot.org> wrote:
>
> Remove the patchfile since it is already contained in systemd v252 in
> commit 608c3b0293cac3cbb037b2d15c0a0f1e247eb71e.
>
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> ---
>  ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
>  package/systemd/systemd.hash                  |  2 +-
>  package/systemd/systemd.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
>
> diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
> deleted file mode 100644
> index 0934886acb..0000000000
> --- a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Fri, 7 Jan 2022 22:25:23 +0100
> -Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
> -
> -MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
> -but it's defined in kernel headers since version 5.2.
> -
> -[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
> -
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - src/basic/missing_syscall.h | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
> -index 8267b1a90c..793d111c55 100644
> ---- a/src/basic/missing_syscall.h
> -+++ b/src/basic/missing_syscall.h
> -@@ -569,6 +569,10 @@ static inline int missing_open_tree(
> - #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
> - #endif
> -
> -+#ifndef MOVE_MOUNT_T_EMPTY_PATH
> -+#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
> -+#endif
> -+
> - static inline int missing_move_mount(
> -                 int from_dfd,
> -                 const char *from_pathname,
> ---
> -2.31.1
> -
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 3572b25965..d8163463ce 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
> +sha256  c345253c293e89f4d8a3743fac2b9b81c972b0da3b7f709ae578b247510efe01  systemd-252.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b42f6a502b..d9448bac57 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 250.4
> +SYSTEMD_VERSION = 252

This is outdated, there's also already a pending patch for 252.1:
https://lore.kernel.org/buildroot/20221111105757.552459-1-nolange79@gmail.com/

>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>         LGPL-2.1+, \
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
