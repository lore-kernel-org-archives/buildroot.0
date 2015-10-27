From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 27 Oct 2015 14:41:57 +0000
Subject: [Buildroot] [PATCH v5 1/1] yad: new package
In-Reply-To: <1445641812-7704-1-git-send-email-james.knight@rockwellcollins.com>
References: <1445641812-7704-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <562F8D35.3000602@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On 10/24/2015 12:10 AM, James Knight wrote:
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
[snip]
> diff --git a/package/yad/Config.in b/package/yad/Config.in
> new file mode 100644
> index 0000000..9b16729
> --- /dev/null
> +++ b/package/yad/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_YAD
> +	bool "yad"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  YAD (yet another dialog) is a tool for create graphical dialogs from

That line exceeds the 72 characters limit considering 8-characters-wide
tabs.

Apart from that minor detail, which I guess after 5 versions of your
patch the maintainer will not mind to fix it for you, your patch looks
good to me.

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/bin/yad
output/target/usr/bin/yad: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
2.6.32, with unknown capability 0xf41 = 0x756e6700, with unknown
capability 0x70100 = 0x1040000, stripped


Regards,

Vincent.
