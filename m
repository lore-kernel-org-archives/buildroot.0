From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 16:41:37 +0200
Subject: [Buildroot] gst-fsl plugins imx53 build error
In-Reply-To: <CB37095658C54EDB8D6AB2B9EB168DC9@JohanW7>
References: <84A636242B704DF3A957F6A111BD4ACA@JohanW7>
 <51ADF5A9C82CA04683FC48E400BD16523F0B72@039-SN2MPN1-011.039d.mgd.msft.net>
 <CB37095658C54EDB8D6AB2B9EB168DC9@JohanW7>
Message-ID: <20130522164137.46f92fa0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 22 May 2013 16:25:42 +0200, Sagaert Johan wrote:

> No , kernel 3.4.44 with custom patches specific for the TX53 module.
> There seems to be an error 'unsupported platform' don't know if it is
> related to the used kernel or if something else is causing this.

As Angolini replied to you (without Cc'ing the list, unfortunately),
you have to use a Freescale kernel for this gst-fsl plugin to work. The
mainline kernel cannot work.

menuconfig shows the following comment:

comment "gst-fsl-plugins requires an imx-specific kernel to be built"
        depends on BR2_arm && BR2_PACKAGE_GSTREAMER && !BR2_LINUX_KERNEL

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
