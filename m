From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Oct 2015 22:42:22 +0100
Subject: [Buildroot] [PATCH v5 2/3] opencv3: use
 BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS instead of replicate python-numpy
 depends
In-Reply-To: <1444126016-8815-2-git-send-email-gwenj@trabucayre.com>
References: <1444126016-8815-1-git-send-email-gwenj@trabucayre.com>
 <1444126016-8815-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <5614403E.8040905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-10-15 11:06, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Opencv3 select python-numpy. To reduce CPU arch dependencies, an hidden 
> variable has been added to python-numpy package. This patch propagate this
> modification.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/opencv3/Config.in | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
> index 9492603..2f51580 100644
> --- a/package/opencv3/Config.in
> +++ b/package/opencv3/Config.in
> @@ -165,9 +165,7 @@ config BR2_PACKAGE_OPENCV3_LIB_PHOTO
>  config BR2_PACKAGE_OPENCV3_LIB_PYTHON
>  	bool "python"
>  	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> -	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
> -		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
> -		|| BR2_sh || BR2_x86_64 # python-numpy
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	select BR2_PACKAGE_PYTHON_NUMPY
>  	help
>  	  Include opencv_python module into the OpenCV build.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
