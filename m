Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79913EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 19:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB1C640154;
	Mon, 21 Aug 2023 19:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB1C640154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uv4TwKJHqKGA; Mon, 21 Aug 2023 19:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8D9B4026A;
	Mon, 21 Aug 2023 19:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8D9B4026A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6EB1BF27E
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 19:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E880C61112
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 19:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E880C61112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8P8iS1eaXvB for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 19:32:41 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44F3860AC2
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 19:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F3860AC2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9126:8dfb:db6:f9b5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1D1832003CE;
 Mon, 21 Aug 2023 21:32:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Aug 2023 21:32:33 +0200
Date: Mon, 21 Aug 2023 21:32:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230821193233.GW1778688@scaer>
References: <20230731204947.2275706-1-bernd@kuhls.net>
 <20230806162741.0e4d071f@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806162741.0e4d071f@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692646358;
 bh=4hbvJNLsTG0rTAMzd/O/AljUxZ94WNR0s/S+bSCn3TA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=etNyKzft/Tcig9QDaAiV7fYbqTBSnM4FccK4ImdelssTuCkSwLWiwTYTDL/eHwJTR
 JY51WmdYlYxLu+5g1TyD5Y5lTnMHE4rFWuWGScE62AesthtvPblNoSAPNZbgcXLk4l
 q2+mqnw40ZCOSNgJw54m5C2j46Lwgo4HmTkB02ImJY/BxMB35NT219gx3D1FWBS3Hx
 GTWyhOahERen1n9fICK7+gW80SN3cDLgQkUURcZU26E/Vv3iAOjU/V285EZB4HcBRn
 ol9yDyC+kSM1EqjG/1pMZPGDHHw79FUm237gA4JzDgfkt1oDZRMZUXcek2YFPSsK/M
 Rb8qTmCkWv5Hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=etNyKzft
Subject: Re: [Buildroot] [PATCH 1/2] package/sentry-cli: fix build with
 OpenSSL 3.x
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, Thomas, All,

On 2023-08-06 16:27 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Mon, 31 Jul 2023 22:49:46 +0200
> Bernd Kuhls <bernd@kuhls.net> wrote:
> 
> > Fixes:
> > http://autobuild.buildroot.net/results/4e2/4e24cb67402bad35ab57833d72e6c857b3eb4e07/
> > 
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> > ---
> >  ...able-SSL-support-for-the-curl-module.patch | 62 +++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
> 
> Applied to both master and next, thanks.

next still fails to build:

error: failed to run custom build command for `openssl-sys v0.9.80`

