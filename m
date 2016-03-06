From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 16:07:17 +0100
Subject: [Buildroot] [RFC 1/1] package/binutils: add binutils 2.26
In-Reply-To: <1454865802-15618-1-git-send-email-romain.naour@gmail.com>
References: <1454865802-15618-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160306160717.4ae727c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sun,  7 Feb 2016 18:23:22 +0100, Romain Naour wrote:
> - Rebase patches from 2.25 on top of 2.26.
> - Use git format for patches
> - remove upstreamed xtensa patches
> 
> The first patch [1] is needed to be able to build glibc with binutils 2.26 on nios2.
> The second from [2] fix an assertion issue with ld.
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=a7be2893a6449e64fe6cfcdd8700b0a367a69f19
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=19405
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/binutils/2.26/0120-sh-conf.patch           |  46 ++++
>  package/binutils/2.26/0300-ld-makefile.patch       |  41 +++
>  .../2.26/0301-check-ldrunpath-length.patch         |  36 +++
>  .../2.26/0500-add-sysroot-fix-from-bug-3049.patch  |  52 ++++
>  .../2.26/0600-poison-system-directories.patch      | 306 +++++++++++++++++++++
>  ...900-Correct-nios2-_gp-address-computation.patch | 108 ++++++++
>  ...on-reduce-number-of-messages-about-FDE-en.patch |  67 +++++
>  ...-xtensa-fix-signedness-of-gas-relocations.patch | 101 +++++++
>  package/binutils/Config.in.host                    |   4 +
>  package/binutils/binutils.hash                     |   1 +
>  10 files changed, 762 insertions(+)
>  create mode 100644 package/binutils/2.26/0120-sh-conf.patch
>  create mode 100644 package/binutils/2.26/0300-ld-makefile.patch
>  create mode 100644 package/binutils/2.26/0301-check-ldrunpath-length.patch
>  create mode 100644 package/binutils/2.26/0500-add-sysroot-fix-from-bug-3049.patch
>  create mode 100644 package/binutils/2.26/0600-poison-system-directories.patch
>  create mode 100644 package/binutils/2.26/0900-Correct-nios2-_gp-address-computation.patch
>  create mode 100644 package/binutils/2.26/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch
>  create mode 100644 package/binutils/2.26/0902-xtensa-fix-signedness-of-gas-relocations.patch

Applied to master, thanks. One day it would be good to work on
upstreaming the old patches (0120, 0300, 0301 and 0500).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
