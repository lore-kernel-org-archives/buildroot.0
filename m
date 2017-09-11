From: John Stile <john@stilen.com>
Date: Mon, 11 Sep 2017 15:52:58 -0700
Subject: [Buildroot] Problem trying to use an external tool chain
In-Reply-To: <919f901a-5738-46b8-a2d3-eb2acf86d29d@mind.be>
References: <1505149717462.81961@BlackBox.com>
 <919f901a-5738-46b8-a2d3-eb2acf86d29d@mind.be>
Message-ID: <fe0d8c22-1139-56fb-0601-db6309106eda@stilen.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the settlement I will have to give rxy part of my ira, 401k, and
ameritrade (straight stock) accounts.

I am trying to figure out how to do it tax free, and how much that would
cost.


On 09/11/2017 03:49 PM, Arnout Vandecappelle wrote:
>  Hi John,
>
> On 11-09-17 19:08, John O'Sullivan wrote:
>> Hi,
>>
>> I am trying to setup buildroot to use an external project from Xilinx
>>
>> It has the followiing structure
>>
>> aarch64-linux-gnu  bin  include  lib  lib64  libexec  share
>>
>>
>>
>>>>> toolchain-external-custom  Installing to staging directory
>> /usr/bin/install -D -m 0755
>> /home/developer/BuildRoot/buildroot-2017.02.4/output/build/toolchain-external-custom/toolchain-wrapper
>> /home/developer/BuildRoot/buildroot-2017.02.4/output/host/usr/bin/toolchain-wrapper
>> ln: failed to create symbolic link
>> '/home/developer/BuildRoot/buildroot-2017.02.4/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib':
>> No such file or directory
>  That directory should have been created as part of
> SKELETON_INSTALL_STAGING_CMDS in the skeleton package.
>
>  Is it possible that you changed the arch/toolchain configuration without 'make
> clean'? Check /home/developer/BuildRoot/buildroot-2017.02.4/output/staging, it
> should point to host/usr/aarch64-buildroot-linux-gnu/sysroot.
>
>
>  Regards,
>  Arnout
>
>>
>> Anyone have any idea on what its failing on, what lis it trying to link 
>>
>> '/home/developer/BuildRoot/buildroot-2017.02.4/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib
>> to
>>
>> Is it something to do with the fact that it is 64 bit
>>
>>
>> Regards
>>
>> John
>>
>> I
>>
>>
>> --------------------------------------------------------------------------------
>>
>> This email and any files transmitted with it are confidential and are intended
>> for the sole use of the individual to whom they are addressed. Black Box
>> Corporation reserves the right to scan all e-mail traffic for restricted content
>> and to monitor all e-mail in general. If you are not the intended recipient or
>> you have received this email in error, any use, dissemination or forwarding of
>> this email is strictly prohibited. If you have received this email in error,
>> please notify the sender by replying to this email.
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
