From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 14 Aug 2013 06:12:17 +0800
Subject: [Buildroot] ubifs rootfs attached error
In-Reply-To: <520A7922.2050703@gmail.com>
References: <20130813130443.GA3676@zuhnb712> <520A36FB.80403@gmail.com>
 <20130813140840.GA5063@zuhnb712> <520A7922.2050703@gmail.com>
Message-ID: <20130813221217.GA18527@zuhnb712>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 13, 2013 at 08:21:22PM +0200, Stefan Peter wrote:
> On 13.08.2013 16:08, Woody Wu wrote:
> 
> > Stefan, thanks for the hints.  Yes, my kernel configuration disalbed the
> > NAND ECC. I like to study on that. But, do you think this is reason why
> > my ubifs did not get attached? Thanks.
> 
> Yes, definitively. I don't want to say that there are no other problems
> in your setup, but as long as you can not read back exactly what you
> have written to the flash, there is very little chance that UBI will work.
> UBIFS is based upon MTD. And MTD relies on a working FLASH driver. As
> long as one of these layers does not work properly, the topmost (UBIFS)
> layer can not work properly, either.
> 

If so, that's really wired. Since befor trying the ubifs, the same
kernel was actually running jffs2 as rootfs without a sign that there is
a i/o problem. Just because the performance concerns to jffs2, I decided
to try ubifs.


-- 
I can't go back to yesterday - because I was a different person then
