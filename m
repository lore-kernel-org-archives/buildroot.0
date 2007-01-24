From: Ulf Samuelsson <ulfs@dof.se>
Date: Thu, 25 Jan 2007 00:51:12 +0100
Subject: [Buildroot] [PATCH] Select MTD before EXT2/CRAMFS/SQUASHFS
	arebuilt
References: <1169591688.5361.7.camel@elrond.sweden.atmel.com><20070124000746.GA17761@codepoet.org><053601c73f56$016879f0$01c4af0a@atmel.com>
	<20070124225753.GD28221@aon.at>
Message-ID: <02a001c74013$6ad21e60$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> Nak.  There are a great many situations where people use ext2
>>> and/or cramfs and/or squashfs without wanting to also use MTD...
>>> I happen to use all of them without wanting MTD at various times.
>>>
>>> -Erik
>>
>> Hmm,
>>
>> The intention is, that if ext2/squashfs/cramfs etc is selected,
>> you ensure you build the  MTD utilities for the *host*.
>
> What specific failure do you see?
>

There are no mkfs.jffs2 application on the host, so it fails.


>
> Since you seem to use cramfs, may i ask you to look if these patches
> are ok? http://busybox.net/bugs/view.php?id=512
> http://busybox.net/bugs/view.php?id=1027
>>

I only use ext2 and jffs2 but this seemed to be a generic problem.

>> $ mkfs.ext2 etc.
>>
>> Not that you put the MTD utilities into the root file system.
>> How do I do what I intended then?
>> (I hope building the host tools is not inconvenient).
>
> I do not want to download nor build a package that i do not need..

How can you create an ext2/cramfs/squashfs if you have no
application on your host that takes a directory and generates the fs????



Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
