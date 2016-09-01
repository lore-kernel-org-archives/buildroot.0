From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2016 08:08:35 +0200
Subject: [Buildroot] How to flash eMMC
In-Reply-To: <57c76b8c.4906420a.27f90.5cd2@mx.google.com>
References: <57c76b8c.4906420a.27f90.5cd2@mx.google.com>
Message-ID: <5cfb61d3-bf1a-8156-0365-132d9af802d5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-09-16 01:43, yoda zhong wrote:
> Hi,
> 
>  
> 
> I want to know how to flash microSD images to eMMC of Beaglebone black.
> 
> Could you guide me?

 Not specific to BeagleBoneBlack, but:

 When you have both an SD card inserted and an eMMC, you should have two block
devices /dev/mmcblk0 and /dev/mmcblk1. Find out which one is the eMMC e.g. by
observing the kernel log. Then write the image to the eMMC with

cat image > /dev/mmcblk0

(assuming mmcblk0 is your eMMC of course).


 Regards,
 Arnout

> 
>  
> 
> Thanks in advance,
> 
> Jehun
> 
>  
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
