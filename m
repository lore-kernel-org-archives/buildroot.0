From: Chris Brandt <Chris.Brandt@renesas.com>
Date: Tue, 13 Feb 2018 21:08:52 +0000
Subject: [Buildroot] [PATCH 1/2] cramfs: change to new site location
In-Reply-To: <20180213212650.3fe2884b@windsurf.lan>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
 <20180213195449.51516-2-chris.brandt@renesas.com>
 <20180213211453.519b65eb@windsurf.lan>
 <SG2PR06MB1165EA4292BE78ADF8D3A1678AF60@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20180213212650.3fe2884b@windsurf.lan>
Message-ID: <SG2PR06MB1165C191C6C74E6FA516DF648AF60@SG2PR06MB1165.apcprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tuesday, February 13, 2018, Thomas Petazzoni wrote:
> > I don't have any big endian systems, so I can't test it either.
> 
> We have a number of Qemu defconfigs, including for big-endian systems
> such as PowerPC. It should be doable to perform a test :)


But....there's more to the story.


I had asked Nicolas if he thought this patch would just magically work 
if I applied it to his current tree.


He had this to say:

On Monday, January 08, 2018, Nicolas Pitre wrote:
> > Could you have a quick look at 0001-endian.patch and see if anything
> > jumps out at you before I try to merge it with you existing repo?
> 
> It is missing the new case where the compressed block length is stored
> as an u16 at the beginning of the block. That's pretty much the only use
> of u16 in the code so easy to locate.
> 
> Also I'd prefer if the swapping functions had the bswap_ prefix rather
> than fix_ which is a bit too generic.
> 
> And would be a good idea to use bswap_32() rather than open coding
> wswap(). You'll also need bswap_16() too anyway.


So, the patch does need a little bit of fixing up.

I could probably rework the patch as Nicolas suggested as long as 
someone else gives it a try. And then, it could get submitted to go back
into the cramfs-tools repo instead of living as a patch in Buildroot forever.


Chris
