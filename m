From: Jeremy Kerr <jk@ozlabs.org>
Date: Mon, 20 Oct 2014 11:27:39 +0800
Subject: [Buildroot] [PATCH 7/7 v3] Add powerpc64 petitboot defconfig
In-Reply-To: <543A97EC.3020108@mind.be>
References: <1402982507.186219.497008212672.7.gpush@pablo>
 <543A97EC.3020108@mind.be>
Message-ID: <5444812B.7080101@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>  It would be nice if you could also create one for a qemu target, so people can
> actually experiment with it.

This build should work fine for qemu, is there something else I should
be doing here?

>> --- /dev/null
>> +++ b/configs/powerpc64_petitboot_defconfig
>> @@ -0,0 +1,17 @@
>> +BR2_powerpc64=y
>> +BR2_GENERATE_LOCALE="en_US.UTF-8"
>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>> +BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>> +BR2_PACKAGE_LINUX_FIRMWARE=y
>> +BR2_PACKAGE_LINUX_FIRMWARE_BNX2X=y
>> +BR2_PACKAGE_LINUX_FIRMWARE_CXGB4=y
>> +BR2_PACKAGE_NCURSES_WCHAR=y
> 
>  Is this needed?

Yes, we need this to display boot labels that contain non-ASCII
characters. Fedora uses "Schr?dinger?s cat", for example...

>> +BR2_PACKAGE_DROPBEAR=y
> 
>  Is this useful?
> 
>> +# BR2_PACKAGE_DROPBEAR_SERVER is not set
>> +BR2_PACKAGE_ETHTOOL=y
> 
>  Is this useful?
> 
>> +BR2_PACKAGE_NETCAT=y
> 
>  Is this useful?
> 
>> +BR2_PACKAGE_RSYNC=y
> 
>  Is this useful?

We've found that these four utilities have been very useful in debugging
boot issues; dropbear, netcat and rsync for remote access / file
transfer, and ethtool for network-device firmware management.

However, if we want to keep the defconfig as minimal as possible (rather
than the configuration that I've assumed users will generally need), we
can remove these.

Regards,


Jeremy
