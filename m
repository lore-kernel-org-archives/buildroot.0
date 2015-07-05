From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 14:53:50 +0200
Subject: [Buildroot] [PATCH v8 3/7] package/opencv: add a choice for
 selecting the gui toolkit
In-Reply-To: <1436089229-21103-4-git-send-email-s.martin49@gmail.com>
References: <1436089229-21103-1-git-send-email-s.martin49@gmail.com>
 <1436089229-21103-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20150705145350.5b5d56b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  5 Jul 2015 11:40:25 +0200, Samuel Martin wrote:

> +choice
> +	prompt "gui toolkit"
> +	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> +	help
> +	  GUI toolkit for opencv_highgui module.
> +
> +	  The best toolkit to work with OpenCV are, in decreasing order of
> +	  preference by the OpenCV build system):
> +	  - Qt4
> +	  - gtk2
> +
> +	  Note that, whatever you choose here will be used by OpenCV, even
> +	  if you also enabled a more preferred toolkit in your Buildroot
> +	  configuration.

This comment really doesn't make sense. Why do we care about the
preferred order of OpenCV for GUI toolkit, since we are anyway
overriding it by the below options? Why don't you simply have:

	help
	  GUI toolkit to be used by the opencv_highgui module.

The additional comments about the preferred order by OpenCV build
system are simply confusing and useless, IMO. If you agree, I can apply
this patch after reworking the comment.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
