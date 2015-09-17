From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Thu, 17 Sep 2015 19:22:24 +0100
Subject: [Buildroot] Rootfs etc/ help (target: arm64)
In-Reply-To: <CAMQcK5+_ffBd+6-ccaYjXJ_+TjjqcY4YeHfV5pMLRRpkCbnZeQ@mail.gmail.com>
References: <55FAFA24.90906@synopsys.com>
 <CAMQcK5+_ffBd+6-ccaYjXJ_+TjjqcY4YeHfV5pMLRRpkCbnZeQ@mail.gmail.com>
Message-ID: <55FB04E0.6030904@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is working!
Thanks Ryan! I was missing the getty configuration!

Joao

On 9/17/2015 7:13 PM, Ryan Barnett wrote:
> Joao,
> 
> On Thu, Sep 17, 2015 at 12:36 PM, Joao Pinto <Joao.Pinto@synopsys.com> wrote:
>>
>> HI,
>>
>> I am having a problem when generating a rootfs init process 100% from buildroot.
>> This is the log of the startup process (rootfs is on a USB pen drive):
>>
>>
>> Waiting for root device /dev/sda1...
>> scsi 0:0:0:0: Direct-Access     Kingston DataTraveler G3  PMAP PQ: 0 ANSI: 0 CCS
>> atkbd serio1: keyboard reset failed on 1c070000.kmi
>> sd 0:0:0:0: [sda] 30695424 512-byte logical blocks: (15.7 GB/14.6 GiB)
>> sd 0:0:0:0: [sda] Write Protect is off
>> sd 0:0:0:0: [sda] Mode Sense: 23 00 00 00
>> sd 0:0:0:0: [sda] No Caching mode page found
>> sd 0:0:0:0: [sda] Assuming drive cache: write through
>>  sda: sda1
>> sd 0:0:0:0: [sda] Attached SCSI removable disk
>> EXT3-fs (sda1): mounted filesystem with writeback data mode
>> VFS: Mounted root (ext3 filesystem) readonly on device 8:1.
>> kjournald starting.  Commit interval 5 seconds
>> devtmpfs: mounted
>> Freeing unused kernel memory: 464K (ffffffc000932000 - ffffffc0009a6000)
>> Freeing alternatives memory: 16K (ffffffc0009a6000 - ffffffc0009aa000)
>> INIT: version 2.88 booting
>> EXT3-fs (sda1): warning: maximal mount count reached, running e2fsck is recommended
>> EXT3-fs (sda1): using internal journal
>> Starting logging: OK
>> Starting irqbalance: OK
>> Initializing random number generator... random: dd urandom read with 60 bits of
>> entropy available
>> done.
>> Starting system message bus: done
>> Starting network...
>> INIT: Entering runlevel: 5
>> INIT: no more processes left in this runlevel
>> random: nonblocking pool is initialized
>>
>> The problem it remains stuck forever in "INIT: no more processes left in this
>> runlevel". I have a Linaro' rootfs example and it has rcX.d and all that stuff
>> but I want to make a functional rootfs 100% from buildroot.
>>
>> Can you give an hint?
> 
> What is your console that you are getting this printout from?
> 
> It appears that your getty session isn't launching on the correct tty
> device. Buildroot defaults to launching a getty session (your
> interactive console) on tty1. I assume this is a serial port?
> 
> The value you will need to update is BR2_TARGET_GENERIC_GETTY_PORT to
> be the same as the console of your kernel boot arguments (sometimes
> ttyS0).
> 
> Thanks,
> -Ryan
> 
