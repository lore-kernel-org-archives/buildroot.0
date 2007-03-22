From: Erik Andersen <andersen@codepoet.org>
Date: Thu, 22 Mar 2007 10:30:50 -0600
Subject: [Buildroot] BSP patch
In-Reply-To: <02e901c76c0f$09244670$01c4af0a@Glamdring>
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e901c76c0f$09244670$01c4af0a@Glamdring>
Message-ID: <20070322163050.GA3907@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu Mar 22, 2007 at 12:16:51AM +0100, Ulf Samuelsson wrote:
> He wants an easy way to configure buildroot by having a set
> of ".config" files and a way to select  *which* config file
> by doing
> 
> $ make <board>-defconfig
> 
> where the defconfig files are stored in the "configs" directory.

A reasonable thing I suppose.

> I actually have a "configs" directory as well in my private buildroot
> but I copy stuff manually to the top level.
> I think that S?ren's patch is orthogonal to my work.
> 
> 
> The BSP patch is really there to allow two different configurations
> to be built within the same buildroot directory so they can share:
> 
> * toolchain
> * root file system build directory.
> but have different configurations for linux kernel and busybox
> and eventually you may want to have different content of the root file
> system.

I agree this is a desirable thing for many situations.

> The solution is to create a new directory structure
> target_build_<arch>/<board> where everything is built.
> The patch allows pre/postfixes to this directory name.

Ok

> When I have time, I would like to be able to download kernel patches
> to this directory instead of storing the patch in the target directory.
> 
> The current linux.mk is very limited in functionality and forces
> duplication of the linux patch for each board.

I agree.  It works, but this is a rather annoying limitation.
When a company has i.e. PRODUCT20, PRODUCT21, PRODUCT22, etc,
there is no easy way to build for all of them without doing a
lot of needless duplication.

> I do not see why the same patch (size > 1 MB) should be stored 10 times
> just because I have 10 boards.

Yes, this is a weakness that should be addressed.

> The BSP patch also put some structure on where the result ends up.
> Today everything is stored in the top directory, but if you
> want to build multiple boards, then you are going to get a lot of clutter.
> 
> The BSP patch will put bootloaders, kernel and root file systems in
> binaries/<board>
> 
> S?ren also would like to separate the target build from the build
> of the root file system, so I think he supports this patch.
> 
> 
> 
> So in short, I think there is really no reason to delay either of the
> patches.

Ok.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
