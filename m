From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Jul 2014 12:50:44 +0300
Subject: [Buildroot] [PATCH] pwgen: new package
In-Reply-To: <1404175445-4316-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404175445-4316-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140701095044.GM4425@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, Jun 30, 2014 at 09:44:05PM -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in       |  1 +
>  package/pwgen/Config.in |  7 +++++++
>  package/pwgen/pwgen.mk  | 12 ++++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/pwgen/Config.in
>  create mode 100644 package/pwgen/pwgen.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 1282c8a..9900271 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1137,6 +1137,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/procps-ng/Config.in"
>  	source "package/psmisc/Config.in"
>  endif
> +	source "package/pwgen/Config.in"
>  	source "package/quota/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/rsyslog/Config.in"
> diff --git a/package/pwgen/Config.in b/package/pwgen/Config.in
> new file mode 100644
> index 0000000..7bbc1d6
> --- /dev/null
> +++ b/package/pwgen/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PWGEN
> +	bool "pwgen"
> +	help
> +	  Pwgen is a small, GPL'ed password generator which creates passwords
> +	  which can be easily memorized by a human.
> +
> +	  http://sourceforge.net/projects/pwgen/
> diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
> new file mode 100644
> index 0000000..f0e66d2
> --- /dev/null
> +++ b/package/pwgen/pwgen.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# pwgen
> +#
> +################################################################################
> +
> +PWGEN_VERSION = 2.06
> +PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
> +PWGEN_LICENSE = GPLv2
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

What is the host version for?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
