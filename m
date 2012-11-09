From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 Nov 2012 02:51:36 +0100
Subject: [Buildroot] [PATCH 1/6] Add config file for the snowball board
In-Reply-To: <509B6D2A.90408@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-2-git-send-email-gregory.hermant@calao-systems.com>
 <50905017.8080301@mind.be> <509B6D2A.90408@calao-systems.com>
Message-ID: <509C61A8.8040901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/12 09:28, Gr?gory Hermant wrote:
> Le 30/10/2012 23:09, Arnout Vandecappelle a ?crit :
>> On 10/29/12 09:41, Gregory Hermant wrote:
[snip]
>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA2"
>>> +BR2_PACKAGE_BUSYBOX_CONFIG="board/calao/snowball/busybox-1.20.x.config"
>>
>>   This file should be created in the same patch, otherwise this defconfig
>> isn't working.
>>
>>   Also, is it really necessary to have a custom busybox config?
>>
> I need to enable the mdev loading firmware support.
> I will change the snowball defconfig file in order to use mdev.

  Yes, if you select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV then mdev
will automatically be selected in busybox.

[snip]
>>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>
>>   Why?
>>
> To load the kernel from the rootfs partition hence the boot partition
> could be removed.

  Yes, that was actually obvious, I was stupid to ask it.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
