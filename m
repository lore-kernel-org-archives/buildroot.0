From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Mar 2015 23:24:30 +0100
Subject: [Buildroot] [PATCH v6 2/3] python-cheetah: add host-package
	support
In-Reply-To: <1426076003-12088-2-git-send-email-gwenj@trabucayre.com>
References: <1426076003-12088-1-git-send-email-gwenj@trabucayre.com>
 <1426076003-12088-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <5500C09E.5010102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/15 13:13, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Some packages, like GNURadio for VOLK, needs cheetah on host at buildtime.
> 
> HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown is needed to avoids
> setuptools downloads markdown if it can't be find it.

 If you do post a v7, please rephrase this:

The dependency on host-python-markdown is needed to avoid that setuptools
downloads markdown if it is not installed yet.

> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
> Changes v3 -> v4:
>  * use HOST_PYTHON_CHEETAH_DEPENDENCIES instead of PYTHON_CHEETAH_DEPENDENCIES
>  * suppress '+' for dependency definition
> ---
>  package/python-cheetah/python-cheetah.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
> index 08076b5..3155951 100644
> --- a/package/python-cheetah/python-cheetah.mk
> +++ b/package/python-cheetah/python-cheetah.mk
> @@ -9,5 +9,7 @@ PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
>  PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
>  PYTHON_CHEETAH_LICENSE = MIT
>  PYTHON_CHEETAH_SETUP_TYPE = setuptools
> +HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
