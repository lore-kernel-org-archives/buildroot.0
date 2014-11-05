From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Nov 2014 08:22:27 +0100
Subject: [Buildroot] [PATCH] gst1-validate: needs python
In-Reply-To: <1415135275-8828-1-git-send-email-ps.report@gmx.net>
References: <1415135275-8828-1-git-send-email-ps.report@gmx.net>
Message-ID: <20141105082227.51e7d4c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue,  4 Nov 2014 22:07:55 +0100, Peter Seiderer wrote:

> diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
> index 4972cac..6cc0f65 100644
> --- a/package/gstreamer1/gst1-validate/gst1-validate.mk
> +++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
> @@ -12,6 +12,8 @@ GST1_VALIDATE_LICENSE_FILES = COPYING
>  
>  GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
>  
> -GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base
> +GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base \
> +	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
> +	$(if $(BR2_PACKAGE_PYTHON3),python3,python)

I've indeed looked at the package source code, and it seems to need
both Python on the target, and Python on the host (to byte-compile
files).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
