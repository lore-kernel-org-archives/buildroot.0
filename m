From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 17:29:13 +0200
Subject: [Buildroot] [PATCH 1/2] cramfs: change to new site location
In-Reply-To: <TY1PR01MB156241B9D47E7B7BF2224EE28ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
 <20180213195449.51516-2-chris.brandt@renesas.com>
 <20180213211453.519b65eb@windsurf.lan>
 <SG2PR06MB1165EA4292BE78ADF8D3A1678AF60@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CANQCQpZgjJqSpY9Pma9wsB=QtPL5onLYLb5pdteTSUULOcMF-A@mail.gmail.com>
 <TY1PR01MB1562ADDDE3949C2BC35FC4408ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <20180406171331.5b6891f9@windsurf>
 <TY1PR01MB156241B9D47E7B7BF2224EE28ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Message-ID: <20180406172913.5c25add8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 Apr 2018 15:19:34 +0000, Chris Brandt wrote:
> On Friday, April 06, 2018 1, Thomas Petazzoni wrote:
> > > However...that code is currently inside a "} else if (0) {" block, so it
> > > looks like it will never get executed anyway.  
> > 
> > I don't see where this else if (0) block is. Where do you see that ?  
> 
> https://github.com/npitre/cramfs-tools/blob/master/mkcramfs.c#L814

Ah, ok, it's the "compressed block" mechanism that is between if (0),
not the big endian support code that Matthew proposed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
