From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 13 Aug 2013 22:08:40 +0800
Subject: [Buildroot] ubifs rootfs attached error
In-Reply-To: <520A36FB.80403@gmail.com>
References: <20130813130443.GA3676@zuhnb712>
 <520A36FB.80403@gmail.com>
Message-ID: <20130813140840.GA5063@zuhnb712>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 13, 2013 at 03:39:07PM +0200, Stefan Peter wrote:
> Dear Woody Wu,
> 
> On 13.08.2013 15:04, Woody Wu wrote:
> > Hi,
> ...
> > Firstly, below are the kernel error messages:
> > 
> > ------------------------------------------------------------------
> > NAND_ECC_NONE selected by board driver. This is not recommended !!
> 
> Modern flash chips actually rely on specific forms of cyclic redundancy
> checks in order to be able to correct for bit errors in NAND flash.
> Without using the proper CRC algorithm, you can never be sure to be able
> to read from the flash what you have written to it. Another hint at this
> problem are the "Bad eraseblock" messages that follow.
> 
> Check your kernel configuration and the documentation of your target for
> the proper ECC settings for the NAND flash.

Stefan, thanks for the hints.  Yes, my kernel configuration disalbed the
NAND ECC. I like to study on that. But, do you think this is reason why
my ubifs did not get attached? Thanks.


> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
I can't go back to yesterday - because I was a different person then
