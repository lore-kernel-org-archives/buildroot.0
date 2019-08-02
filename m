From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 12:17:20 +0200
Subject: [Buildroot] [PATCH] support/testing: use virtio-rng-pci to test
 syslog-ng
In-Reply-To: <20190801205435.226c1187@windsurf.home>
References: <20190730231321.10673-1-ricardo.martincoski@gmail.com>
 <87o918u47q.fsf@dell.be.48ers.dk> <20190801205435.226c1187@windsurf.home>
Message-ID: <01df19c6-e217-c0cc-f95a-17052a5986f7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/08/2019 20:54, Thomas Petazzoni wrote:
> On Thu, 01 Aug 2019 20:32:09 +0200
> Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:  
>>
>>  > Recent versions of syslog-ng need some entropy on startup.
>>  > So use VirtIORNG to provide it. In order to accomplish this:
>>  >  - build the kernel containing the driver;
>>  >  - pass '-device virtio-rng-pci' to qemu.  
>>
>>  > Use the same kernel version and kernel config as qemu_arm_versatile.
>>  > It already has PCI enabled but it does not have HW_RANDOM_VIRTIO, so add
>>  > a defconfig fragment to enable the drivers.  
>>
>>  > Fixes:
>>  > https://gitlab.com/buildroot.org/buildroot/-/jobs/259856394  
>>
>>  > At the same time, fix a typo (missing '#') that resulted in the
>>  > generation of root.tar. This file is not used in the test.  
>>
>>  > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>>  > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>  > ---
>>  > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/262628554  
>>
>> Committed, thanks.
> 
> Longer term, probably we should rebuild newer versions of the pre-built
> kernels, with the appropriate config options enabled. I guess other
> use-cases will also need some entropy at boot time.

 Make that short-term, because Romain just reported such an issue [1].

 Regards,
 Arnout

[1] http://lists.busybox.net/pipermail/buildroot/2019-August/255550.html
