From: Benjamin Tietz <benjamin@micronet24.de>
Date: Mon, 6 Aug 2007 22:12:56 +0200
Subject: [Buildroot] [Patch] internal toolchain for avr32
In-Reply-To: <20070806083229.GB4699@firebird.dresden.micronet24.de>
References: <20070806083229.GB4699@firebird.dresden.micronet24.de>
Message-ID: <20070806201256.GA7043@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since my revision wasn't the latest, I didn't got the nice mud ulf
created with his vendor-supplied toolchain. I'm sorry.

attached a patch that revert that misconfiguration.

@Ulf: Not everybody is happy about a vendor-supplied toolchain! So at
least give everybody the chance to decide whether to use it or not.
It would help even more, if Atmel would give external developers access
to their patches; those from avr32linux.org becoming older more and more
whilest pointing to download everything in ONE packet from Atmel. Thats
a really big download...
And another thing to add: get your vendor-specific stuff out of the
general Makefiles and Config.ins (it even would be nice if you could use
the default names; it would make searching through them much easier).
There are ways to do that. the vendor can redifine nearly all vars in
their own Makefiles; including default download-locations. And adding
additional patches isn't that difficult too. See the Makefile.in in
target/device/Atmel/avr32patches in my patch.

best regards
Benjamin

On Mon, Aug 06, 2007 at 10:32:29AM +0200, Benjamin Tietz wrote:
> Hi,
> 
> I added some patches and support for the avr32-architecture using the
> internal toolchain.
> Support for Linux 2.6.20, gcc 4.1.2 and uclibc 0.9.29.
> I hope i didn't missed a thing in the patch.
> 
> It (~600kB) can be found under
> http://www.micronet24.de/pub/avr32-internal-toolchain.patch.bz2
> 
> regards
> Benjamin
> 
> PS: I don't like the idea of prepatched sources, since I'm compiling for
> multiple architectures this would really increase the amount of data to
> download
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: revert_vendor-config.patch
Type: text/x-diff
Size: 5051 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070806/c6e9296d/attachment.bin 
