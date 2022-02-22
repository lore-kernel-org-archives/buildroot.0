Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED7BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 23:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC4B6408B0;
	Tue, 22 Feb 2022 23:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMuQTO1Cdj7g; Tue, 22 Feb 2022 23:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5A24089A;
	Tue, 22 Feb 2022 23:42:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C14A71BF3C5
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 23:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AADE781445
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 23:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c0QClryifpEV for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 23:41:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 159E681423
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 23:41:57 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id y189so22928896ybe.4
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 15:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=pYmWiFuzYnvMLUQemU4QxTh+WgC97uItBy33U5dY/ts=;
 b=iMP0fh+d+6v3XfufI2cv/s/UulHK6P/UKX264B81LGc6SHwUchvqtgeqxQWBbhXRF/
 x9hAghR5aYhXnMhNUMlzEqy396HB1qoOvkG+kv2qMEmAM411dxRJ3vg8gcGkgm5MS24q
 ZLC46eSvbQNW/ABPP/qKq8anB6kyXZOf6FgdCCc6/xHzQ1KAY62U00nH1sjRklGCIDRE
 TOYG+KeQsuM7sgXwdxFIOpCawm9xY6CLGwaWiEs9GW31DrdoABfliONthKjy18wxnF9D
 WpI3BBVnNqjFjt2apsHoE7lWJrqk4AKqDSYTQItF/Sn3KWMkTIpA8beke0Bs6GnN08IK
 wARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pYmWiFuzYnvMLUQemU4QxTh+WgC97uItBy33U5dY/ts=;
 b=btn+8xu3w1i05qLrz3wxbQRc5lg7E/AxF145ZpAtm14fPbIywPASazQ9d2gRYulBOe
 MtoMZ+YTn4oD6KBeTYwBqiFuEgwmEFavWpg5FsvM7z8oZiCNh4ioilvztgeGxtShrciq
 6g2dCeWwM9Zs44AL9dBrNa2H9H6LKcxdy9jVBusxHTPJ6D3PwLK31JIX0ElRiSKV9KHN
 mjCkaAsDIWIna0OnCto1AgCO+0Xim1Zd9YkItHm2ee+Vo80zXF8c27ERgtYjutyQxXi9
 Fzh8UytTfRxZTNMMOFoFnDRQulByXZpdrqsnBs9y2/sSL+RYMlzHHtzHUXj1Y04UWL26
 2d8g==
X-Gm-Message-State: AOAM5330urNgSYt+SU9cM8zg4L+SLVzrn9o331yQ8DVQqYZjDneA7smb
 SsNVBLnyUtARTBB8IidxEvPW+DS6LVWb28aMWB0Fx02h3pQ=
X-Google-Smtp-Source: ABdhPJyitKGryRLrh0mEkZJyLIZrD6l3FPKxzkj/3lOW3+9P0WA19wQGCgWU4GHa2Y/XFncZloMKOzomhAwn3UVbT3U=
X-Received: by 2002:a25:ac46:0:b0:624:4382:4ecd with SMTP id
 r6-20020a25ac46000000b0062443824ecdmr19743037ybd.108.1645573316721; Tue, 22
 Feb 2022 15:41:56 -0800 (PST)
MIME-Version: 1.0
From: William Tambe <tambewilliam@gmail.com>
Date: Tue, 22 Feb 2022 17:41:45 -0600
Message-ID: <CAF8i9mMhr9e_-GuC_tKbGFi0nAqGuxyaWZf3Mm0SQxncGy8Jkw@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] STAGING_DIR does not contain executables found in
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Please help determining why STAGING_DIR does not contain executables
found in TARGET_DIR ?

I am expecting to find debug version of all executables in TARGET_DIR,
but executables such as /bin/busybox are missing from STAGING_DIR .

I am using 2021.08.3

Full config is as follow
```
BR2_pu32=y
BR2_ENABLE_DEBUG=y
BR2_DEBUG_3=y
BR2_STATIC_LIBS=y
BR2_FORTIFY_SOURCE_NONE=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/pu32-toolchain/"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-elf"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
# BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_ISSUE=""
BR2_ROOTFS_MERGED_USR=y
BR2_TARGET_GENERIC_ROOT_PASSWD="root"
BR2_SYSTEM_BIN_SH_BASH=y
BR2_TARGET_GENERIC_GETTY_TERM="linux"
BR2_TARGET_GENERIC_GETTY_OPTIONS="-n -l /bin/-bash"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_ZLIB_NG=y
BR2_PACKAGE_DHCP=y
BR2_PACKAGE_DHCP_CLIENT=y
BR2_PACKAGE_IPROUTE2=y
BR2_PACKAGE_LRZSZ=y
BR2_PACKAGE_SOCAT=y
BR2_PACKAGE_HTOP=y
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_NANO_TINY is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
# BR2_TARGET_ROOTFS_TAR is not set
```
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
