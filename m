From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Feb 2013 19:05:46 +0100
Subject: [Buildroot] need smaller filesystem for NOR
In-Reply-To: <20130212225043.4ecc0f25@skate> (Thomas Petazzoni's message of
 "Tue, 12 Feb 2013 22:50:43 +0100")
References: <1360344317.17385.31.camel@genx.eng.msli.com>
 <20130208183807.2b2fe572@skate>
 <1360359245.28641.79.camel@genx.eng.msli.com>
 <1360628370.13529.110.camel@genx> <511A7C8E.9010407@mind.be>
 <20130212225043.4ecc0f25@skate>
Message-ID: <877gm8qglh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > Next I tried to edit my jffs options in the .config for my recovery
 >> > 'failsafe' buildroot:
 >> > Filesystem images  --->
 >> >   [*] jffs2 root filesystem
 >> >   Flash Type (Select custom page and erase size)  --->
 >> >   (0x1065) Page Size
 >> >   (0xC60) Erase block size
 >> 
 >> Those numbers are unlikely. 0x1065 is a very odd number (literally). 
 >> Also, the erase block size is always larger than the page size, and for 
 >> NOR I think it's normally equal to it.

 Thomas> I remember dataflash having bizarre erase block sizes, but I don't
 Thomas> think it was an odd number.

No, it's afaik 256bytes + 8 extra, or multiples of this. Judging from
the above, I guess John wanted 1056 (0x420) page size.

-- 
Bye, Peter Korsgaard
