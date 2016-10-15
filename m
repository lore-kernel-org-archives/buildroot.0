From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 17:25:04 +0200
Subject: [Buildroot] [PATCH v3 3/8] package/gflags: includes
 TARGET_CXXFLAGS to the overloaded CXXFLAGS
In-Reply-To: <20161015094437.6989-4-s.martin49@gmail.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
 <20161015094437.6989-4-s.martin49@gmail.com>
Message-ID: <ddd70470-6eae-2485-887c-7403f200b680@mind.be>
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
>  package/gflags/gflags.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
> index 9dc4e15..89111ed 100644
> --- a/package/gflags/gflags.mk
> +++ b/package/gflags/gflags.mk
> @@ -11,7 +11,8 @@ GFLAGS_LICENSE = BSD-3c
>  GFLAGS_LICENSE_FILES = COPYING.txt
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> -GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF -DCMAKE_CXX_FLAGS=-DNO_THREADS
> +GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF \
> +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DNO_THREADS"
>  endif
>  
>  $(eval $(cmake-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
