From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jul 2017 00:10:06 +0200
Subject: [Buildroot] [PATCH v2] lirc-tools: bump to version 0.9.4d
In-Reply-To: <a9cb55ec93d8815c85e81b591b8b4b23112fe649.1498337761.git.baruch@tkos.co.il>
References: <a9cb55ec93d8815c85e81b591b8b4b23112fe649.1498337761.git.baruch@tkos.co.il>
Message-ID: <20170703001006.2b81d8ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Jun 2017 23:56:01 +0300, Baruch Siach wrote:
> Drop 0001-tools-make_rel_symlink.py-can-also-use-python2.patch. Build requires
> host-python3 since the previous version bump.
> 
> Drop upstream 0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch.
> 
> Add a patch fixing header guard macro collision with musl libc.
> 
> Set HAVE_WORKING_POLL to skip poll(2) run test that is not compatible with
> cross compilation.
> 
> Add optional dependency on libftdi1.
> 
> Cc: Rhys Williams <github@wilberforce.co.nz>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: add a patch fixing build with musl
> ---
>  ...ll.h-fix-header-guard-collision-with-musl.patch |  62 ++++++++++++
>  ...-make_rel_symlink.py-can-also-use-python2.patch |  28 ------
>  ...e-use-of-functions-killed-in-kernel-4.8.0.patch | 105 ---------------------
>  package/lirc-tools/lirc-tools.hash                 |   8 +-
>  package/lirc-tools/lirc-tools.mk                   |   8 +-
>  5 files changed, 73 insertions(+), 138 deletions(-)
>  create mode 100644 package/lirc-tools/0001-lib-curl_poll.h-fix-header-guard-collision-with-musl.patch
>  delete mode 100644 package/lirc-tools/0001-tools-make_rel_symlink.py-can-also-use-python2.patch
>  delete mode 100644 package/lirc-tools/0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
