From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 26 Feb 2016 09:40:51 +0000
Subject: [Buildroot] [PATCH 2/2] host-m4: fix build when -std=gnu99 and
 inline functions are used
In-Reply-To: <20160226091921.6e367255@free-electrons.com>
References: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
 <1456400230-4187-3-git-send-email-ltrimas@synopsys.com>
 <20160225135436.18a8385c@free-electrons.com>
 <1456405085.2312.2.camel@synopsys.com>
 <20160225142622.47b2841a@free-electrons.com>
 <1456414403.4586.63.camel@synopsys.com> <56CF7CA0.7080801@mind.be>
 <1456471224.28645.10.camel@synopsys.com>
 <20160226091921.6e367255@free-electrons.com>
Message-ID: <1456479651.28645.18.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2016-02-26 at 09:19 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 26 Feb 2016 07:20:24 +0000, Alexey Brodkin wrote:
> 
> > > ?I think you can basically say your host toolchain is broken: it fails to
> > > compile valid programs, because glibc doesn't satisfy the -std=gnu99 option.
> > 
> > That's very true. But it looks like on RedHat/CentOS 5.x (which are still
> > in use here and there) discussed problem exists.
> > 
> > Given default gcc in RHEL 5 is 4.1 (though 3.4 and 4.4 are available via
> > compat-gcc-34 and gcc44 correspondingly) ad it fails to compile host tar and m4
> > in current Buildroot I would still look for a permanent solution in vanilla
> > Buildroot instead of work-around on per machine basis.
> 
> With the default gcc 4.1 used in RHEL5, I would assume that glibc 2.5
> works fine and that you can use Buildroot with no problem. Have you
> tried building Buildroot with the default gcc 4.1 ?
> 
> What Arnout calls a broken toolchain is your combination of gcc 4.9 and
> glibc 2.5.

Ok so finally I made one good experiment - built Buildroot from scratch
with gcc 4.1 and you know what - it was built perfectly fine.

So I think what we first did was a real misuse - I hope lesson will be
learned - it's risky to use shiny new stuff on ages old machines :)

I.e. both patches could be dropped now and I'll make sure people
uses correct combo of tools on our farm machines.

And sorry for that noise!

-Alexey
