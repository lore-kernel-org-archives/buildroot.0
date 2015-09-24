From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 15:56:39 +0100
Subject: [Buildroot] [PATCH] graphite2: new package
In-Reply-To: <1443105369-30869-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1443105369-30869-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <56040F27.4060505@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 09/24/2015 03:36 PM, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/lib/libgraphite2.so.3.0.1
output/target/usr/lib/libgraphite2.so.3.0.1: ELF 64-bit LSB shared
object, MIPS, MIPS64 rel2 version 1 (SYSV), dynamically linked, with
unknown capability 0x756e670000000f41 = 0x104000000070100, stripped

One nit-pick comment below; please scroll down.

[snip]

> diff --git a/package/graphite2/Config.in b/package/graphite2/Config.in
> new file mode 100644
> index 0000000..4db0835
> --- /dev/null
> +++ b/package/graphite2/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_GRAPHITE2
> +	bool "graphite2"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  Graphite is a project within SIL's scripts and software dev
> +	  groups to provide cross-platform rendering for complex
> +	  writing systems.

You could have the same in only two lines if you wrap them to 72 characters.

Regards,

Vincent.

[snip]
