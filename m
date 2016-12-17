From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:47:35 +0100
Subject: [Buildroot] [Patch v2 1/9] skalibs: new package
In-Reply-To: <20161217134002.GA727@itchy>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20161210214641.05e6af92@free-electrons.com>
 <20161211181827.GA23661@itchy>
 <20161213225402.37334028@free-electrons.com>
 <20161217134002.GA727@itchy>
Message-ID: <20161217144735.212730a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Dec 2016 14:40:02 +0100, Eric Le Bihan wrote:

> > And so it's really only the static library that needs to be removed:
> > the shared library is really not built/installed when shared libraries
> > are not enabled in the Buildroot configuration?  
> 
> Yes. When shared libraries are disabled in Buildroot configuration, they
> are not built.

OK, good!

> I've modified the package Makefiles for skalibs, execline, s6 and s6-rc
> to use --prefix=$(HOST_DIR)/usr when building the host variants:
> 
>  - for execline: adding --shebangdir=/usr/bin makes it generates correct
>    scripts for the target.
>  - for s6-rc: adding --libexecdir=/usr/libexec makes it generates
>    correct scripts/helpers for the target (thought some programs are not
>    usable on the host, but they are not used, so they will not be
>    installed).
> 
> So, I can get rid of the $(DESTDIR) trick in host variants.

Perfect!

> There has been a long delay between iterations because it allowed the
> maintainer to add proper support for uclibc-ng. And there are few
> releases during a year. So I waited until the "Fall 2016 release", so I
> could remove the libc limitations set in the previous patch series.
> 
> Next respin will be availble before Christmas :-D

Good. I'll try to have a look as soon as the patches are there and
hopefully apply them.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
