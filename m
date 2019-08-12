From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:04:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbsd: security bump to
 version 0.10.0
In-Reply-To: <20190812163744.10101-1-fontaine.fabrice@gmail.com>
References: <20190812163744.10101-1-fontaine.fabrice@gmail.com>
Message-ID: <20190812230435.3af62777@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Aug 2019 18:37:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Update site to get the latest version
> - Update hash of license file (update in year, new file and author)
> - Remove !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) dependency,
>   __register_at_fork availability is correclty checked since
>   https://gitlab.freedesktop.org/libbsd/libbsd/commit/b0ebb0d4c26b281facbab7a774510b541637b13b
> - Includes Several security related fixes for nlist() reported by Daniel
>   Hodson and one by Coverity Scan, see
>   https://lists.freedesktop.org/archives/libbsd/2019-August/000229.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fwts/Config.in                        |  2 +-
>  ...0001-flopen-fix-build-with-musl-libc.patch | 40 -------------------
>  package/libbsd/Config.in                      |  2 -
>  package/libbsd/libbsd.hash                    |  6 +--
>  package/libbsd/libbsd.mk                      |  4 +-
>  5 files changed, 6 insertions(+), 48 deletions(-)
>  delete mode 100644 package/libbsd/0001-flopen-fix-build-with-musl-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
