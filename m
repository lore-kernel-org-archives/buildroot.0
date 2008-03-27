From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 27 Mar 2008 13:06:39 +0100
Subject: [Buildroot] Using a different kernel tree ?
In-Reply-To: <057401c88ff0$46259410$ad289e86@LPSC0173W>
References: <057401c88ff0$46259410$ad289e86@LPSC0173W>
Message-ID: <20080327120639.GD13379@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 27, 2008 at 10:52:22AM +0100, Guillaume Dargaud wrote:
>Hello all,
>I'd like to use, within buildroot, the kernel tree from 
>git://git.xilinx.com/linux-2.6-xlnx.git instead of the vanilla tree coming 
>with buildroot.
>
>How does one do that ?

The easiest approach would be to git clone that kernel and
tar -cjf dl/linux-2.6.24.4.tar.bz2 linux-2.6-xlnx.git
(--exclude='.git' if you don't want to write patches against it) and use
that.

>If I just replace toolchain_build_ppc/linux-2.6.24 and/or 
>project_build_ppc/my_project/linux-2.6.24 with the Xilinx tree, on the next 
>"make ARCH=ppc linux26-menuconfig" it just deletes the whole directory and 
>rebuilds it from bzcat...
>
>Or are there alternatives if I want to use the nice toolchain built by 
>buildroot ?
>
>
>BTW, what is the difference between toolchain_build_ppc/linux-2.6.24 and 
>project_build_ppc/my_project/linux-2.6.24 ?

No, previously we only had one source-tree, but Ulf changed that for
reasons that i do not remember offhand (conflicting patches, i.e. broken
patches, IIRC).
