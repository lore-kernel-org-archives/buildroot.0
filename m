From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Dec 2015 15:39:05 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/cal3d: new package
In-Reply-To: <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
 <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56756C09.9040508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-11-15 17:50, Bernd Kuhls wrote:
> This package only provides a git submodule for the vsxu package.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: no changes
> 
>  package/Config.in       |  1 +
>  package/cal3d/Config.in |  6 ++++++
>  package/cal3d/cal3d.mk  | 10 ++++++++++
>  3 files changed, 17 insertions(+)
>  create mode 100644 package/cal3d/Config.in
>  create mode 100644 package/cal3d/cal3d.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index d278e64..eb601e8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -227,6 +227,7 @@ comment "Graphic applications"
>  	source "package/rrdtool/Config.in"
>  
>  comment "Graphic libraries"
> +	source "package/cal3d/Config.in"
>  	source "package/cegui06/Config.in"
>  	source "package/directfb/Config.in"
>  	source "package/directfb-examples/Config.in"
> diff --git a/package/cal3d/Config.in b/package/cal3d/Config.in
> new file mode 100644
> index 0000000..231d905
> --- /dev/null
> +++ b/package/cal3d/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_CAL3D
> +	help
> +	  Cal3D is a skeletal based character animation library.
> +	  This package provides a git submodule for the vsxu package.
> +
> +	  https://github.com/vovoid/cal3d

 If you take this approach (which, given Yann's and Thomas's feedback, you
probably won't), then I don't think you should add a Config.in file. It makes no
sense at all for the user to be able to select this package, because it doesn't
install anything in staging or target so it cannot be used.

 Regards,
 Arnout

> diff --git a/package/cal3d/cal3d.mk b/package/cal3d/cal3d.mk
> new file mode 100644
> index 0000000..0a7813f
> --- /dev/null
> +++ b/package/cal3d/cal3d.mk
> @@ -0,0 +1,10 @@
> +################################################################################
> +#
> +# cal3d
> +#
> +################################################################################
> +
> +CAL3D_VERSION = 0f640189eec913973c64db3bc1c1685554cb7202
> +CAL3D_SITE = $(call github,vovoid,cal3d,$(CAL3D_VERSION))
> +
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
