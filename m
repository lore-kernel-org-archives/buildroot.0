From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Sep 2015 13:12:51 +0300
Subject: [Buildroot] [PATCH 3/6] python-rtslib-fb: bump version
In-Reply-To: <1441095032-5656-3-git-send-email-cvubrugier@fastmail.fm>
References: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
 <1441095032-5656-3-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20150901101251.GN17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christophe,

On Tue, Sep 01, 2015 at 10:10:29AM +0200, Christophe Vu-Brugier wrote:
> Also add new dependency to python-six.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/python-rtslib-fb/python-rtslib-fb.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
> index d45c261..85bee0b 100644
> --- a/package/python-rtslib-fb/python-rtslib-fb.mk
> +++ b/package/python-rtslib-fb/python-rtslib-fb.mk
> @@ -4,10 +4,11 @@
>  #
>  ################################################################################
>  
> -PYTHON_RTSLIB_FB_VERSION = v2.1.fb50
> +PYTHON_RTSLIB_FB_VERSION = v2.1.fb57
>  PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
>  PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
>  PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
>  PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
> +PYTHON_RTSLIB_FB_DEPENDENCIES = python-six

You should select BR2_PACKAGE_PYTHON_SIX in Config.in. Same for other package 
bumps adding python-six dependency in this series.

>  $(eval $(python-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
