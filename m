From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:24:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.18.0
In-Reply-To: <CADvTj4qqBC9QMqyxvKKVO0+yn7CsG36hSqvf1vu7CEzshaJe2Q@mail.gmail.com>
References: <20200303230943.24334-1-james.hilliard1@gmail.com>
 <20200305210537.42d4c081@windsurf>
 <CADvTj4p7bNSX6C+Y6Lo_cuHMT+4ifdJgckm2mEPX1tvyFyMTdQ@mail.gmail.com>
 <0b0b94ef-53a8-3f93-2cc6-09be6b5d318f@mind.be>
 <CADvTj4rWcE615eLkeWeLW-BvXu+4Ruebo-xVLVQRVx=XJKKW6w@mail.gmail.com>
 <ed014e8f-4aa1-1577-7bad-d2068a625dc1@mind.be>
 <CADvTj4qqBC9QMqyxvKKVO0+yn7CsG36hSqvf1vu7CEzshaJe2Q@mail.gmail.com>
Message-ID: <20200428072438.2f7f2b0e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 22:09:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > >>  That means something is wrong with commit 4e0bc29933.  
> > > From what I can tell that change is for fixing a different issue.  
> >
> >  Right! I forgot - commit 4e0bc29933 was only handling it for target. For host,
> > we would need a native-compilation.conf. I had started on that but didn't finish
> > it because I had no package to test it with. Hm, apparently I never even posted
> > the WIP on the mailing list...  
> I managed to get it working properly here:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200428040638.122494-1-james.hilliard1 at gmail.com/

I think Arnout wanted a native-compilation.conf instead of passing an
extra argument so that it also works with people building stuff outside
of Buildroot.

However, I don't get how this would have solved the problem as take
here: the issues we are seeing are with *target* packages, which are
looking at using the host pkg-config. Which is exactly what
4e0bc29993376613d200e892d491e31ea5a49622 was supposed to fix. So I'm
really confused.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
