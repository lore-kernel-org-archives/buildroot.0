From: Matt Flax <flatmax@flatmax.org>
Date: Fri, 7 Apr 2017 09:18:45 +1000
Subject: [Buildroot] [aarch64] can't handle reloc type error
In-Reply-To: <20170406121119.7750e4d7@free-electrons.com>
References: <ceee635f-4c82-2e20-9c23-15b163bc5331@flatmax.org>
 <20170406121119.7750e4d7@free-electrons.com>
Message-ID: <10752b04-514d-4012-9112-2c46c636d176@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 06/04/17 20:11, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 6 Apr 2017 18:12:39 +1000, Matt Flax wrote:
>
>> I am building buildroot for aarch64. I am using the s5p6818 system.
>> The system builds and boots well.
>>
>> The problem I am having is that any packages which are in my external
>> directory $BR2_EXTERNAL_CUSTOM_PATH doesn't produce executable executables.
>>
>> If I try to run something which was sourced from the buildroot package
>> directory, it works well.
>>
>> If I try to run an executable from my custom external package path, it
>> doesn't. I get the following error :
>>
>> /usr/bin/testit symbol '_ZSt15__once_callable': can't handle reloc type
>> 0x407
>>
>> Anyone got any ideas on what to do ?
> Could you share an example piece of code + package .mk file that
> exhibits the problem ?
Please find the example piece of code and mk file attached.

> Also, could you pastebin the build log of the package that produces a
> non-working binary ?
>
>
Please find the paste of the audioMasker executable build log here :
https://pastebin.com/nm7gZ2gx

Please find the paste bin of the gtkiostream package build log here...
https://pastebin.com/LnEh6PPp

thanks
Matt
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gtkiostream.mk
Type: text/x-makefile
Size: 629 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170407/b8636837/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: audioMasker.C
Type: text/x-c++src
Size: 6699 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170407/b8636837/attachment.c>
