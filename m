From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 17:37:51 +0200
Subject: [Buildroot] [PATCH v3 7/8] package/rpi-userland: includes
 TARGET_CFLAGS to the overloaded CFLAGS
In-Reply-To: <20161015094437.6989-8-s.martin49@gmail.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
 <20161015094437.6989-8-s.martin49@gmail.com>
Message-ID: <85b9d7b4-79d3-b258-1e94-38a61a377bb1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Just noticed now: in the subject, s/includes/include/

On 15-10-16 11:44, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/rpi-userland/rpi-userland.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 86cde87..4a6eb41 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -10,7 +10,8 @@ RPI_USERLAND_LICENSE = BSD-3c
>  RPI_USERLAND_LICENSE_FILES = LICENCE
>  RPI_USERLAND_INSTALL_STAGING = YES
>  RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr \
> -	-DCMAKE_C_FLAGS="-DVCFILED_LOCKFILE=\\\"/var/run/vcfiled.pid\\\""
> +	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) \
> +		-DVCFILED_LOCKFILE=\\\"/var/run/vcfiled.pid\\\""
>  
>  RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
