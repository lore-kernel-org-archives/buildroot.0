From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Nov 2012 00:12:03 +0100
Subject: [Buildroot] [PATCH 09/47] package/libcegui: new package
In-Reply-To: <1351113973-17237-10-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-10-git-send-email-yann.morin.1998@free.fr>
Message-ID: <50A2D3C3.3060809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/12 23:25, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>


  I guess this again has to be a specific version for spice?  Could be good
to document that in the commit message.

  It fails to build in a toolchain without threads.

[snip]
> diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
> new file mode 100644
> index 0000000..7225f9c
> --- /dev/null
> +++ b/package/cegui06/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_CEGUI06
> +	bool "libcegui06"

  Naming is inconsistent: cegui06 is the package name, but here you call it
libcegui06 and in the commit message libcegui.

[snip]
> diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
> new file mode 100644
> index 0000000..2f562ac
> --- /dev/null
> +++ b/package/cegui06/cegui06.mk
> @@ -0,0 +1,34 @@
> +#############################################################
> +#
> +# libcegui
> +#
> +#############################################################
> +
> +CEGUI06_VERSION         = 0.6.2
> +CEGUI06_SOURCE          = CEGUI-$(CEGUI06_VERSION)b.tar.gz
> +CEGUI06_SITE            = http://downloads.sourceforge.net/project/crayzedsgui/CEGUI%20Mk-2/$(CEGUI06_VERSION)

  I would use CEGUI06_VERSION_MAJOR = 0.6.2 and
CEGUI06_VERSION = $(CEGUI06_VERSION_MAJOR)b

[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
