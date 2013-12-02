From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Dec 2013 20:51:42 +0100
Subject: [Buildroot] Microblaze and ARC toolchains
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D685F1B041@de02wembxa.internal.synopsys.com>
References: <20131130004049.0c5835d0@skate>
 <E6BF041E97966E4DB955F0DF883AD2D685F1B041@de02wembxa.internal.synopsys.com>
Message-ID: <20131202205142.5b4cfd3c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mischa, Spenser,

On Mon, 2 Dec 2013 13:20:41 +0000, Mischa Jonker wrote:

> >  * On the ARC side of things, what I get is a failure at the uClibc
> >    build step. However, what's weird is that I did get one
> > successful build, but now that I've restarted everything from
> > scratch, it fails (and did so two times in a row) :
> 
> Unfortunately I am unable to reproduce: I have rebased the patches to
> the latest status of today and used your defconfig below. I even
> cleared the "dl" folder. 

Ignore my previous e-mail. It was my fault. My patches to try to avoid
MAKEINFO were changing "make install" to just "make" due to me
overriding MAKE_OPT. So obviously, binutils were no longer being
installed, causing all sort of weird problems.

> I will retest it on our compute farm that has very old Linux
> distributions running on it with almost no development tools at all.
> Maybe the issue shows itself there.

Don't spend time doing that. The ARC and Microblaze builds are now OK.
I'm just fixing a few things, and I will send a complete batch of
patches for Peter to pull as soon as things are ready for me.

Thanks, and sorry for the noise,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
