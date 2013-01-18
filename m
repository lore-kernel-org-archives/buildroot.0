From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 18 Jan 2013 10:43:51 +0100
Subject: [Buildroot] Target rebuilding
In-Reply-To: <50F7FC52.7040608@relinux.de>
References: <4486164.oLnzyGq5cK@sagittae> <50F7FC52.7040608@relinux.de>
Message-ID: <4979126.r9TnxBzdAQ@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephan,
 
On Thursday 17 January 2013 14:27:46 Stephan Hoffmann wrote:
> Am 17.01.2013 12:04, schrieb J?r?me Pouiller:
> > It is handy to do tests directly in target/. But after some time, it is
> > necessary to make a new fresh target/ directory.
> 
> This topic comes up from time to time. Once upon a time I sent a patch
> to introduce a "make target-clean" (
> http://lists.busybox.net/pipermail/buildroot/2012-October/060484.html )
> , but it does not seem that this feature can be implemented in a
> reliable way, especially when libraries are removed from .config.
I am agreee with this thread. Since we cannot prove correctness it is not a 
good idea to give a target to this.

Nevertheless, in 90% of cases, I know I can rebuild target/ without recompile 
everything and this "hack" allow to divide by 500 time to rebuild target/. I 
would like to make this procedure easier to learn for users.

I asked myself if it was not possible to make this procedure more intuitive 
without breaking everything. That why I suggest these small changes. Each of 
them can be done independently. 

IMHO these changes would make process more coherent and would bring a better 
usage of Buildroot. But I understand it is subjective. 

> So for now I fear we have to stick to "make clean && make" if we want to
> clean up our file system.
Sure. But, if it is the only answer I give, my interlocutor will reply me that 
Buildroot is painful (which make me angry for all rest of the day).

> >  The current procedure to do
> > 
> > this is:
> > 
> > * remove build/.root (or remove target/ if you want to throw all your
> > work)
> 
> What's the use in removing the stamp file and keeping the target
> directory? I think the whole proccedure is meant to chean up the target
> file system, isn't it?
Right. It was mainly to point out "build/.root" is not an intuitive path.

[...]
> > I suggest following changes:
> >  1. Move build/.root to stamps/. Since it is hidden, many user forget this
> > file exist.
> >
> >  2. All stamps files are in subdirectories of build/. I suggest to move 
> > stamps/ to build/stamps/
> >
> >  3. Buildroot toolchain should create a stamp files to be uniform with
> >  other toolchains. In add, target/lib/libc.so.0 never exists when
> >  PREFER_STATIC_LIB is enable.
> >
> >  4. To be consistent stamps/*-toolchain-installed may be renamed 
> > stamps/.stamp_target_installed or stamps/.stamp_toolchain_target_installed
> > or toolchain/.stamp_target_installed. We may add a README file to explain
> > what is purpose of this apparently empty directory.
> >
> >   5. stamps/ext-toolchain-installed currently copy libc in staging/ and in 
> > target/. It may be splited in two rules: stamps/ext-toolchain-target-
> > installed and stamps/ext-toolchain-staging-installed.
[...]

Regards,

-- 
J?r?me Pouiller
