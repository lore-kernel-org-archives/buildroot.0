From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 22:08:00 +0100
Subject: [Buildroot] [PATCH 1/1] gst1-vaapi: new package
In-Reply-To: <1481813631-23515-1-git-send-email-jbb@gamblify.com> ("Jesper
 =?utf-8?Q?B=C3=A6kdahl=22's?= message of "Thu, 15 Dec 2016 15:53:51 +0100")
References: <1481813631-23515-1-git-send-email-jbb@gamblify.com>
Message-ID: <87lgvgc34f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jesper" == Jesper B?kdahl <jbb@gamblify.com> writes:

 > Signed-off-by: Jesper B?kdahl <jbb@gamblify.com>

Thanks for the patch. Besides the feedback Thomas already provided:

> +################################################################################
 > +#
 > +# gst1-vaapi
 > +#
 > +################################################################################
 > +
 > +GST1_VAAPI_VERSION = 1.10.2
 > +GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 > +GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 > +GST1_VAAPI_DEPENDENCIES = gstreamer1 gst1-plugins-base gst1-plugins-bad libva libdrm
 > +GST1_VAAPI_LICENSE = GPLv2+
 > +GST1_VAAPI_LICENSE_FILES = COPYING

That is not correct. The tarball doesn't even have a COPYING file. It
should be:

GST1_VAAPI_LICENSE = LGPLv2.1+
GST1_VAAPI_LICENSE_FILES = COPYING.LIB

-- 
Bye, Peter Korsgaard
