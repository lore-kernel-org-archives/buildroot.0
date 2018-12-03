From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:29:05 +0100
Subject: [Buildroot] [PATCH v2,1/1] libbsd: fix display of comment
In-Reply-To: <20181203210320.20133-1-fontaine.fabrice@gmail.com>
References: <20181203210320.20133-1-fontaine.fabrice@gmail.com>
Message-ID: <20181203222905.49139be8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 22:03:20 +0100, Fabrice Fontaine wrote:
> Commit e13855c48f21eaee07a81f8b02678839be274a45 wrongly added
> depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
> to display the comment "libbsd needs a toolchain w/ threads, wchar"
> The same error has also been made for minizip
> 
> To fix this issue, move dependency
> !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) under
> BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - move dependency
>    !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) under
>    BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
