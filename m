From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Feb 2019 23:09:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version to
 83977fe3b6
In-Reply-To: <20190223155437.0988855f@windsurf.home>
References: <20190222223704.6202-1-ps.report@gmx.net>
 <20190222223704.6202-2-ps.report@gmx.net>
 <20190223143753.59fcb120@windsurf.home>
 <20190223152711.6caac341@gmx.net>
 <20190223155437.0988855f@windsurf.home>
Message-ID: <20190223230906.1e7bc39f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 23 Feb 2019 15:54:37 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
> 
> Thanks for your feedback!
> 
> On Sat, 23 Feb 2019 15:27:11 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > > What is the reason for bumping to 83977fe3b6 in master ? And then to
> > > ebf7b40cdc in next ?    
> > 
> > Sorry for the confusion, preparing the bump (maybe buildroot-master) to 
> > 
> >  - kernel 877656cd14 (4.14.98, up-to-date one from the 4.14 branch)
> >  - firmware 83977fe3b6, last commit before [1]:
> >  
> > 	kernel bump to 4.19.23
> > 
> > 	See: https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=224931  
> 
> What are the firmware changes between what's currently in master and
> 83977fe3b6 ? Does it make sense to apply this to master ?

Did not look at the (two) commits in detail, but I think as most firmware commits
mention the specific kernel version it is the best to keep kernel/firmware in par?

The two commit logs are:

commit 83977fe3b6ef54c1d29c83b0a778d330f523441f
Author: popcornmix <popcornmix@gmail.com>
Date:   Tue Feb 12 21:36:56 2019 +0000

    kernel: Bump to 4.14.98
    
    kernel: balenaFin v1.1.0 carrier board update
    See: https://github.com/raspberrypi/linux/pull/2852
    
    kernel: configs: Enable the AD193x codecs
    See: https://github.com/raspberrypi/linux/issues/2850
    
    firmware: camera/image_encode: Add timestamp to frames encoded with image_encode
    See: https://github.com/raspberrypi/linux/issues/2351

commit ea3841a7f916895a98da5c5972cca68baff8aac3
Author: popcornmix <popcornmix@gmail.com>
Date:   Tue Feb 5 14:10:03 2019 +0000

    kernel: Bump to 4.14.97
    
    kernel: audioinjector-octo: revert to dummy supplies
    See: https://github.com/raspberrypi/linux/pull/2834


Both do not only touch the binary kernel/module images but although overlay
files and/or the boot files start/fixup...

> 
> > overlapped with the release of 4.19.23 [3] and the follow up bump (major kernel
> > update for buildroot-next) to
> > 
> >   - kernel 5eeff139ea (4.19.23)
> >   - firmware ebf7b40cdc [2], one commit after [1],  
> 
> So the firmware version ebf7b40cdc is needed to boot a 4.19 kernel ? Is
> it backward compatible with the 4.14 kernel ?

Do not know (and hard to judge from the changed dtb binary blobs) and did not
test it, but would like to keep kernel/firmware in par (see above)...

Regards,
Peter

> 
> Thomas
