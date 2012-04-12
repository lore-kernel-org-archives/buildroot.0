From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 11 Apr 2012 21:06:13 -0400
Subject: [Buildroot] [PATCH v2 2/2] BeagleBone: new board
In-Reply-To: <4F85B964.4020000@relinux.de>
References: <1331561609-26989-1-git-send-email-fhunleth@troodon-software.com>
 <4F803D6E.2020402@relinux.de>
 <CA+-urNS5R_3bUY_SjVFFE3nMfdDN60O_-jJALKzo3cpu2my0fw@mail.gmail.com>
 <4F84662D.8070906@relinux.de>
 <CA+-urNSUrDiZP60u60binQ8=HeWBuxHEjLs4DnOGGdf_akFeGg@mail.gmail.com>
 <4F85B964.4020000@relinux.de>
Message-ID: <CA+-urNQEutaN8fsU+oKido1tTHifAJdtTENQNUXJHeZdyzO1hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 11, 2012 at 1:03 PM, Stephan Hoffmann <sho@relinux.de> wrote:
> Am 10.04.2012 20:18, schrieb Frank Hunleth:
>> On Tue, Apr 10, 2012 at 12:56 PM, Stephan Hoffmann <sho@relinux.de> wrote:
>>> at least, I prefer having ext3;-) ?What would be a reason to stick to ext2?
>> I had thought that Buildroot did not support creating root filesystems
>> with ext3 or later. Do you run tunefs in a post-build script to add
>> the journal? Also, I thought that busybox didn't support creating and
>> checking ext3 or later?
> I'm not sure about that. I just made the root fs as tgz and unzipped it
> manually on the preformatted partition instead of dd'ing the image.

Got it. Getting back to your original email, there doesn't seem to be
any harm in having ext3 compiled in, so I'll change that.

>> I'm hoping that I'm wrong. I've been hearing about performance gains
>> with ext4 extents and would like to see if they help on my projects.
>> FWIW, I usually mount my rootfs read-only and have a writable data
>> partition that can be reformatted should it get corrupted too badly.
> That is, of course, a good idea. I think it's even better to run the
> whole system as an initrd (if there is enough ram, of course).

Yep. I used to use initrd, but then stopped due to the RAM issue and
finding out how much faster the system booted if I used read-only ext2
partitions instead. YMMV

> This works with buildroot for the BeagleBone, too, and gives the
> opportunity to have the whole system in one file.

I agree that is nice. I've done the reverse on other projects where I
had br copy the kernel to  /boot and configured u-boot to read it from
there. Of course, that's another thing that may keep me with ext2,
since u-boot doesn't support ext3 or later. :-)

Frank
