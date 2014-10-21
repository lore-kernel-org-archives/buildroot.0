From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Oct 2014 23:31:41 +0200
Subject: [Buildroot] [PATCH 7/7 v3] Add powerpc64 petitboot defconfig
In-Reply-To: <5444812B.7080101@ozlabs.org>
References: <1402982507.186219.497008212672.7.gpush@pablo>
 <543A97EC.3020108@mind.be> <5444812B.7080101@ozlabs.org>
Message-ID: <5446D0BD.3020206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/10/14 05:27, Jeremy Kerr wrote:
> Hi Arnout,
> 
>>  It would be nice if you could also create one for a qemu target, so people can
>> actually experiment with it.
> 
> This build should work fine for qemu, is there something else I should
> be doing here?

 Because of the firmware lines, I thought that it was for some specific hardware.

 It would be better to take qemu_ppc64_pseries_defconfig and add the
petitboot-specific things. I'd also name it
qemu_ppc64_pseries_petitboot_defconfig to make this explicit. Or alternatively,
petitboot_qemu_ppc64_pseries_defconfig.

> 
>>> --- /dev/null
>>> +++ b/configs/powerpc64_petitboot_defconfig
>>> @@ -0,0 +1,17 @@
>>> +BR2_powerpc64=y
>>> +BR2_GENERATE_LOCALE="en_US.UTF-8"
>>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>>> +BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
>>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>>> +BR2_PACKAGE_LINUX_FIRMWARE=y
>>> +BR2_PACKAGE_LINUX_FIRMWARE_BNX2X=y
>>> +BR2_PACKAGE_LINUX_FIRMWARE_CXGB4=y
>>> +BR2_PACKAGE_NCURSES_WCHAR=y
>>
>>  Is this needed?
> 
> Yes, we need this to display boot labels that contain non-ASCII
> characters. Fedora uses "Schr?dinger?s cat", for example...

 Doesn't sound really essential, but probably OK.

> 
>>> +BR2_PACKAGE_DROPBEAR=y
>>
>>  Is this useful?
>>
>>> +# BR2_PACKAGE_DROPBEAR_SERVER is not set
>>> +BR2_PACKAGE_ETHTOOL=y
>>
>>  Is this useful?
>>
>>> +BR2_PACKAGE_NETCAT=y
>>
>>  Is this useful?
>>
>>> +BR2_PACKAGE_RSYNC=y
>>
>>  Is this useful?
> 
> We've found that these four utilities have been very useful in debugging
> boot issues; dropbear, netcat and rsync for remote access / file
> transfer, and ethtool for network-device firmware management.
> 
> However, if we want to keep the defconfig as minimal as possible (rather
> than the configuration that I've assumed users will generally need), we
> can remove these.

 Yes, we try to have minimal defconfigs.


 It would also be nice to create board/qemu/ppc64-pseries/readme-petitboot.txt
that explains how you can run this defconfig.

 I guess petitboot takes some kind of configuration file that specifies what
you're going to boot into. It would be nice to have in the readme an example of
how you can boot into another buildroot image (e.g. qemu_ppc64_pseries_defconfig).



 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
