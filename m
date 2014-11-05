From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Nov 2014 08:31:24 +0100
Subject: [Buildroot] [PATCH] wireshark: remove RPATH tag
In-Reply-To: <20141105072214.GL2358@sapphire.tkos.co.il>
References: <0dae86e37516236d337e8433c63047504f1576f9.1415126141.git.baruch@tkos.co.il>
 <20141105081555.5aca83e2@free-electrons.com>
 <20141105072214.GL2358@sapphire.tkos.co.il>
Message-ID: <20141105083124.57a5d559@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 5 Nov 2014 09:22:14 +0200, Baruch Siach wrote:

> > Isn't this problem potentially identical in many packages that use
> > libtool? What leads the wireshark libtool to have this specifically?
> 
> Probably. The Buildorot speex package does an almost identical edit to its own 
> libtool. Do you think we should enable this for all libtool users? We'll only 
> know if anything breaks at run time.

Well, not having a rpath should not break things at runtime, unless a
custom rpath is really necessary. But I'm pretty sure in those cases,
the custom rpath will be wrong as it will point to some location on the
build machine.

What would be good is to understand why in certain situations libtool
decides to set a rpath and not in other cases.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
