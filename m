From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 12:12:17 +0200
Subject: [Buildroot] What is the proper procedure to commit a patch?
In-Reply-To: <012f01c7bfe3$f55fb4c0$dcc4af0a@atmel.com>
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706152642.GA13765@aon.at>
	<012f01c7bfe3$f55fb4c0$dcc4af0a@atmel.com>
Message-ID: <20070707101217.GO4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 06, 2007 at 05:36:58PM +0200, Ulf Samuelsson wrote:
>
>>>The patches I'd like to add are mainly:
>>>* BSP patch ,discussed and approved by Eric.
>>>* moving package/customize to topdir and rename "local", also discussed before
>>>* Support for AT91 boot monitors 
>>>        Dataflashboot
>>>        AT91-Bootstrap
>>>        U-boot
>>>        Generate U-Boot initialization scripts
>>>* Add AVR32 support.
>>>* A few extra packages.
>>>* Update mtdutils (which is really old)
>>>* Clean up the linux support (move into a separate dir in package)
>> 
>> I object to this. Can we please have _one_ linux.mk
>> If we cannot have it, then please explain to me why you think we should
>> duplicate this all over the place.
>> (see buildroot/target/device/mips/* for an example on how you can use
>> The One linux.mk).
>> A sane thing to do is to
>> $ svn rm $(find ./ -name linux.mk)
>> and _not_ to add to the lot of cruft. As said, please elaborate.
>> 
>
>I think you misunderstood.
>Now we have package/linux.mk and we have Linux configuration spread out.
>
>What I want to do is to move "package/linux.mk" to "package/linux/linux.mk"

What's that good for? Just curious, this is just cosmetics.

>and then remove the distributed linux configuration to "package/linux/Config.in"

Which "distributed linux configuration" do you mean?
