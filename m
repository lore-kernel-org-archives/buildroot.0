From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 17:30:36 +0200
Subject: [Buildroot] [PATCH v3 5/8] package/libcec: includes TARGET_{C,
 CXX}FLAGS to the overloaded {C, CXX}FLAGS
In-Reply-To: <20161015094437.6989-6-s.martin49@gmail.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
 <20161015094437.6989-6-s.martin49@gmail.com>
Message-ID: <9ab49a65-6a26-39f1-2c7e-95b353aeefbf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 11:44, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/libcec/libcec.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
> index b762d88..55c5fbb 100644
> --- a/package/libcec/libcec.mk
> +++ b/package/libcec/libcec.mk
> @@ -29,8 +29,9 @@ endif
>  ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>  LIBCEC_DEPENDENCIES += rpi-userland
>  LIBCEC_CONF_OPTS += \
> -	-DCMAKE_C_FLAGS="-lvcos -lvchiq_arm" \
> -	-DCMAKE_CXX_FLAGS="-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
> +	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -lvcos -lvchiq_arm" \
> +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) \
> +		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
>  		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads"
>  endif
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
