From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 20 Aug 2015 10:30:06 -0400
Subject: [Buildroot] rpi: image generation
In-Reply-To: <20150820095906.0b2524c2@free-electrons.com>
References: <55D501F6.6000909@wsystem.com>
 <20150820095906.0b2524c2@free-electrons.com>
Message-ID: <20150820143005.GA6441@ketchup.mtl.sfl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Beno?t, Thomas,

On 15-08-20 09:59:06, Thomas Petazzoni wrote:
> Dear Beno?t Th?baudeau,
> 
> On Thu, 20 Aug 2015 00:23:50 +0200, Beno?t Th?baudeau wrote:
> 
> > I have local changes for the Raspberry Pi that can automatically
> > generate an image to be flashed on the SD card (e.g. with dd).
> > 
> > This mechanism uses genimage, so no sudo is needed. It generates a
> > FAT32 partition of 64 MiB and an ext4 partition that just fits its
> > contents with a small free space. I also have scripts to auto-expand
> > the ext4 partition and FS to fill the SD card.
> > 
> > Are you interested in any of this, or do you prefer to keep the
> > current manual approach that makes it possible to do just anything
> > custom?
> 
> I am interested in seeing more examples of genimage usage. I believe
> Vivien Didelot, who submitted the patch to use genimage for the
> Wandboard configuration, was also planning on submitting more genimage
> related patches.

Indeed, I initial had genimage configs for Rpi(s), Wanboard and
BeagleBone. I didn't find the time yet to rebase all that.

Similar to the upstreamed Wandboard config (7fce297), the RPi(s) config
looks like this: https://gist.github.com/vivien/752f85b563b02afd772c

Note, this was based on 8d00fe4. With some new upstreamed patches for
RPi and DT, the patch 1/2 might not be relevant anymore.

Feel free to rebase mine or update yours. If you submit something,
please put me in Cc, I'd be happy to review and test any of your patch.

Best,
-v
