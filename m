From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 9 Feb 2012 23:36:12 +0100
Subject: [Buildroot] Ext4 rootfs option
In-Reply-To: <878vkd3rbo.fsf@macbook.be.48ers.dk>
References: <4F3220B8.9040604@renta.net> <201202082310.49254.arnout@mind.be>
 <878vkd3rbo.fsf@macbook.be.48ers.dk>
Message-ID: <201202092336.12939.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 08 February 2012 23:15:07 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  Arnout>  I currently use genext2fs, followed by tune2fs to add the
>  Arnout> journal and e2fsck to fix the incorrect FS version number.  But
>  Arnout> it's extremely inefficient, especially since genext2fs first
>  Arnout> builds the filesystem in memory before committing to the output
>  Arnout> image.  Not good when you want to create a 500GB partition :-)
> 
> Wow, you're using Buildroot for systems with 500GB rootfs? Must be those
> binary video codecs / GPU drivers you were talking about ;)

 Actually, no.  I wrote the script so it was possible to write the image to
a block device, and it would determine the required fs size automatically.  
And then some idiot had the idea of plugging in a USB harddisk instead of 
the normal 1GB compactflash card...  Serves me right for trying to be too
generic.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
