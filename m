Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D4BE743C3
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 21:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DD29614FC;
	Thu, 28 Sep 2023 21:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD29614FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHqgOZNyRj8F; Thu, 28 Sep 2023 21:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51FE76150D;
	Thu, 28 Sep 2023 21:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51FE76150D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 090641BF20D
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 21:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D740B408F2
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 21:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D740B408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3TAzvLaYgh69 for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 21:04:51 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 626A1406E0
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 21:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626A1406E0
Received: from ymorin.is-a-geek.org (unknown [92.184.106.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4B49119F57B;
 Thu, 28 Sep 2023 23:04:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Sep 2023 23:04:45 +0200
Date: Thu, 28 Sep 2023 23:04:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230928210445.GE14593@scaer>
References: <20230928165126.336164-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928165126.336164-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695935088;
 bh=xQk1mUQo89z2LeiFmEyCInqruOjoBrxiyZ2bx1hF7io=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gQpp/uQEIdEBLaISkyuL8yR2+NFuWFZY1maFcqrGcyWhYIKfmCwor37fRK89aIFXS
 ItxeAfcyN52XVBG5bXp0ui3W/Eg4F4U2mEqpxl60XVePjunYOA67oDhJ0znaL8GOnA
 TCeNnxom7QhhJU3PCtkiYQ5riQVwbTHBvlYWO3IPyl7V/QFXD1typfSIs7EblOjuK4
 9EWLZ+AmcENT3Rpr7dpPEuLBUeNeCQkbaYYXjGQ2lMGsQNsQEqdTa09pR2LMgX1Bze
 qWeT5jbQCPoZgMMaKXxfiTxQ16XXIfNUj1IG6xGCDVV81EYTtQfOkP523yNvqusR41
 v0lMMb8OI/JBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gQpp/uQE
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/suricata: security bump to version 6.0.14
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

On 2023-09-28 18:51 +0200, Fabrice Fontaine spake thusly:
> - Fix CVE-2023-35852: In Suricata before 6.0.13 (when there is an
>   adversary who controls an external source of rules), a dataset
>   filename, that comes from a rule, may trigger absolute or relative
>   directory traversal, and lead to write access to a local filesystem.
>   This is addressed in 6.0.13 by requiring allow-absolute-filenames and
>   allow-write (in the datasets rules configuration section) if an
>   installation requires traversal/writing in this situation.
> - Fix CVE-2023-35853: In Suricata before 6.0.13, an adversary who
>   controls an external source of Lua rules may be able to execute Lua
>   code. This is addressed in 6.0.13 by disabling Lua unless allow-rules
>   is true in the security lua configuration section.
> - Drop first patch (not needed since
>   https://github.com/OISF/suricata/commit/c8a3aa608eaae1acbaf33dba8a7c1a3cbfeb4285)
> 
> https://github.com/OISF/suricata/blob/suricata-6.0.14/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Peter Korsgaard):
>  - Do not wrongly delete second patch
> 
>  .checkpackageignore                           |  3 +-
>  ...ow-the-user-to-override-RUST_TARGET.patch} |  0
>  ...ure-proper-shabang-on-python-scripts.patch | 47 -------------------
>  package/suricata/suricata.hash                |  2 +-
>  package/suricata/suricata.mk                  |  5 +-
>  5 files changed, 4 insertions(+), 53 deletions(-)
>  rename package/suricata/{0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch => 0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch} (100%)
>  delete mode 100644 package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index ecb8609ee9..0c7fae9409 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1355,8 +1355,7 @@ package/statserial/0001-ncurses-link.patch Upstream
>  package/stunnel/S50stunnel Indent Shellcheck Variables
>  package/sudo/0001-configure.ac-fix-openssl-static-build.patch Upstream
>  package/supervisor/S99supervisord Variables
> -package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch Upstream
> -package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream
> +package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream
>  package/suricata/S99suricata Shellcheck
>  package/swupdate/swupdate.sh Shellcheck
>  package/sylpheed/0001-harden-link-checker-before-accepting-click.patch Upstream
> diff --git a/package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch b/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
> similarity index 100%
> rename from package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
> rename to package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
> diff --git a/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch b/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
> deleted file mode 100644
> index 424b30d317..0000000000
> --- a/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 44fe2328b715db25134ee095526d2fa47e6cd834 Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Wed, 1 Jan 2020 15:25:57 +0100
> -Subject: [PATCH] python: ensure proper shabang on python scripts
> -
> -When instlling python scripts, distutils would use the python used to
> -run setup.py as shabang for the scripts it installs.
> -
> -However, when cross-compiling, this is most often not correct.
> -
> -Instead, using '/usr/bin/env python' is guaranteed to find the proper
> -python in the PATH, so we need to instruct setyup.py to use that as the
> -executable.
> -
> -[yann.morin.1998@free.fr:
> -  - author did not provide their SoB, but it's simple enough to
> -    not require it for once
> -  - provide proper commit log
> -]
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> -[Fabrice: update for 6.0.0]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - python/Makefile.am | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/python/Makefile.am b/python/Makefile.am
> -index 59d195f29..a41604f72 100644
> ---- a/python/Makefile.am
> -+++ b/python/Makefile.am
> -@@ -6,11 +6,11 @@ EXTRA_DIST =	setup.py \
> - if HAVE_PYTHON_DISTUTILS
> - all-local:
> - 	cd $(srcdir) && \
> --		$(HAVE_PYTHON) setup.py build --build-base "$(abs_builddir)"
> -+		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base "$(abs_builddir)"
> - 
> - install-exec-local:
> - 	cd $(srcdir) && \
> --		$(HAVE_PYTHON) setup.py build --build-base "$(abs_builddir)" \
> -+		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base "$(abs_builddir)" \
> - 		install --prefix $(DESTDIR)$(prefix)
> - 
> - uninstall-local:
> --- 
> -2.20.1
> -
> diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
> index 38ab5e9cd3..49341984a2 100644
> --- a/package/suricata/suricata.hash
> +++ b/package/suricata/suricata.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  00173634fa76aee636e38a90b1c02616c903e42173107d47b4114960b5fbe839  suricata-6.0.6.tar.gz
> +sha256  cfa93de900d0fd8ba67c79fddec58fb7afb8f6c45b0773040035a15407b796ce  suricata-6.0.14.tar.gz
>  
>  # Hash for license files:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
> index 72b72cc94d..2aa5a0c5ed 100644
> --- a/package/suricata/suricata.mk
> +++ b/package/suricata/suricata.mk
> @@ -4,13 +4,12 @@
>  #
>  ################################################################################
>  
> -SURICATA_VERSION = 6.0.6
> +SURICATA_VERSION = 6.0.14
>  SURICATA_SITE = https://www.openinfosecfoundation.org/download
>  SURICATA_LICENSE = GPL-2.0
>  SURICATA_LICENSE_FILES = COPYING LICENSE
>  SURICATA_CPE_ID_VENDOR = oisf
> -# 0001-python-ensure-proper-shabang-on-python-scripts.patch
> -# 0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
> +# 0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
>  SURICATA_AUTORECONF = YES
>  
>  SURICATA_DEPENDENCIES = \
> -- 
> 2.40.1
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
