From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 Oct 2017 15:35:54 +0200
Subject: [Buildroot] [PATCH 1/2] matchbox-lib: select dependency
In-Reply-To: <fc7e8fd1cfa1d2ffee7e0ec0ac91f787e9caef45.1506851870.git.yann.morin.1998@free.fr>
References: <cover.1506851870.git.yann.morin.1998@free.fr>
 <fc7e8fd1cfa1d2ffee7e0ec0ac91f787e9caef45.1506851870.git.yann.morin.1998@free.fr>
Message-ID: <192b3438-653d-c32f-53bb-234843ee8ab4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-10-17 11:58, Yann E. MORIN wrote:
> Select the library we build-depend on.
> 
> Add myself to developpers for matchbos packages.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  DEVELOPERS                     | 1 +
>  package/matchbox-lib/Config.in | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cedf5a6f84..5a1ca877de 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1819,6 +1819,7 @@ F:	package/libinput/
>  F:	package/libiscsi/
>  F:	package/libseccomp/
>  F:	package/linux-tools/
> +F:	package/matchbox*
>  F:	package/mesa3d-headers/
>  F:	package/nbd/
>  F:	package/nut/
> diff --git a/package/matchbox-lib/Config.in b/package/matchbox-lib/Config.in
> index e50a5436c1..d758ab35a8 100644
> --- a/package/matchbox-lib/Config.in
> +++ b/package/matchbox-lib/Config.in
> @@ -1,4 +1,5 @@
>  config BR2_PACKAGE_MATCHBOX_LIB
>  	bool "matchbox-lib"
> +	select BR2_PACKAGE_XLIB_LIBXEXT

 matchbox-lib also has a DEPENDENCIES on expat. expat is indeed selected by the
top-level matchbox package, but that package doesn't actually have it in its
DEPENDENCIES. So perhaps move expat as well?

 Otherwise:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

>  	help
>  	  Matchbox common functionality library.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
