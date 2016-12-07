From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 14:02:00 +0100
Subject: [Buildroot] [PATCH] package/reactcpp: new package
In-Reply-To: <29623960-22c5-ee30-a5fd-69692019e56c@grinn-global.com>
References: <20161206132643.27141-1-m.niestroj@grinn-global.com>
 <20161206163136.23d44f9f@free-electrons.com>
 <74b2df33-0865-c6b6-d731-f0e9191223b9@grinn-global.com>
 <20161207112426.5b40788d@free-electrons.com>
 <29623960-22c5-ee30-a5fd-69692019e56c@grinn-global.com>
Message-ID: <20161207140200.3873c08e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Dec 2016 12:51:24 +0100, Marcin Niestroj wrote:

> > And that's perfectly fine. Just let "make install" install header files
> > and static library. Buildroot will clean them up at the end of the
> > build, in the "target-finalize" step.  
> 
> Ok, I was not aware cleaning header and *.a files in target-finalize.
> 
> I have used 'make install' and checked the target directory before and
> after target-finalize. There was *.a symlink pointing to *.a.1.0.3.
> After target-finalize only the symlink was removed. How should we fix
> that?

Then you can do a POST_INSTALL_TARGET_HOOKS to remove this additional
file.

It is very weird to create a static library file name with a version
number. Normally, static libraries are directly installed as
lib<foo>.a.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
