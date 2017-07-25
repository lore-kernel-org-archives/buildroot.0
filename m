From: vr roriz <v.r.roriz@gmail.com>
Date: Tue, 25 Jul 2017 17:03:03 +0200
Subject: [Buildroot] [.config file] Generating buildroot-like .config
 file from "linux-like" .config file
In-Reply-To: <CAB_D2UzwSwa6SXs9fW1Eg-A+EziOEg58Daa=PXjtK2ZWs1q4Sw@mail.gmail.com>
References: <CAB_D2Uz6n6zdA2C3_Pbx6uV39_Zs=J=VfLOzs0Mtfi-agUocKQ@mail.gmail.com>
 <20170725141319.lrbqod4juauli3dd@latitude>
 <CAB_D2UzwSwa6SXs9fW1Eg-A+EziOEg58Daa=PXjtK2ZWs1q4Sw@mail.gmail.com>
Message-ID: <CAB_D2UwsHdCsfcOm2BZXrzW6AB12n+tqWkVj3KubbSpSnXPZvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I found a possible path for this procedure. On menuconfig, under Kernel
config, I can define a custom config file (for the Kernel). Then I can save
this "mirroring" with a savedefconfig. I will test.

Source:
https://stackoverflow.com/questions/1414968/how-do-i-configure-the-linux-kernel-within-buildroot

Is that the way people usually do that?

BR,

Vitor Roriz

2017-07-25 16:30 GMT+02:00 vr roriz <v.r.roriz@gmail.com>:

> Thanks for answering Mr. Neusch?fer,
>
> I've got your point. Then, I would add to my original issue: Would you
> have a suggestion about the best approach to mirror an existent .config
> file (from Linux source tree), without having to keep scanning strings in
> "make linux-menuconfig" and editing it manually? How do buildroot users
> usually do that? I know I can redefine the defconfig file for the target
> board after creating a .config file, but I am referring to the first-time
> process.
>
> BR,
> Vitor Roriz
>
> 2017-07-25 16:13 GMT+02:00 Jonathan Neusch?fer <j.neuschaefer@gmx.net>:
>
>> On Tue, Jul 25, 2017 at 11:28:08AM +0200, vr roriz wrote:
>> > Dear all,
>> >
>> > I'd like to know what is the best approach to generate a buildroot-like
>> > .config file (Using BR2) from an existent linux-like .config file. By
>> > linux-like I mean, the .config files with the native syntax, generated
>> by
>> > make menuconfig in the Linux Source Tree, like the ones that are
>> generated
>> > in the output dir of buildroot after building.
>>
>> Buildroot .config files and Linux .config files are not compatible
>> because they refer to completely different settings, but if you want to
>> convert the *syntax*, a simple sed command should do (in both directions):
>>
>>   $ sed -e 's/CONFIG_/BR2_/' .config
>>   #
>>   # Automatically generated file; DO NOT EDIT.
>>   # Linux/powerpc 4.11.8 Kernel Configuration
>>   #
>>   # BR2_PPC64 is not set
>>
>>   #
>>   # Processor support
>>   #
>>   BR2_PPC_BOOK3S_32=y
>>   # BR2_PPC_85xx is not set
>>   # BR2_PPC_8xx is not set
>>   # BR2_40x is not set
>>   # BR2_44x is not set
>>   # BR2_E200 is not set
>>   ...
>>
>>
>> I hope that helps,
>> Jonathan Neusch?fer
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170725/25adec72/attachment.html>
