From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Nov 2014 12:04:51 +0000
Subject: [Buildroot] [PATCH] pwgen: bump to version 2.07
In-Reply-To: <1415185810-9579-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415185810-9579-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <545A1263.3000902@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/05/2014 11:10 AM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pwgen/pwgen.hash | 3 +++
>  package/pwgen/pwgen.mk   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 package/pwgen/pwgen.hash
> 
> diff --git a/package/pwgen/pwgen.hash b/package/pwgen/pwgen.hash
> new file mode 100644
> index 0000000..2997ed3
> --- /dev/null
> +++ b/package/pwgen/pwgen.hash
> @@ -0,0 +1,3 @@
> +# From http://sourceforge.net/projects/pwgen/files/pwgen/2.07/
> +md5	910b1008cdd86445e9e01305d21ee4c5	pwgen-2.07.tar.gz
> +sha1	51180f9cd5530d79eea18b2443780dec4ec5ea43	pwgen-2.07.tar.gz
> diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
> index cdc2fd3..9810097 100644
> --- a/package/pwgen/pwgen.mk
> +++ b/package/pwgen/pwgen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PWGEN_VERSION = 2.06
> +PWGEN_VERSION = 2.07
>  PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
>  PWGEN_LICENSE = GPLv2
>  PWGEN_LICENSE_FILES = debian/copyright
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile-test on MIPS architecture plus checking the files are actually
installed in target and were built for the right architecture.

$ file output/target/usr/bin/pwgen
output/target/usr/bin/pwgen: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.16, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
