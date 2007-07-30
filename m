From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 22:02:47 +0200
Subject: [Buildroot] Redundant kernel patches in the
	snapshot	from20070718
In-Reply-To: <20070730192728.GA27993@aon.at>
References: <1185459798.1044.43.camel@localhost.localdomain>
	<1185468722.5580.107.camel@elrond.sweden.atmel.com>
	<20070727113002.GF22789@aon.at>
	<026b01c7d2c2$cbcd3460$dcc4af0a@atmel.com>
	<20070730192728.GA27993@aon.at>
Message-ID: <20070730200247.GC29064@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2007 at 09:27:28PM +0200, Bernhard Fischer wrote:
[I deliberately do not correct the gazillions of typos i made]

>>>>* Cannot apply architecture specific patches, since
>>>>  you may have conflicts between several patch-set's.
>>>>* Cluttered directory
>>> 
>>> hm? Please explain.
>>> 
>>
>>The AVR32 chips and the AT91 ARM chips uses the same peripherals,
>>and therefore can use the same drivers.
>
>fair enough.
>
>So there is _one_ patch which is submitted upstream that is
>linux-1.2.3.4-add-thisSpecificDevice.patch

... where this patch adds _just_ the device. Accompanying
infrastructure which may be used by a friend class of HW of course has
to be in a separate patch. This obviously prevents attempts to apply any
hunk twice, fwiw.
