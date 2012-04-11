From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 11 Apr 2012 19:03:32 +0200
Subject: [Buildroot] [PATCH v2 2/2] BeagleBone: new board
In-Reply-To: <CA+-urNSUrDiZP60u60binQ8=HeWBuxHEjLs4DnOGGdf_akFeGg@mail.gmail.com>
References: <1331561609-26989-1-git-send-email-fhunleth@troodon-software.com>	<4F803D6E.2020402@relinux.de>	<CA+-urNS5R_3bUY_SjVFFE3nMfdDN60O_-jJALKzo3cpu2my0fw@mail.gmail.com>	<4F84662D.8070906@relinux.de>
 <CA+-urNSUrDiZP60u60binQ8=HeWBuxHEjLs4DnOGGdf_akFeGg@mail.gmail.com>
Message-ID: <4F85B964.4020000@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10.04.2012 20:18, schrieb Frank Hunleth:
> On Tue, Apr 10, 2012 at 12:56 PM, Stephan Hoffmann <sho@relinux.de> wrote:
>> at least, I prefer having ext3;-)  What would be a reason to stick to ext2?
> I had thought that Buildroot did not support creating root filesystems
> with ext3 or later. Do you run tunefs in a post-build script to add
> the journal? Also, I thought that busybox didn't support creating and
> checking ext3 or later?
I'm not sure about that. I just made the root fs as tgz and unzipped it
manually on the preformatted partition instead of dd'ing the image.
> I'm hoping that I'm wrong. I've been hearing about performance gains
> with ext4 extents and would like to see if they help on my projects.
> FWIW, I usually mount my rootfs read-only and have a writable data
> partition that can be reformatted should it get corrupted too badly.
That is, of course, a good idea. I think it's even better to run the
whole system as an initrd (if there is enough ram, of course).

This works with buildroot for the BeagleBone, too, and gives the
opportunity to have the whole system in one file.

Kind regards

Stephan
> Thanks,
> Frank


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
