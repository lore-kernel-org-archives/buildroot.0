From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed, 1 Jun 2016 14:38:37 +0200
Subject: [Buildroot] [PATCH] odroid_xu4: new board
In-Reply-To: <20160601135205.7bd9661a@free-electrons.com>
References: <1446836886-27256-1-git-send-email-viktorin@rehivetech.com>
 <20160531223059.34d2c127@free-electrons.com>
 <20160601130317.5150dfe4@pcviktorin.fit.vutbr.cz>
 <20160601135205.7bd9661a@free-electrons.com>
Message-ID: <20160601143837.03fc2727@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 1 Jun 2016 13:52:05 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed, 1 Jun 2016 13:03:17 +0200, Jan Viktorin wrote:
> 
> > > Sorry for the late review.     
> > 
> > Half a year, cool :). Never mind, I am pretty sure there are many other
> > things to do around Buildroot...  
> 
> Well, you can see by yourself the list of pending patches at
> http://patchwork.ozlabs.org/project/buildroot/list/. The best thing you
> can do to get your patches integrated is to help review and test the
> patches from others.

I know... that's exactly what I've tried to express.

> 
> > Do you mean https://github.com/ioft/linux.git? It doesn't boot for me. I spent
> > about 2 days just on this (about 2 weeks ago). No idea why...  
> 
> No, I'm talking about
> https://github.com/tobetter/linux/tree/odroidxu4-v4.6. It is the same
> Github repository as the one you're using, just a different branch.

I've missed this one. Thank you! I'll try it as soon as I find some time for it.

> 
> > If there is somebody with a successful setup of v4.6, I'd be happy to see what
> > I did wrong.  
> 
> If 4.6 doesn't work for you, I'm fine with a defconfig using 4.2 for
> now. Using 4.6 is definitely not a requirement.
> 
> > > Please use odroidxu4_defconfig from the upstream tree. It is not
> > > necessary to have a strictly minimal kernel configuration, we very much
> > > prefer using an upstream defconfig.    
> > 
> > Ok, I just didn't like the default configuration due to its size...  
> 
> Right, but the advantage of using upstream's defconfig is that it will
> be updated with new options as needed, and also removes stuff from
> Buildroot.

Yes.

> 
> > > > diff --git a/board/hardkernel/readme.txt b/board/hardkernel/readme.txt
> > > > new file mode 100644
> > > > index 0000000..d7a77db
> > > > --- /dev/null
> > > > +++ b/board/hardkernel/readme.txt
> > > > @@ -0,0 +1,49 @@
> > > > +Odroid XU4
> > > > +==========
> > > > +
> > > > +http://www.hardkernel.com/main/products/prdt_info.php?g_code=G143452239825    
> > 
> > This duplication is probably a mistake...  
> 
> Yeah, but no big deal. That's the type of minor issue I can fix when
> applying.
> 
> > > Please use the genimage mechanism to directly generate a bootable SD
> > > card. Look at the other boards supported in Buildroot, many of them are
> > > using genimage.    
> > 
> > Ok, sorry, I have no clue how genimage works and what does it do...
> > I'll try to rework this.  
> 
> It allows to generate a complete hard disk or SD card image, with
> multiple partitions in it. Check for example
> board/raspberrypi/genimage-raspberrypi0.cfg and the post-image
> script board/raspberrypi/post-image.sh.

Ok, thanks for the brief description. Again, when I find some time for,
I'll try to fix the patch.

> 
> Thanks a lot!

Thank you for your comments!

Jan

> 
> Thomas



-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic
