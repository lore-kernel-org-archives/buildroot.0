From: Stuart Wood <stuart.wood@labxtechnologies.com>
Date: Tue, 5 Jun 2007 10:56:21 -0400
Subject: [Buildroot] STILL soft float toolchain problems on ARM
In-Reply-To: <20070605082606.GC30837@aon.at>
Message-ID: <000001c7a781$ae01ecd0$0801fea9@SDW>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paolo, 

I've found that when changing some of the build options you need to make
sure you do a make clean and then remove the build_arm_nofpu and
toolchain_build_arm_nofpu directories because they are not always purged
properly.

Don't get discouraged, I'm also working on the EP9302 and am not utilizing
the FPU.
Here is my config.

Stuart



-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of Bernhard Fischer
Sent: Tuesday, June 05, 2007 4:26 AM
To: Paolo Scaffardi
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] STILL soft float toolchain problems on ARM


On Tue, Jun 05, 2007 at 10:18:00AM +0200, Paolo Scaffardi wrote:
>Bernhard Fischer ha scritto:
>> On Tue, Jun 05, 2007 at 08:42:17AM +0200, Paolo Scaffardi wrote:
>>> Hi there!
>>> I'm still trying to get a working buildroot for my ARM platform 
>>> (EP9302 cirrus logic CPU, T920), with soft float enabled. My 
>>> configuration uses GCC 4.1.2, libfloat, soft float and uclibc 0.9.29 
>>> (i tried both snapshots and 0.9.29 official release).
>> 
>> I flagged several such reports with FLOAT in the subject. Can you 
>> provide me with a kernel-config that i can use with qemu that does:
>> 1) use xscale (but t920 t926 should do too, if you prefer)
>> 2) have framebuffer support
>> 3) is noMMU
>> 4) wants soft-float
>
>I cannot provide such kernel config because i dont use XScale, but 
>cirrus ep93xx. I dont understand why are you using QEMU to test 
>these...

I'm using qemu because i don't have such hardware, that simple ;)

If i don't have a kernel that i can use for testing, i'm not interrested,
thanks.

>I'm simply trying to compile last buildroot snapshot WITHOUT changing 
>any kernel configuration.

good luck
_______________________________________________
buildroot mailing list
buildroot at uclibc.org http://busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: EP9302.config
Type: application/octet-stream
Size: 13212 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070605/6924e314/attachment.obj 
