From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:50:25 +0200
Subject: [Buildroot] [PATCHv2] core/sdk: generate the SDK tarball
 ourselves
In-Reply-To: <20180630163849.GE2384@scaer>
References: <20180630135645.2956-1-yann.morin.1998@free.fr>
 <CAOJ2eMf9iAP4kgqPWv2HwD0hBvzeWD7H7xONh0dZtDO1FoY=MQ@mail.gmail.com>
 <20180630163849.GE2384@scaer>
Message-ID: <20180630185025.0b19145a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 18:38:49 +0200, Yann E. MORIN wrote:

> > Sorry, but I can neither follow nor agree with this logic. The above
> > tar command line is IMHO *exactly* how the SDK tarball should be
> > generated, because it leaves the choice up to the user of the tarball
> > *how* to use/integrate it downstream.
> > 
> > Anything else, especially directory names that change with every
> > build, only creates unnecessary hoops the user of the SDK has to jump
> > through every time.  
> 
> Well, on my side, I *do* want an artefact that is versioned, so that I
> am sure users do not extract a new one over a previous one, so that they
> can work on different versions at the same time.
> 
> Versionned artefacts are a requirement for some people.
> 
> And I do want that version to represent something that I can actually
> identify. By default, I *do* want it to identify the version of
> Buildroot that was used to generate that SDK. But I understand that
> someople may want another identifier, hence the variable to customise
> it.

Nowhere in Buildroot we have versioned artefacts. rootfs.tar is always
rootfs.tar, rootfs.ext2 is always rootfs.ext2, etc.

I don't think it makes sense to change this policy just for the tarball.

Yocto has versioned artefacts, with a non-versioned symlink. And it's
super annoying IMO, as you collect gazillions of leftovers from
previous builds, making the image folder quickly unreadable.

> > I'm not really happy with this, but at least I now have the choice and
> > just need to update one line in the build script to disable all this
> > useless stuff.  
> 
> Well, I prefer the rule of least surprise, so that users by default do
> not have surprises when they use (i.e. extract) the generated tarball.
> Getting a tarbomb is very bad for most users. And I prefer to adapt my
> scripts to accomodate with that (tar's --strip-components=1, as already
> mentionned), rather than trash my home dir, or any other precious location.

On that topic, I side with you. Tarballs with everything inside a
sub-directory is the norm, and we should do this as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
