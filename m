From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 21:36:10 +0100
Subject: [Buildroot] [PATCH v2 0/5] Update LTTng packages to 2.8.x and
 Babeltrace to 1.4.0
In-Reply-To: <20161030195649.6415-1-eeppeliteloop@gmail.com>
References: <20161030195649.6415-1-eeppeliteloop@gmail.com>
Message-ID: <20161030203610.GE18077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-30 15:56 -0400, Philippe Proulx spake thusly:
> See individual patches for changes.
> 
> Tell me if it's okay to put patches found on the mailing list and from
> the package source of other distributions as is, only with the file
> names changed.

When you carry patches from upstream, or patches already submitted
upstream (e.g. in a PR or a mailing list), state so in the patch. For
example:

    [PATCH] foo/bar: blablabla
    
    This blablabla the foo-bar.

    Signed-off-by: Original AUTHOR <bla@there>
    [Philippe: backport from upstream commit 12345678]
    Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

If it was from a mailing list, add a URL to the list archive with the
patch.

Use your own imagination on how to refer to other upstream locations,
like github PRs and such. ;-)

Also, as Thomas already replied, try not to have the patch number in the
titles, because the paches we cary in Buildroot may change numbering
(e.g. we only carry patches 2 and 5 of a 7-patch series). So, the
original numbers do not make sense.

Regards,
Yann E. MORIN.

> Philippe Proulx (5):
>   lttng-libust: bump to version 2.8.1
>   lttng-tools: bump to version 2.8.2
>   lttng-tools: remove dependency on host-lttng-babeltrace
>   lttng-modules: bump to version 2.8.3
>   lttng-babeltrace: bump to version 1.4.0
> 
>  ...c-remove-elfutils-version-test-for-Buildr.patch |  30 ++
>  .../0001-no-posix-fallocate-in-uclibc.patch        |  37 --
>  ...ix-uuid-support-detection-on-static-build.patch |  63 ---
>  ...b-Makefile.am-remove-unneeded-static-flag.patch |  36 ++
>  package/lttng-babeltrace/Config.in                 |  13 +-
>  package/lttng-babeltrace/lttng-babeltrace.hash     |  11 +-
>  package/lttng-babeltrace/lttng-babeltrace.mk       |  17 +-
>  ...lf.c-define-NT_GNU_BUILD_ID-if-not-define.patch |  31 ++
>  package/lttng-libust/lttng-libust.hash             |  12 +-
>  package/lttng-libust/lttng-libust.mk               |  10 +-
>  package/lttng-modules/lttng-modules.hash           |   8 +-
>  package/lttng-modules/lttng-modules.mk             |  27 +-
>  ...ld-failure-when-__GLIBC_PREREQ-is-missing.patch |  55 ---
>  ...Fix-snapshot-del-output-with-name-on-musl.patch |  28 ++
>  .../0002-Fix-add-missing-sys-types.h-header.patch  |  29 --
>  ...Fix-strerror_r-behavior-is-glibc-specific.patch |  26 ++
>  ...et-thread-stack-size-to-ulimit-soft-value.patch | 427 +++++++++++++++++++++
>  package/lttng-tools/lttng-tools.hash               |   8 +-
>  package/lttng-tools/lttng-tools.mk                 |  17 +-
>  19 files changed, 654 insertions(+), 231 deletions(-)
>  create mode 100644 package/lttng-babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
>  delete mode 100644 package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
>  delete mode 100644 package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
>  create mode 100644 package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
>  create mode 100644 package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
>  delete mode 100644 package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
>  create mode 100644 package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
>  delete mode 100644 package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
>  create mode 100644 package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
>  create mode 100644 package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch
> 
> --
> 2.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
