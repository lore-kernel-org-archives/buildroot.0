From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 10:03:07 +0100
Subject: [Buildroot] [PATCH] tiff: bump to version 4.0.5
In-Reply-To: <1441221507-26382-1-git-send-email-gustavo@zacarias.com.ar>
References: <1441221507-26382-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55E95E4B.3070503@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 09/02/2015 08:18 PM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/tiff/tiff.hash | 2 +-
>  package/tiff/tiff.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
> index c594568..9cb31dc 100644
> --- a/package/tiff/tiff.hash
> +++ b/package/tiff/tiff.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256	8cb1d90c96f61cdfc0bcf036acc251c9dbe6320334da941c7a83cfe1576ef890	tiff-4.0.4.tar.gz
> +sha256	e25eaa83ed7fab43ddd278b9b14d91a406a4b674cedc776adb95535f897f309c	tiff-4.0.5.tar.gz
> diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
> index 548e47a..9a2bf70 100644
> --- a/package/tiff/tiff.mk
> +++ b/package/tiff/tiff.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TIFF_VERSION = 4.0.4
> +TIFF_VERSION = 4.0.5
>  TIFF_SITE = http://download.osgeo.org/libtiff
>  TIFF_LICENSE = tiff license
>  TIFF_LICENSE_FILES = COPYRIGHT
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ grep ^TIFF_VERSION package/tiff/tiff.mk
TIFF_VERSION = 4.0.5

$ file output/target/usr/lib/libtiff.so.5.2.3
output/target/usr/lib/libtiff.so.5.2.3: ELF 32-bit MSB shared object,
MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, with unknown
capability 0x41000000 = 0xf676e75, with unknown capability 0x10000 =
0x70401, stripped

Regards,

Vincent.
