From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Feb 2013 23:57:57 +0100
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <5125F7BB.50403@petroprogram.com>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com> <5125F50C.7020902@petroprogram.com>
 <20130221102315.GB12155@sapphire.tkos.co.il>
 <5125F7BB.50403@petroprogram.com>
Message-ID: <5126A675.2060308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/02/13 11:32, Stefan Fr?berg wrote:
>>>> >>>Also kernel .config file should also have CONFIG_DEVTMPFS and DEVTMPFS
>>>> >>>as 'y'.
>>> >>Sorry, that should have been CONFIG_DEVTMPFS=y and CONFIG_DEVTMPFS_MOUNT=y
>> >Kernel version 2.6.30 is too old for that.
>> >
>> >baruch
>> >
> It is ?
> Damn, then the only options are mdev and udev.

  I'm afraid that mdev and udev no longer work with old kernels that 
don't support the DEVTMPFS option...

  mdev and udev don't create device nodes; they only do something 
configurable when a hotplug event happens.

  That said, you can create custom mdev/udev rules to create device 
nodes. But it's all manual - and much simpler to just create the device 
nodes manually.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
