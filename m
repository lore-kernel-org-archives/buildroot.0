From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 2 Nov 2007 11:11:37 +1100
Subject: [Buildroot] per-project uclibc configuration does not	really w
	ork
In-Reply-To: <C0lYQrgSKC8w.XPtGTLcB@mailout.dof.se>
References: <C0lYQrgSKC8w.XPtGTLcB@mailout.dof.se>
Message-ID: <20071102001137.GB18120@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 01, 2007 at 06:16:00PM +0100, Ulf Samuelsson wrote:
> buildroot's project support (eg saveconfig target) appears to offer
> per-project uClibc .config support and per-project uClibc version selection.
> 
> => Once you have built 
>   the toolchain for one
>   project the rest of
>   the projects should
>   use that as an external
>   toolchain and none of the
>   gcc,binutils,uClibc 
>   configuration items in
>   Toolchain should be
>   changed.

OK. So if I have 2+ projects I wish to build using a common toolchain,
would you suggest making an additional project just to build the
toolchain (no packages, no target filesystems) then setting the other
projects to all use an external toolchain?

> Is there much benefit in trying to share package builds between
> projects, as buildroot does right now?
> 
> => Yes, if you build several
>    boards with a common
>    toolchain you reduce
>    the build time for each
>    package to a fraction
>    of a second.

Once the toolchain is common, you could achieve most of the same
speedup using ccache, but guarantee the correct results. The current
scheme can't guarantee that; you don't know what autoconf might pick up
which is target specific (other installed packages etc).

Admittedly if you build a toolchain for each project then you can't 
effectively use ccache (the compiler will appear to be different, even
if it is actually the same).


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
