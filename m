From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 23 May 2013 01:14:15 +0200
Subject: [Buildroot] gst-fsl plugins imx53 build error
In-Reply-To: <20130522164137.46f92fa0@skate>
References: <84A636242B704DF3A957F6A111BD4ACA@JohanW7>
 <51ADF5A9C82CA04683FC48E400BD16523F0B72@039-SN2MPN1-011.039d.mgd.msft.net>
 <CB37095658C54EDB8D6AB2B9EB168DC9@JohanW7> <20130522164137.46f92fa0@skate>
Message-ID: <EA49F85636214DB9BEB7E9DC825FA0DF@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear all, 

Ok, I will have to do so work to apply the board patches to the freescale kernel required for the ipu support stuff.

The binary firmware imx should be selected too I think when the fsl ipu firmware is build.

Can't this kind of situations be anticipated by the buildroot menu system ?

Regards 
Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: woensdag 22 mei 2013 16:42
Aan: Sagaert Johan
CC: buildroot at busybox.net; 'Angolini Daiane-B19406'
Onderwerp: Re: [Buildroot] gst-fsl plugins imx53 build error

Dear Sagaert Johan,

On Wed, 22 May 2013 16:25:42 +0200, Sagaert Johan wrote:

> No , kernel 3.4.44 with custom patches specific for the TX53 module.
> There seems to be an error 'unsupported platform' don't know if it is 
> related to the used kernel or if something else is causing this.

As Angolini replied to you (without Cc'ing the list, unfortunately), you have to use a Freescale kernel for this gst-fsl plugin to
work. The mainline kernel cannot work.

menuconfig shows the following comment:

comment "gst-fsl-plugins requires an imx-specific kernel to be built"
        depends on BR2_arm && BR2_PACKAGE_GSTREAMER && !BR2_LINUX_KERNEL

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
