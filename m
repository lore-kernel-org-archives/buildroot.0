From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Nov 2014 17:14:37 +0000
Subject: [Buildroot] [PATCH] barebox: bump to version 2014.11.0
In-Reply-To: <1415205285-29952-1-git-send-email-fabio.porcedda@gmail.com>
References: <1415205285-29952-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <545A5AFD.1030701@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On 11/05/2014 04:34 PM, Fabio Porcedda wrote:
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  boot/barebox/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 4edab1f..f534f98 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -12,7 +12,7 @@ choice
>  	  Select the specific Barebox version you want to use
>  
>  config BR2_TARGET_BAREBOX_LATEST_VERSION
> -	bool "2014.10.0"
> +	bool "2014.11.0"
>  
>  config BR2_TARGET_BAREBOX_CUSTOM_VERSION
>  	bool "Custom version"
> @@ -40,7 +40,7 @@ endif
>  
>  config BR2_TARGET_BAREBOX_VERSION
>  	string
> -	default "2014.10.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
> +	default "2014.11.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
>  	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
>  	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
>  	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile-test on MIPS architecture using the img-ci20 barebox defconfig.
Also checking the files are actually installed in target and were built
for the right architecture.

$ file output/target/usr/bin/bareboxenv
output/target/usr/bin/bareboxenv: ELF 32-bit LSB executable, MIPS,
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.16, with unknown capability 0xf41 = 0x756e6700, with
unknown capability 0x70100 = 0x1040000, stripped

$ ls output/images/barebox.bin
output/images/barebox.bin

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
