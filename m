From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 19 Jun 2013 16:53:54 +0200
Subject: [Buildroot] [PATCH] usbmount: stop using blkid,
 use udev environment variables instead
In-Reply-To: <20130619164656.33bc3f8c@skate>
References: <1371652082-3515-1-git-send-email-s.neumann@raumfeld.com>
 <20130619164656.33bc3f8c@skate>
Message-ID: <1371653634.3873.13.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thanks for the quick review.

On Wed, 2013-06-19 at 16:46 +0200, Thomas Petazzoni wrote:

> On Wed, 19 Jun 2013 16:28:02 +0200, Sven Neumann wrote:
> 
> > @@ -4,8 +4,6 @@ config BR2_PACKAGE_USBMOUNT
> >  	depends on BR2_USE_WCHAR # util-linux
> 
> If this dependency is only for util-linux and you remove the select
> BR2_PACKAGE_UTIL_LINUX below, you could get rid of this dependency.

Well, in fact the dependency still exists as usbmount needs udev and
udev needs libblkid from util-linux. So perhaps udev should have a
dependency on BR2_LARGEFILE && BR2_USE_WCHAR ?!


Regards,
Sven
