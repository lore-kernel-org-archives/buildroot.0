From: Ulf Samuelsson <ulfs@dof.se>
Date: Wed, 24 Jan 2007 02:18:07 +0100
Subject: [Buildroot] [PATCH] Select MTD before EXT2/CRAMFS/SQUASHFS are
	built
References: <1169591688.5361.7.camel@elrond.sweden.atmel.com>
	<20070124000746.GA17761@codepoet.org>
Message-ID: <053601c73f56$016879f0$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erik Andersen wrote:
> On Tue Jan 23, 2007 at 11:34:48PM +0100, Ulf Samuelsson wrote:
>> Building a file sysrtem will fail if the mtd tools are not
>> available. THis patch ensure MTD is selected if either of
>> ext2/cramfs/squashfs are selected.
>
> Nak.  There are a great many situations where people use ext2
> and/or cramfs and/or squashfs without wanting to also use MTD...
> I happen to use all of them without wanting MTD at various times.
>
> -Erik

Hmm,

The intention is, that if ext2/squashfs/cramfs etc is selected,
you ensure you build the  MTD utilities for the *host*.

$ mkfs.ext2 etc.

Not that you put the MTD utilities into the root file system.
How do I do what I intended then?
(I hope building the host tools is not inconvenient).


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
