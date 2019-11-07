From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 22:28:07 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/samba4: bump version to
 4.11.2
In-Reply-To: <20191106184237.29097-1-bernd.kuhls@t-online.de>
References: <20191106184237.29097-1-bernd.kuhls@t-online.de>
Message-ID: <20191107222807.6425839e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Nov 2019 19:42:37 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added patches from upstream bug tracker to fix cross-compile problems,
> removed patches applied upstream and rebase remaining patches.
> 
> The dependency to gnutls is now mandatory:
> https://blog.cryptomilk.org/2019/10/02/samba-and-gnutls/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...01-libreplace-disable-libbsd-support.patch |   8 +-
>  ...-on-64bit-platforms-by-including-std.patch | 111 ---
>  .../samba4/0002-waf-upgrade-to-2.0.18.patch   | 736 ++++++++++++++++++
>  ...io.c-include-stdint.h-before-cmoka.h.patch |  38 -
>  ...t_args-instead-of-exec_args-to-suppo.patch |  62 ++
>  package/samba4/0004-cross_compile-fix.patch   |  94 ---
>  ...re-forking-if-cross-compilation-is-e.patch |  40 +
>  package/samba4/0005-fix_unistd_incl.patch     |  27 -
>  ...s-environment-to-cross-execute-tests.patch |  36 +
>  ...autobuild-harden-samba-xc-test-suite.patch |  59 ++
>  ...uilt-heimdal-build-tools-in-case-of-.patch |  86 ++
>  .../samba4/0008-Fix-unistd.h-include.patch    |  38 +
>  ...ript_build-do-not-add-host-include-.patch} |   9 +-
>  package/samba4/Config.in                      |   2 +-
>  package/samba4/samba4.hash                    |   4 +-
>  package/samba4/samba4.mk                      |  11 +-
>  16 files changed, 1070 insertions(+), 291 deletions(-)
>  delete mode 100644 package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
>  create mode 100644 package/samba4/0002-waf-upgrade-to-2.0.18.patch
>  delete mode 100644 package/samba4/0003-test_regfio.c-include-stdint.h-before-cmoka.h.patch
>  create mode 100644 package/samba4/0003-wafsamba-use-test_args-instead-of-exec_args-to-suppo.patch
>  delete mode 100644 package/samba4/0004-cross_compile-fix.patch
>  create mode 100644 package/samba4/0004-wafsamba-avoid-pre-forking-if-cross-compilation-is-e.patch
>  delete mode 100644 package/samba4/0005-fix_unistd_incl.patch
>  create mode 100644 package/samba4/0005-wafsamba-pass-environment-to-cross-execute-tests.patch
>  create mode 100644 package/samba4/0006-autobuild-harden-samba-xc-test-suite.patch
>  create mode 100644 package/samba4/0007-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
>  create mode 100644 package/samba4/0008-Fix-unistd.h-include.patch
>  rename package/samba4/{0006-heimdal_build-wscript_build-do-not-add-host-include-.patch => 0009-heimdal_build-wscript_build-do-not-add-host-include-.patch} (84%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
