From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 27 Aug 2007 23:40:15 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel:atngw100/target_skeleton
	atngw100/target etc...
References: <20070821013441.98D34A610B@busybox.net>
	<1188218331.7840.26.camel@localhost.localdomain>
	<20070827211509.GX11697@aon.at>
Message-ID: <062601c7e8f4$79705e20$e603420a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> 
>>> Log:
>>> additional skeleton for AVR32
>>> 
>>> Added:
>>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/bin/
>>
>>What is up with all the directories? Is not defining them
>>in .../<board>/device_table.txt enough? I find it far better defining
>>them there since the access permissions can be defined as well.
> 
> Ulf, all your crap added a compressed (!) 2MB during the last month.
> 

I am conscious about this issue.
I got a lot of FLAK because I refused to add patches for the AVR32 toolchain
and instead introduced the possibility to download a prepatched toolset.
If this is not done, then an additional 8 MB (after decompression) would have been added.

Did not check, but I belive that a significant portion of those 2 MB,
 are the Linux patches for AT91 and AVR32.
Once the target/linux/Makefile.in supports downloading these patches,
then they can go away.

I have also noticed that OpenSWAN adds a lot to the download size of Buildroot.
There is a large patch which is inside the buildroot source, and this patch 
is available in several versions.
The patch is downloadable from internet, so there is no need to 

> It would be way better to clean-up that mess and _not_ duplicate it over
> all of target/device/Atmel. Furthermore, it's absolutely ugly to force
> all such helper-files upon your users, because they will not build the
> majority of those packages anyway.
> 

Almost all the stuff are only empty directories, not adding significant size.


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
