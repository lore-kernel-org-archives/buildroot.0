From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Oct 2015 22:29:46 +0100
Subject: [Buildroot] [PATCH v5] board: add support for ARM Juno r1
 Development Board
In-Reply-To: <5629F99E.2040105@synopsys.com>
References: <b132a8d9bc9e51f56f7b4a5c0e4c02404aaabd8a.1444647414.git.jpinto@synopsys.com>
 <5629451D.8060502@mind.be> <5629F99E.2040105@synopsys.com>
Message-ID: <56313E4A.10709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23-10-15 11:10, Joao Pinto wrote:
> 
> Hi,
> 
> On 10/22/2015 9:20 PM, Arnout Vandecappelle wrote:
>> On 22-10-15 18:17, Joao Pinto wrote:
[snip]
>>> +BR2_LINUX_KERNEL=y
>>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.linaro.org/landing-teams/working/arm/kernel.git"
>>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="6917b51dee54f21816706af2278517b7af218f9a"
>>
>>  This is just v4.3-rc1, so you could use an upstream kernel instead of Linaro.
>> Are you sure you took the right sha?
> 
> The Juno board was recently added to linux mainline (v4.2 I think) but the total
> support is still in Linaro. Take as an example the video output support, sound
> and pcie. The git commid id I configured is one of the latest, assuring that we
> have the maximum of stable functionalities as possible. The stable tags lack
> crucial features.

 The commit Id you selected _is_ v4.3-rc1, or actually, the commit just before
v4.3-rc1:

$ git describe --contains 6917b51dee54f21816706af2278517b7af218f9a
v4.3-rc1~1

$ git log -1 --pretty=format:'%H%n%s' v4.3-rc1^
6917b51dee54f21816706af2278517b7af218f9a
Merge tag 'cris-for-4.3' of
git://git.kernel.org/pub/scm/linux/kernel/git/jesper/cris


 So I think you picked the wrong commit sha.

> 
>>
>>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/junor1/linux-junor1-defconfig"
>>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>>> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
>>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno-r1"
>>
>>  No need for a bootloader?
> 
> The board uses EDK2, which comes already built with the board.
> If a developer needs to build a custom package it should get teh edk2 package a
> built it.

 It would be nice if you could add it, but that's not a prerequisite for getting
this defconfig in. Note that edk2 should go under boot/, not package/

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
