From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 01 Apr 2018 01:29:01 -0300
Subject: [Buildroot] [PATCH 15/36] check-package: enable for toolchain/
References: <33c4f662-3550-4150-f7aa-58f1cbe38b49@mind.be>
Message-ID: <5ac0600dd50e6_7cbc3fbe8f4be0c825e6@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Mar 31, 2018 at 05:48 AM, Arnout Vandecappelle wrote:

> On 31-03-18 08:38, Thomas Petazzoni wrote:
>> On Fri, 30 Mar 2018 23:22:40 -0300, Ricardo Martincoski wrote:
>>> +CONFIG_IN_FILENAME = re.compile("/Config\.\S*$|/toolchain-common.in$")
>> 
>> Not directly related to your series, but I believe this
>> toolchain-common.in file is silly. It is just included by
>> toolchain/Config.in, and toolchain/Config.in is not that long. We
>> should bring back the toolchain-common.in contents in
>> toolchain/Config.in, and stop having this odd toolchain-common.in.
> 
>  +1 to that! And if you encounter other oddities like that, feel free to fix

ACK

> them as well. package/Makefile.in is also one that is odd IMO.

I agree.
This is the last Makefile.in remaining from the commit 14 years ago.
I can do this (if anyone don't do it first).
The hard part is to find the best name.

1) package/common.mk
 - used for boot and fs, include all .mk in the subdirs

2) package/package.mk
 - used for linux, system and toolchain

3) package/pkg-common.mk

I prefer the last one because:
 - it defines common stuff;
 - it includes package/pkg-*.mk, and the Makefile in basedir includes
   package/*/*.mk, so I don't think it is too similar to boot and fs;
 - it seems more related to package infras then to packages.


Regards,
Ricardo
