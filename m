From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Thu, 17 Jul 2014 23:13:24 +0200
Subject: [Buildroot] git binary diffs are not supported
In-Reply-To: <20140716152504.4bd10dbb@free-electrons.com>
References: <53C665B1.6050609@posteo.de>
 <20140716152504.4bd10dbb@free-electrons.com>
Message-ID: <53C83C74.5040708@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 07/16/2014 03:25 PM, Thomas Petazzoni wrote:
> Dear J?rg Krause,
>
> On Wed, 16 Jul 2014 13:44:49 +0200, J?rg Krause wrote:
>
>> I am trying to apply a git binary patch to add a firmware binary blob to
>> the linux kernel firmware directory. I am using git format-patch
>> --binary -M -n -s to create the patch and copy it to the global patch
>> directory. Trying to build linux fails while patching with the following
>> error message:
>>
>>      git binary diffs are not supported.
>>
>> Do I missed something? I would be glad for any advice!
> We don't use git to apply patches when building packages in Buildroot,
> we use the plain old patch, which indeed doesn't support binary diffs.
> Not sure how to solve this situation. Does your firmware really needs
> to be part of the kernel build process? Can't it be loaded from the
> filesystem at boot time, as is done for all the firmwares in the
> linux-firmware package? If that was possible, then you would simply
> have to create a simple Buildroot package that installs your firmware
> into /lib/firmware/.
>
> Best regards,
>
> Thomas

Dear Thomas,

I have a board with NAND flash which locates the root filesystem as 
UBIFS. I tried to load the device driver of the wifi device as a module 
at boot time. The driver tries to read the firmware binary from rootfs, 
but unfortunately the builtin UBIFS driver is loaded after this.

I must confess I am not a linux expert, so I just built the binary blob 
into the kernel.

What I am doing now is to set the path for the binary files for building 
in the kernel to a directory outside of the linux source tree.

Maybe you have a better idea?

Best regards
J?rg
