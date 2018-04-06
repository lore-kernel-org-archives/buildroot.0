From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 17:13:31 +0200
Subject: [Buildroot] [PATCH 1/2] cramfs: change to new site location
In-Reply-To: <TY1PR01MB1562ADDDE3949C2BC35FC4408ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
 <20180213195449.51516-2-chris.brandt@renesas.com>
 <20180213211453.519b65eb@windsurf.lan>
 <SG2PR06MB1165EA4292BE78ADF8D3A1678AF60@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CANQCQpZgjJqSpY9Pma9wsB=QtPL5onLYLb5pdteTSUULOcMF-A@mail.gmail.com>
 <TY1PR01MB1562ADDDE3949C2BC35FC4408ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Message-ID: <20180406171331.5b6891f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 Apr 2018 15:02:55 +0000, Chris Brandt wrote:

>  > It is missing the new case where the compressed block length is stored
>  > as an u16 at the beginning of the block. That's pretty much the only use
>  > of u16 in the code so easy to locate.  
> 
> So then in that case, you would need a bswap_32() and a bswap_16() macro.
> 
> However...that code is currently inside a "} else if (0) {" block, so it
> looks like it will never get executed anyway.

I don't see where this else if (0) block is. Where do you see that ?

Matthew: the current patch in Buildroot also fixes cramfsck, but not
your contribution on the new version of the cramfs tools.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
