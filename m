From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Oct 2012 19:21:47 +0200
Subject: [Buildroot] [PATCH v2] at91bootstrap: fix gcc-4.6.x overlap
 linker issue
In-Reply-To: <1349800757-31873-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1349800757-31873-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <20121009192147.0d5456dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue,  9 Oct 2012 18:39:17 +0200, Gregory Hermant wrote:
> 
> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> ---
>  ...at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
> 
> diff --git a/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
> new file mode 100644
> index 0000000..b738df1
> --- /dev/null
> +++ b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
> @@ -0,0 +1,12 @@
> +diff --git a/elf32-littlearm.lds b/elf32-littlearm.lds
> +index a33952f..4f3ba25 100644
> +--- a/elf32-littlearm.lds
> ++++ b/elf32-littlearm.lds
> +@@ -7,6 +7,7 @@ SECTIONS
> + 	.text : { 
> + 		_stext = .;
> + 		*(.text)
> ++		*(.text*)
> + 		*(.rodata)                 /* read-only data (constants) */
> + 		*(.rodata*)
> + 		. = ALIGN(4);

Your patch lacks a description and Signed-off-by.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
