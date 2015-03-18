From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Mar 2015 11:18:34 +0200
Subject: [Buildroot] [PATCH v2 1/1] tovid: new package
In-Reply-To: <1426657033-5573-1-git-send-email-skenton@ou.edu>
References: <1426657033-5573-1-git-send-email-skenton@ou.edu>
Message-ID: <20150318091834.GA7221@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Wed, Mar 18, 2015 at 12:37:13AM -0500, Steve Kenton wrote:
> diff --git a/package/tovid/tovid.hash b/package/tovid/tovid.hash
> new file mode 100644
> index 0000000..32b0831
> --- /dev/null
> +++ b/package/tovid/tovid.hash
> @@ -0,0 +1,2 @@
> +# Locally computed using sha256sum
> +sha256	09db004edc4f467beb3f70c6dde02967073cae0cac028df90b2cd4878ac246ec  tovid-3534.tar.gz

Since you use svn download method below, you should not add a .hash file. Tar 
does not guarantee identical results on different invocations, even on the 
same source tree.

> diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
> new file mode 100644
> index 0000000..9e474fb
> --- /dev/null
> +++ b/package/tovid/tovid.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# tovid
> +#
> +################################################################################
> +
> +TOVID_SITE = http://tovid.googlecode.com/svn/trunk/tovid
> +TOVID_SITE_METHOD = svn
> +TOVID_VERSION = 3534
> +TOVID_LICENSE = GPLv2.0
> +TOVID_LICENSE_FILES = COPYING
> +TOVID_DEPENDENCIES += python
> +
> +# Must be run in source directory to avoid "error: package directory 'libtovid' does not exist"
> +define TOVID_INSTALL_TARGET_CMDS
> +	bash -c "cd $(@D); ./setup.py install --root=$(TARGET_DIR) --prefix=/usr"
> +endef
> +
> +$(eval $(generic-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
