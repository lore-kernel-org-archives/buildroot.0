From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 16 Oct 2019 13:19:23 +0200
Subject: [Buildroot] allow build infrastructure to pick up installed meson
 tool
Message-ID: <20191016111927.14208-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is v3 of the patchset, only patch 1 got modifications.

Patch 1 will install a cross-compilation.conf as part of the toolchain
target, removing this logic from the meson package.

Patch 2 + Patch 3 allow picking up meson + ninja from the system,
this functionality is currently disabled.

Patch 4 moves some common functionality of the support tool
handling into a helper script.

[v2->v3]
-   rebase
-   support overriding [C,CXX,LD]FLAGS in package
-   place most logic into a HOST_MESON_CROSSCONFIG_SED variable
-   further refactoring and simplification
