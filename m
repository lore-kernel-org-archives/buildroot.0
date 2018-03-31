From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:52:10 +0200
Subject: [Buildroot] [PATCH] package/libbsd: enable for non-glibc
 toolchains
In-Reply-To: <20180314194356.15839-1-joerg.krause@embedded.rocks>
References: <20180314194356.15839-1-joerg.krause@embedded.rocks>
Message-ID: <20180331225210.3082b688@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Mar 2018 20:43:56 +0100, J?rg Krause wrote:
> libbsd builds now almost fine with a musl or uClibc toolchain, except
> for one issue introduced in the latest version bump. Upstream commit
> 22fbd62368c39de8ac5e249d1502d5ac0ffdef30 [1] uses the glibc-only macro
> `__GLIBC_PREREQ`. The issue is fixed by the attached patch from upstream,
> which fixes the use of `__GLIBC_PREREQ` on non-glibc toolchains.
> 
> Backported from:
> https://cgit.freedesktop.org/libbsd/patch/?id=1f8a3f7bccfc84b195218ad0086ebd57049c3490
> 
> netcat-openbsd is the only package selecting libbsd. However, building
> it still needs a glibc toolchain, as it uses `b64_ntop` which is not
> available in musl or uClibc.
> 
> Build has been successfully tested with:
>  * armv7-eabihf--glibc--bleeding-edge-2017.11-1
>  * armv7-eabihf--musl--bleeding-edge-2018.02-1
>  * armv7-eabihf--uclibc--bleeding-edge-2018.02-1
> 
> [1] https://cgit.freedesktop.org/libbsd/commit/?id=22fbd62368c39de8ac5e249d1502d5ac0ffdef30
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...n-declaration-protection-for-glibc-alread.patch | 80 ++++++++++++++++++++++
>  package/libbsd/Config.in                           |  5 +-
>  2 files changed, 82 insertions(+), 3 deletions(-)
>  create mode 100644 package/libbsd/0001-Fix-function-declaration-protection-for-glibc-alread.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
