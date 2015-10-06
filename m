From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Oct 2015 22:42:09 +0100
Subject: [Buildroot] [PATCH v5 1/3] python-numpy: introduce
 ARCH_SUPPORTS hidden variable
In-Reply-To: <1444126016-8815-1-git-send-email-gwenj@trabucayre.com>
References: <1444126016-8815-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <56144031.3030304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-10-15 11:06, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Some packages selects python-numpy. This package has a some CPU specific
> code. To simplify and avoid duplicate dependencies this patch introduce an
> hidden ARCH_SUPPORTS variable.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> Changes v4 -> v5:
>  * Re-add hidden variable.
> ---
>  package/python-numpy/Config.in | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
> index f8170f8..f25102a 100644
> --- a/package/python-numpy/Config.in
> +++ b/package/python-numpy/Config.in
> @@ -1,9 +1,13 @@
> -config BR2_PACKAGE_PYTHON_NUMPY
> -	bool "python-numpy"
> +config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	bool
>  	# Numpy has some CPU specific code
>  	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
>  		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
>  		|| BR2_sh || BR2_x86_64
> +
> +config BR2_PACKAGE_PYTHON_NUMPY
> +	bool "python-numpy"
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	help
>  	  NumPy is the fundamental package for scientific computing
>  	  with Python.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
