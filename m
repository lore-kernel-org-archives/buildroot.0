From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 14:48:43 +0200
Subject: [Buildroot] [PATCH 02/30] toolchain-external: pass CC and
 CFLAGS as arguments
In-Reply-To: <d5b1eb4e-5451-dc97-1a62-70ddb2898ae9@mind.be>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
 <1477255711-28603-3-git-send-email-romain.naour@gmail.com>
 <d9ace2a7-d062-64a3-fe7d-9afeb4adec42@mind.be>
 <20161025134411.12a91a7d@free-electrons.com>
 <d5b1eb4e-5451-dc97-1a62-70ddb2898ae9@mind.be>
Message-ID: <20161025144843.24d86639@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 14:46:01 +0200, Arnout Vandecappelle wrote:

> >  toolchain-external: TOOLCHAIN_EXTERNAL_CREATE_*_LIB_SYMLINK: use arguments instead of global variables
> >  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_*_LIBS: use arguments instead of global variables
> >  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER: use arguments instead of global variables
> >  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER: use arguments instead of global variables
> > 
> > I find this split a lot more logical than a split by argument being
> > added, as the latter would mean a given function gets modified in two
> > different patches.  
> 
>  Sure, but then it would have been 4 patches instead of 2. The way it was split
> up now was completely illogical IMHO.

There are four patches in the current patch series:

  toolchain-external: pass CC and CFLAGS as arguments
  toolchain-external: pass CC and CFLAGS as arguments
  toolchain-external: pass arguments CROSS to install wrapper
  toolchain-external: pass arguments CC, CFLAGS, INSTALL_DIR while
    installing gdbserver

They are split *exactly* like I said above, except that their commit
title and description are not very good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
