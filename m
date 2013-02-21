From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Feb 2013 00:24:11 +0100
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <5126A8C7.2000009@petroprogram.com>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com> <5125F50C.7020902@petroprogram.com>
 <20130221102315.GB12155@sapphire.tkos.co.il>
 <5125F7BB.50403@petroprogram.com> <5126A675.2060308@mind.be>
 <5126A8C7.2000009@petroprogram.com>
Message-ID: <5126AC9B.30302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/02/13 00:07, Stefan Fr?berg wrote:
> 22.2.2013 0:57, Arnout Vandecappelle kirjoitti:
>> On 21/02/13 11:32, Stefan Fr?berg wrote:
>>>>>>>>> Also kernel .config file should also have CONFIG_DEVTMPFS and
>>>>>> DEVTMPFS
>>>>>>>>> as 'y'.
>>>>>>> Sorry, that should have been CONFIG_DEVTMPFS=y and
>>>>> CONFIG_DEVTMPFS_MOUNT=y
>>>>> Kernel version 2.6.30 is too old for that.
>>>>>
>>>>> baruch
>>>>>
>>> It is ?
>>> Damn, then the only options are mdev and udev.
>>
>>   I'm afraid that mdev and udev no longer work with old kernels that
>> don't support the DEVTMPFS option...
>>
>>   mdev and udev don't create device nodes; they only do something
>> configurable when a hotplug event happens.
>>
>
> What you mean that mdev or udev does not create device nodes ???
> If older kernels don't support devtmpfs like Baruch
> said then who does that device node creation if not the mdev or udev
> when event happens ???

  Well, nobody...

  Turns out that mdev still does device node creation. Makes me wonder if 
I'm not mistaken about udev as well... I just remember hearing that 
device node creation was removed when DEVTMPFS was introduced.


>>   That said, you can create custom mdev/udev rules to create device
>> nodes. But it's all manual - and much simpler to just create the
>> device nodes manually.
>>
>
> for mdev it's just a single file, /etc/mdev.conf (I can even copy-paste
> it here, it's not that long and will cover 99% of needs).

  Yes, but that file just specifies the chmod/chown rules, not how to 
create the device nodes. But as I just saw in the code, mdev does in fact 
create the device nodes.


  Regards,
  Arnout

> for udev it punch of rules found under /lib/udev/rules.d and yes, it can
> get really tedious to play games with those files if some device node is
> not created or
> is not created with right permissions or whatever.

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
