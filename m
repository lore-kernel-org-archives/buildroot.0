From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 8 Jun 2018 21:58:42 -0300 (BRT)
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer> <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
Message-ID: <1697965583.2026245.1528505922702.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Yann Morin" <yann.morin.1998@free.fr>, "DATACOM" <casantos@datacom.com.br>
> Cc: "Thomas De Schampheleire" <thomas.de_schampheleire@nokia.com>, "buildroot" <buildroot@buildroot.org>
> Sent: Thursday, June 7, 2018 6:03:48 PM
> Subject: Re: [Buildroot] [PATCH] fs: allow extra arguments to common tarball extraction

> On 06-06-18 20:51, Yann E. MORIN wrote:
>> But my position has always been consistent on this topic: the images
>> that Buildroot generates only ever covers just "basic" situations, using
>> a single-filesystem layout. Anything that needs to do a multi-filesystem
>> layout should be done as a new filesystem. Doing it in a new filesystem
>> is much more flexible than whatever kconfig option we may ever add. And
>> since we already have this wonderful flexibility, I don't think it makes
>> sense to add a new option that duplicates only a very limited subset of
>> that flexibility. That duplication is not good, IMNSHO...
> 
> There is (in my even less humble opinion) one way that we can solve this
> generically: by adding a genimage filesystem. genimage is able to create
> separate filesystem images for subtrees. so it can cover many use cases in a
> generic way.
> 
> There are probably a few gotchas, but I still believe it should be possible.

Genimage is unable to deal with GPT partitioning, which is much better
to use with UEFI BIOS. I dropped it in favour of a custom script that
creates an empty disk image file using sfdisk to partition it using a
file containing the partitioning scheme. Then it reads the start offset
an size of each partition and dumps the corresponding FS image there.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