Caused by:
  process didn't exit successfully: `/home/ymorin/dev/buildroot/O/next/build/host-sentry-cli-2.20.3/target/release/build/openssl-sys-a33e7c852d3bd3b4/build-script-main` (exit status: 101)
  --- stdout
  cargo:rustc-cfg=const_fn
  cargo:rustc-cfg=openssl
  cargo:rerun-if-env-changed=X86_64_UNKNOWN_LINUX_GNU_OPENSSL_LIB_DIR
  X86_64_UNKNOWN_LINUX_GNU_OPENSSL_LIB_DIR unset
  cargo:rerun-if-env-changed=OPENSSL_LIB_DIR
  OPENSSL_LIB_DIR unset
  cargo:rerun-if-env-changed=X86_64_UNKNOWN_LINUX_GNU_OPENSSL_INCLUDE_DIR
  X86_64_UNKNOWN_LINUX_GNU_OPENSSL_INCLUDE_DIR unset
  cargo:rerun-if-env-changed=OPENSSL_INCLUDE_DIR
  OPENSSL_INCLUDE_DIR unset
  cargo:rerun-if-env-changed=X86_64_UNKNOWN_LINUX_GNU_OPENSSL_DIR
  X86_64_UNKNOWN_LINUX_GNU_OPENSSL_DIR unset
  cargo:rerun-if-env-changed=OPENSSL_DIR
  OPENSSL_DIR unset
  cargo:rerun-if-env-changed=OPENSSL_NO_PKG_CONFIG
  cargo:rerun-if-env-changed=PKG_CONFIG_x86_64-unknown-linux-gnu
  cargo:rerun-if-env-changed=PKG_CONFIG_x86_64_unknown_linux_gnu
  cargo:rerun-if-env-changed=HOST_PKG_CONFIG
  cargo:rerun-if-env-changed=PKG_CONFIG
  cargo:rerun-if-env-changed=OPENSSL_STATIC
  cargo:rerun-if-env-changed=OPENSSL_DYNAMIC
  cargo:rerun-if-env-changed=PKG_CONFIG_ALL_STATIC
  cargo:rerun-if-env-changed=PKG_CONFIG_ALL_DYNAMIC
  cargo:rerun-if-env-changed=PKG_CONFIG_PATH_x86_64-unknown-linux-gnu
  cargo:rerun-if-env-changed=PKG_CONFIG_PATH_x86_64_unknown_linux_gnu
  cargo:rerun-if-env-changed=HOST_PKG_CONFIG_PATH
  cargo:rerun-if-env-changed=PKG_CONFIG_PATH
  cargo:rerun-if-env-changed=PKG_CONFIG_LIBDIR_x86_64-unknown-linux-gnu
  cargo:rerun-if-env-changed=PKG_CONFIG_LIBDIR_x86_64_unknown_linux_gnu
  cargo:rerun-if-env-changed=HOST_PKG_CONFIG_LIBDIR
  cargo:rerun-if-env-changed=PKG_CONFIG_LIBDIR
  cargo:rerun-if-env-changed=PKG_CONFIG_SYSROOT_DIR_x86_64-unknown-linux-gnu
  cargo:rerun-if-env-changed=PKG_CONFIG_SYSROOT_DIR_x86_64_unknown_linux_gnu
  cargo:rerun-if-env-changed=HOST_PKG_CONFIG_SYSROOT_DIR
  cargo:rerun-if-env-changed=PKG_CONFIG_SYSROOT_DIR
  run pkg_config fail: "Could not run `PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=\"1\" PKG_CONFIG_LIBDIR=\"/home/ymorin/dev/buildroot/O/next/host/lib/pkgconfig:/home/ymorin/dev/buildroot/O/next/host/share/pkgconfig\" PKG_CONFIG_SYSROOT_DIR=\"/\" \"/home/ymorin/dev/buildroot/O/next/host/bin/pkg-config\" \"--libs\" \"--cflags\" \"openssl\"`\nThe pkg-config command could not be found.\n\nMost likely, you need to install a pkg-config package for your OS.\nTry `apt install pkg-config`, or `yum install pkg-config`,\nor `pkg install pkg-config`, or `apk add pkgconfig` depending on your distribution.\n\nIf you've already installed it, ensure the pkg-config command is one of the\ndirectories in the PATH environment variable.\n\nIf you did not expect this build to link to a pre-installed system library,\nthen check documentation of the openssl-sys crate for an option to\nbuild the library from source, or disable features or dependencies\nthat require pkg-config."

  --- stderr
  thread 'main' panicked at '

  Could not find directory of OpenSSL installation, and this `-sys` crate cannot
  proceed without this knowledge. If OpenSSL is installed and this crate had
  trouble finding it,  you can set the `OPENSSL_DIR` environment variable for the
  compilation process.

  Make sure you also have the development packages of openssl installed.
  For example, `libssl-dev` on Ubuntu or `openssl-devel` on Fedora.

  If you're in a situation where you think the directory *should* be found
  automatically, please open a bug at https://github.com/sfackler/rust-openssl
  and include information about your system as well as this message.

  $HOST = x86_64-unknown-linux-gnu
  $TARGET = x86_64-unknown-linux-gnu
  openssl-sys = 0.9.80

  ', /home/ymorin/dev/buildroot/O/next/build/host-sentry-cli-2.20.3/VENDOR/openssl-sys/build/find_normal.rs:191:5
  note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
warning: build failed, waiting for other jobs to finish...

Regards,
Yann E. MORIN.

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
