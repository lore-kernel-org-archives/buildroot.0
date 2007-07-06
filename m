From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 6 Jul 2007 17:36:58 +0200
Subject: [Buildroot] What is the proper procedure to commit a patch?
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706152642.GA13765@aon.at>
Message-ID: <012f01c7bfe3$f55fb4c0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>The patches I'd like to add are mainly:
>>* BSP patch ,discussed and approved by Eric.
>>* moving package/customize to topdir and rename "local", also discussed before
>>* Support for AT91 boot monitors 
>>        Dataflashboot
>>        AT91-Bootstrap
>>        U-boot
>>        Generate U-Boot initialization scripts
>>* Add AVR32 support.
>>* A few extra packages.
>>* Update mtdutils (which is really old)
>>* Clean up the linux support (move into a separate dir in package)
> 
> I object to this. Can we please have _one_ linux.mk
> If we cannot have it, then please explain to me why you think we should
> duplicate this all over the place.
> (see buildroot/target/device/mips/* for an example on how you can use
> The One linux.mk).
> A sane thing to do is to
> $ svn rm $(find ./ -name linux.mk)
> and _not_ to add to the lot of cruft. As said, please elaborate.
> 

I think you misunderstood.
Now we have package/linux.mk and we have Linux configuration spread out.

What I want to do is to move "package/linux.mk" to "package/linux/linux.mk"
and then remove the distributed linux configuration to "package/linux/Config.in"

Best Regards
Ulf Samuelsson
