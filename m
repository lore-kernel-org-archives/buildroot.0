From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jun 2013 17:17:02 +0200
Subject: [Buildroot] [PATCH] usbmount: stop using blkid,
 use udev environment variables instead
In-Reply-To: <1371653634.3873.13.camel@sven>
References: <1371652082-3515-1-git-send-email-s.neumann@raumfeld.com>
 <20130619164656.33bc3f8c@skate> <1371653634.3873.13.camel@sven>
Message-ID: <20130619171702.4d5a5e6b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sven Neumann,

On Wed, 19 Jun 2013 16:53:54 +0200, Sven Neumann wrote:

> > If this dependency is only for util-linux and you remove the select
> > BR2_PACKAGE_UTIL_LINUX below, you could get rid of this dependency.
> 
> Well, in fact the dependency still exists as usbmount needs udev and
> udev needs libblkid from util-linux. So perhaps udev should have a
> dependency on BR2_LARGEFILE && BR2_USE_WCHAR ?!

No, because usbmount has a *depends on* udev. So until udev is enabled,
you can't enable usbmount.

The propagation of "depends on" is needed when a package *selects*
another package.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
