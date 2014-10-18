From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 15:03:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-autotools.mk: set
 --localstatedir=/var by default
In-Reply-To: <1413585393-8349-1-git-send-email-jkrause@posteo.de>
References: <1413585393-8349-1-git-send-email-jkrause@posteo.de>
Message-ID: <5442650D.1010207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/14 00:36, J?rg Krause wrote:
> `localstatedir` is a common autoconf variable like prefix and sysconfdir. At 
> this time 25 autotools and one generic package uses this Makefile variable. 22 
> of the autotools packages use --localstatedir=/var, the remaining use custom 
> settings.
> 
> Setting `localstatedir` to /var is consistent with the Filesystem Hierarchy 
> Standard (FHS). So it's time to move it as a common definition in the 
> autotools infrastructure. 
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/pkg-autotools.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 2c93dd9..3c5430f 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -134,6 +134,7 @@ define $(2)_CONFIGURE_CMDS
>  		--prefix=/usr \
>  		--exec-prefix=/usr \
>  		--sysconfdir=/etc \
> +		--localstatedir=/var \
>  		--program-prefix="" \
>  		--disable-gtk-doc \
>  		--disable-doc \
> @@ -165,6 +166,7 @@ define $(2)_CONFIGURE_CMDS
>  		./configure \
>  		--prefix="$$(HOST_DIR)/usr" \
>  		--sysconfdir="$$(HOST_DIR)/etc" \
> +		--localstatedir="$$(HOST_DIR)/var" \
>  		--enable-shared --disable-static \
>  		--disable-gtk-doc \
>  		--disable-doc \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
