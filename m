From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 23:20:06 +0100
Subject: [Buildroot] [PATCH] gdb: fix target gdb building from git
In-Reply-To: <1425938155.2312.22.camel@synopsys.com>
References: <1424768600-10056-1-git-send-email-abrodkin@synopsys.com>
 <20150309185549.625180ba@free-electrons.com>
 <1425938155.2312.22.camel@synopsys.com>
Message-ID: <20150309232006.1bdb74f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 9 Mar 2015 21:55:55 +0000, Alexey Brodkin wrote:

> Actually I discovered this issue when I tried to build target gdb with
> external tools.
> 
> So to reproduce this issue please apply
> http://patchwork.ozlabs.org/patch/448242/ to your local git tree, then
> select external tools for ARC and try to build target gdb.
> 
> And this is my defconfig to reproduce the issue:
>  --->8---
>  BR2_arcle=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_PACKAGE_GDB=y
>  BR2_PACKAGE_GDB_DEBUGGER=y
>  --->8---
> 
> Indeed if you build toolchain yourself this issue won't happen because
> "host-texinfo" gets built during toolchain building.

Ah, ok, indeed makes sense. Then I'll wait for your external toolchain
patch to be ready (I've just sent a bunch of comments), and I'll apply
this one as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
