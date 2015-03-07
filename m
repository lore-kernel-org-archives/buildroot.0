From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 7 Mar 2015 12:26:28 +0100
Subject: [Buildroot] [PATCH v4 2/3] python-cheetah: add host-package
	support
In-Reply-To: <1425553401-27461-2-git-send-email-gwenj@trabucayre.com>
References: <1425553401-27461-1-git-send-email-gwenj@trabucayre.com>
 <1425553401-27461-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMMKTW0UrGxi_P4x=SxHtqtfpJX2Dh5W=61z2QddTQmWcAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 5, 2015 at 12:03 PM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> Some packages, like GNURadio for VOLK, needs cheetah on host at buildtime.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

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
> --
> 2.0.5
>

Regards,

-- 
Samuel
