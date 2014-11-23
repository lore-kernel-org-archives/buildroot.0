From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 14:19:58 +0100
Subject: [Buildroot] [PATCH 0/4] nfs-utils: fix static build (branch
	yem/for-release)
Message-ID: <cover.1416748649.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series fixes nfs-utils for static builds.
Not much to say besides what the various changelogs already say.

If needed, I can drop renaming the patches if it is not wanted for the
master branch, or they can be folded each into its following changeset.

Regards,
Yann E. MORIN.


The following changes since commit a5fc4225539a44eabf8b4ba9056a646ade14bf65:

  infra: do not append an empty LD_LIBRARY_PATH (2014-11-23 14:14:58 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/for-release

for you to fetch changes up to 11a2fb7a110021c76aeee7d6ee193932d6c5b569:

  package/nfs-utils: use pkg-config to find libtirpc (2014-11-23 14:16:24 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/libtirpc: rename patches
      package/libtirpc: add -pthread to the private libraries
      package/nfs-utils: rename patches
      package/nfs-utils: use pkg-config to find libtirpc

 ...ble-parts-of-TIRPC-requiring-NIS-support.patch} |  0
 ...ut-RPC-support-does-not-install-rpcent.h.patch} |  0
 ...patch => 0003-Make-IPv6-support-optional.patch} |  0
 ...dd-rpcgen-program-from-nfs-utils-sources.patch} |  0
 ...y-generate-XDR-header-files-from-.x-sour.patch} |  0
 ...-files-needed-to-build-rpcbind-on-top-of.patch} |  0
 package/libtirpc/0007-needs-pthread.patch          | 21 +++++++
 ...-AM_CONDITIONAL-in-conditional-execution.patch} |  0
 ...oo.patch => 0002-Patch-taken-from-Gentoo.patch} |  0
 ...-Switch-legacy-index-in-favour-of-strchr.patch} |  0
 ...libc.patch => 0004-fix-build-with-uClibc.patch} |  0
 ...of-getrpcbynumber-when-getrpcbynumber_r-.patch} |  0
 ...igure-script-find-getrpcbynumber-in-libt.patch} |  0
 ... 0007-sockaddr-h-needs-stddef-h-for-NULL.patch} |  0
 package/nfs-utils/0008-tirpc-with-pkgconfig.patch  | 71 ++++++++++++++++++++++
 15 files changed, 92 insertions(+)
 rename package/libtirpc/{libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch => 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch} (100%)
 rename package/libtirpc/{libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch => 0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch} (100%)
 rename package/libtirpc/{libtirpc-0004-Make-IPv6-support-optional.patch => 0003-Make-IPv6-support-optional.patch} (100%)
 rename package/libtirpc/{libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch => 0004-Add-rpcgen-program-from-nfs-utils-sources.patch} (100%)
 rename package/libtirpc/{libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch => 0005-Automatically-generate-XDR-header-files-from-.x-sour.patch} (100%)
 rename package/libtirpc/{libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch => 0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} (100%)
 create mode 100644 package/libtirpc/0007-needs-pthread.patch
 rename package/nfs-utils/{nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch => 0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0002-Patch-taken-from-Gentoo.patch => 0002-Patch-taken-from-Gentoo.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch => 0003-Switch-legacy-index-in-favour-of-strchr.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0004-fix-build-with-uClibc.patch => 0004-fix-build-with-uClibc.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch => 0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch => 0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch => 0007-sockaddr-h-needs-stddef-h-for-NULL.patch} (100%)
 create mode 100644 package/nfs-utils/0008-tirpc-with-pkgconfig.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
