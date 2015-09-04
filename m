From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 11:52:22 +0100
Subject: [Buildroot] [PATCH v3 2/5] dos2unix: bump to version 7.3
In-Reply-To: <bfa880cbf9a72a3b23cd9176b842cb7e7dcce189.1441253454.git.baruch@tkos.co.il>
References: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
 <bfa880cbf9a72a3b23cd9176b842cb7e7dcce189.1441253454.git.baruch@tkos.co.il>
Message-ID: <55E977E6.5090307@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On 09/03/2015 05:10 AM, Baruch Siach wrote:
> Cc: James Knight <james.knight@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>    * New patch in this series
> ---
>  package/dos2unix/dos2unix.hash | 2 +-
>  package/dos2unix/dos2unix.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
> index 7880f1d85567..b22b6fc1682e 100644
> --- a/package/dos2unix/dos2unix.hash
> +++ b/package/dos2unix/dos2unix.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256	551afe005a86e58664b4f41327408e73afafe92400488dd0aab1dad6deb4e72b	dos2unix-7.0.tar.gz
> +sha256	8175f7552a72edaaa8918fdee68ce2cbc982dc25452f33d4dc611d769f4944d1	dos2unix-7.3.tar.gz
> diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
> index b1d21f27364d..0d5a67456e6b 100644
> --- a/package/dos2unix/dos2unix.mk
> +++ b/package/dos2unix/dos2unix.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOS2UNIX_VERSION = 7.0
> +DOS2UNIX_VERSION = 7.3
>  DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
>  DOS2UNIX_LICENSE = BSD-2c
>  DOS2UNIX_LICENSE_FILES = COPYING.txt
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ grep ^DOS2UNIX_VERSION package/dos2unix/dos2unix.mk
DOS2UNIX_VERSION = 7.3

$ file output/target/usr/bin/dos2unix
output/target/usr/bin/dos2unix: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Regards,

Vincent.
