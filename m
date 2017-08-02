From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Wed, 2 Aug 2017 12:01:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] systemd: bump version to 234
In-Reply-To: <20170731142210.24593-1-aduskett@gmail.com>
References: <20170731142210.24593-1-aduskett@gmail.com>
Message-ID: <1033b846-a3bb-e7e5-6e44-993d4ce7a0db@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 31.07.2017 16:22, Adam Duskett wrote:
> Other changes:
> - Removed the following patches due to being merged upstream:
>     - resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
>     - resolved-simplify-alloc-size-calculation.patch
>     - resolved-do-not-allocate-packets-with-minimum-size.patch
> - Updated the following patches to work with 234:
>     - fix-getty-unit.patch
>     - build-check-for-ln-relative.patch
>     - fix-am-path-libgcrypt-no-found.patch
> - Updated ordering of remaining patches.
> - Reformatted remaining patches as git style patches.
> - Updated Upstream-Status comment in "build-check-for-ln-relative.patch" to
>   "Denied [No desire to support building on old distributions]"
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Changed "Prefer getty to agetty in console setup systemd units" to
>     fix-getty-unit in 0001-fix-getty-unit.patch, and put
>     "Prefer getty to agetty in console setup systemd units" as the
>     body. (Arnout)
>   - Removed comment explaining -o in units/getty at .service.m4 (Arnout)
>   - Readded indent in Configure.in (Arnout)
> 
>  package/systemd/0001-fix-getty-unit.patch          | 48 ++++++++++++++++++++
>  ...-of-null-pointer-p-question-dereferencing.patch | 28 ------------
>  ...atch => 0002-build-check-for-ln-relative.patch} | 24 +++++-----
>  ...-resolved-simplify-alloc-size-calculation.patch | 51 ----------------------
>  ...h => 0003-fix-am-path-libgcrypt-no-found.patch} | 24 +++++++---
>  ...do-not-allocate-packets-with-minimum-size.patch | 48 --------------------
>  package/systemd/0004-fix-getty-unit.patch          | 30 -------------
>  package/systemd/systemd.hash                       |  2 +-
>  package/systemd/systemd.mk                         |  2 +-
>  9 files changed, 82 insertions(+), 175 deletions(-)
>  create mode 100644 package/systemd/0001-fix-getty-unit.patch
>  delete mode 100644 package/systemd/0001-resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
>  rename package/systemd/{0005-build-check-for-ln-relative.patch => 0002-build-check-for-ln-relative.patch} (83%)
>  delete mode 100644 package/systemd/0002-resolved-simplify-alloc-size-calculation.patch
>  rename package/systemd/{0006-fix-am-path-libgcrypt-no-found.patch => 0003-fix-am-path-libgcrypt-no-found.patch} (90%)
>  delete mode 100644 package/systemd/0003-resolved-do-not-allocate-packets-with-minimum-size.patch
>  delete mode 100644 package/systemd/0004-fix-getty-unit.patch

Tested-by: Marcus Hoffmann <m.hoffmann@caretelsol.com>

Tested with Arnouts new init testing infrastructure. Basic networkd
configuration (rw + ro) builds and boots fine without any failed units.
Network is functional.

Best wishes,
Marcus
