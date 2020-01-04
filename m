From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:29:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.11.4
In-Reply-To: <20200104151457.2973445-1-bernd.kuhls@t-online.de>
References: <20200104151457.2973445-1-bernd.kuhls@t-online.de>
Message-ID: <20200104162934.4acfa319@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jan 2020 16:14:57 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Version 4.11.3 fixes
> 
> CVE-2019-14861: Samba AD DC zone-named record Denial of Service in DNS
>                 management server (dnsserver).
> CVE-2019-14870: DelegationNotAllowed not being enforced in protocol
>                 transition on Samba AD DC.
> 
> Changelog:
> https://www.samba.org/samba/history/samba-4.11.3.html
> https://www.samba.org/samba/history/samba-4.11.4.html
> 
> Removed patches applied upstream, rebased patch 0002.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ilt-heimdal-build-tools-in-case-of-.patch} |   8 +-
>  .../samba4/0002-waf-upgrade-to-2.0.18.patch   | 736 ------------------
>  ....patch => 0003-Fix-unistd.h-include.patch} |   0
>  ...t_args-instead-of-exec_args-to-suppo.patch |  62 --
>  ...004-Include-stdint.h-before-cmoka.h.patch} |   0
>  ...re-forking-if-cross-compilation-is-e.patch |  40 -
>  ...s-environment-to-cross-execute-tests.patch |  36 -
>  ...autobuild-harden-samba-xc-test-suite.patch |  59 --
>  ...cript_build-do-not-add-host-include-.patch |  30 -
>  package/samba4/samba4.hash                    |   4 +-
>  package/samba4/samba4.mk                      |   2 +-
>  11 files changed, 7 insertions(+), 970 deletions(-)
>  rename package/samba4/{0007-build-find-pre-built-heimdal-build-tools-in-case-of-.patch => 0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch} (96%)
>  delete mode 100644 package/samba4/0002-waf-upgrade-to-2.0.18.patch
>  rename package/samba4/{0008-Fix-unistd.h-include.patch => 0003-Fix-unistd.h-include.patch} (100%)
>  delete mode 100644 package/samba4/0003-wafsamba-use-test_args-instead-of-exec_args-to-suppo.patch
>  rename package/samba4/{0010-Include-stdint.h-before-cmoka.h.patch => 0004-Include-stdint.h-before-cmoka.h.patch} (100%)
>  delete mode 100644 package/samba4/0004-wafsamba-avoid-pre-forking-if-cross-compilation-is-e.patch
>  delete mode 100644 package/samba4/0005-wafsamba-pass-environment-to-cross-execute-tests.patch
>  delete mode 100644 package/samba4/0006-autobuild-harden-samba-xc-test-suite.patch
>  delete mode 100644 package/samba4/0009-heimdal_build-wscript_build-do-not-add-host-include-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
