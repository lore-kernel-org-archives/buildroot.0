From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Jul 2011 17:10:45 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <201107201057.48006.arnout@mind.be>
References: <201107191222.19313.arnout@mind.be>
 <CALR4fELkEBNtLS2WYXVkLkpttsMrzbHb04i+KZS+wfp3_TwMzQ@mail.gmail.com>
 <201107201057.48006.arnout@mind.be>
Message-ID: <201107201710.45727.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 20 July 2011 10:57:47, Arnout Vandecappelle wrote:
> On Wednesday 20 July 2011 10:48:28, Diego Iastrubni wrote:
> > > We could, or adjust initramfs.mk to add a small shellscript as /init
> > > rather than just a symlink:
> > > 
> > > #!/bin/sh
> > > # devtmpfs does not get automounted for initramfs'es
> > > /bin/mount -t devtmpfs devtmpfs /dev
> > > exec /sbin/init $*
> > > 
> > > Unless BR2_ROOTFS_DEVICE_CREATION_STATIC is enabled.
> > 
> > Sorry, but this solution smells just like my socks. I think wk can find a
> > better one :)
> 
>  Yeah, I also would prefer not to proliferate the number of ways that the
> init process is influenced...
> 
>  That said, the inittab solution isn't that good either.  I guess there is
> a reason why all distros have an S01mountall...


 Okay, I should have shut up and listened to the buildroot master...

 The inittab thing won't work (well) because init needs /dev to have a 
console.

 I'll see if I can produce a patch.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
