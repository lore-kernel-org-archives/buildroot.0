Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D50C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 18:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FC33408F5;
	Wed, 23 Feb 2022 18:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHi6OmMBeU2v; Wed, 23 Feb 2022 18:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD424408EC;
	Wed, 23 Feb 2022 18:29:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A44131BF5F5
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 18:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FD33408EC
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 18:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rq-kExuYpsiE for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 18:29:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7798B408EB
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 18:29:55 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id d21so27493766yba.11
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 10:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qyi16+z3rc5OcEikMH+NqRBObx+Vdc8BPHM2nynNi1k=;
 b=CTf5RAnNIk77BQOjkoWNSX3cIw//CK1wAtZwhBvhzQk/EPBP/yxJ6kNK1sO9vOjRsB
 SEY807KbV8Uou1z3xQXByLBOVOhwUoPXyQXWonAmypH2r2nOGGWDazsD5640ytNihrhj
 zuohFxJKA+tNOKXUo3ZjA47Oqdz33hkWAaoBC1OUpB0iyGDSFLYj8Si3ISiHnHRprqrD
 rbKq2EzetHRRK78aKWmVOtMrFJltXQU8Vwe7Mk+ymF/zp7aKjzej3YUkbfSivI2g/VHZ
 4BjeyS3ykj4HzxNPekx3sCx6RqKgCNsucUmi3yDJz4ArIEQbQpbfCXnkI1XMeXkx7z2Z
 2yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qyi16+z3rc5OcEikMH+NqRBObx+Vdc8BPHM2nynNi1k=;
 b=OXHvke3l+6QFNbtKtk8K+NVBLXVPLmADfXNiLkjxNT5BAQF8gQWdDUI/bj7o0XbuIZ
 CmLvtgofQioPXZ6AOt7trcKxW6XaBY3AN31ImqJjZxKR7i66aHoLcO1p3eTsocOXDFkA
 xs2CCA1LX2MdjQ0uxeENDfwkF7edSUWIuSbaTTzLnvDtS2azPsihvn6fvokFrcu0xZbn
 RM81KgYoz7RWNa0DCn1b97HJIqcuVFsoKAxxnSLDYD1cboHAVUwPeLABrQvg3L+ydGKV
 PPDomd3PbxGnHNbXmiqWmKP8kXA7mY9hpayX2AgVi89jogcJesPicQyjDhcB68prYo6w
 hByQ==
X-Gm-Message-State: AOAM532taWsXvVTyhmjhRq9K9YgXz0jcRAI35b9ybZMjh9kEYb9ZOYr0
 ZtfVyena8RA/EzdW22IfofFHrIyim43XOQ3+Hi9ISue1heQ=
X-Google-Smtp-Source: ABdhPJxF4Vip/hGXhH3UcACS1ykTzv62biEVR3T89gkwvZ5eHiNwmUCwdhjCL/5k8a7bSrvgbaTz0+m+LeEnjFFIS5s=
X-Received: by 2002:a25:e311:0:b0:61e:9e77:a455 with SMTP id
 z17-20020a25e311000000b0061e9e77a455mr845668ybd.567.1645640994413; Wed, 23
 Feb 2022 10:29:54 -0800 (PST)
MIME-Version: 1.0
References: <mailman.17975.1645600292.66748.buildroot@buildroot.org>
 <256f0da3b8d983a84ea84de250c56bb0@umbiko.net>
In-Reply-To: <256f0da3b8d983a84ea84de250c56bb0@umbiko.net>
From: William Tambe <tambewilliam@gmail.com>
Date: Wed, 23 Feb 2022 12:29:44 -0600
Message-ID: <CAF8i9mNy1khsU+m1A60hBofY-fv=7wsS5ee=01QttxbXdVMGhA@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
Subject: Re: [Buildroot] STAGING_DIR does not contain executables found in
 TARGET_DIR
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 23, 2022 at 5:30 AM Andreas Ziegler <br015@umbiko.net> wrote:
>
> Hi William,
>
> On 2022-02-23 07:11, William Tambe <tambewilliam@gmail.com> wrote:
>
> > Please help determining why STAGING_DIR does not contain executables
> > found in TARGET_DIR ?
> >
> > I am expecting to find debug version of all executables in TARGET_DIR,
> > but executables such as /bin/busybox are missing from STAGING_DIR .
>
> If you look at your packages' definition (.mk) files, you will find a
> few with *_INSTALL_STAGING = YES. This is responsible for the
> (additional) installation in STAGING_DIR. The reason for this is that
> some packages need to provide information during the build process, that
> is not needed later for operation on the target. To save space on the
> target system, a two-stage approach is used.
>
> Example: your configuration includes zlib-ng: the library itself is
> present both in STAGING_DIR and in TARGET_DIR, header and
> ldconfig-related files will be found in STAGING_DIR only.  On the other
> hand, Busybox is not referenced by other packages (it does not export
> any interfaces), so it does not have an installation in STAGING_DIR.
>

Is there a temporary hack I could use to have a `bin/busybox` in STAGING_DIR ?

> Your target binaries will be stripped of symbols, unless you prevent
> this via BR2_STRIP_EXCLUDE_{FILE, DIRS} ...
>
> Remote debugging has less impact on your target installation. For this
> you would need BR2_PACKAGE_HOST_GDB and BR2_PACKAGE_GDB_SERVER [1].
>
> Kind regards,
> Andreas
>
> > I am using 2021.08.3
> >
> > Full config is as follow
> > ```
> > BR2_pu32=y
> > BR2_ENABLE_DEBUG=y
> > BR2_DEBUG_3=y
> > BR2_STATIC_LIBS=y
> > BR2_FORTIFY_SOURCE_NONE=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/pu32-toolchain/"
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-elf"
> > BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> > # BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
> > # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
> > BR2_TOOLCHAIN_EXTERNAL_CXX=y
> > BR2_TARGET_GENERIC_ISSUE=""
> > BR2_ROOTFS_MERGED_USR=y
> > BR2_TARGET_GENERIC_ROOT_PASSWD="root"
> > BR2_SYSTEM_BIN_SH_BASH=y
> > BR2_TARGET_GENERIC_GETTY_TERM="linux"
> > BR2_TARGET_GENERIC_GETTY_OPTIONS="-n -l /bin/-bash"
> > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> > BR2_PACKAGE_GDB=y
> > BR2_PACKAGE_ZLIB=y
> > BR2_PACKAGE_ZLIB_NG=y
> > BR2_PACKAGE_DHCP=y
> > BR2_PACKAGE_DHCP_CLIENT=y
> > BR2_PACKAGE_IPROUTE2=y
> > BR2_PACKAGE_LRZSZ=y
> > BR2_PACKAGE_SOCAT=y
> > BR2_PACKAGE_HTOP=y
> > BR2_PACKAGE_NANO=y
> > # BR2_PACKAGE_NANO_TINY is not set
> > BR2_TARGET_ROOTFS_EXT2=y
> > BR2_TARGET_ROOTFS_EXT2_4=y
> > BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
> > # BR2_TARGET_ROOTFS_TAR is not set
> > ```
>
> [1] https://sourceware.org/gdb/current/onlinedocs/gdb/Server.html#Server
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
