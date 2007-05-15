From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 15 May 2007 13:43:35 +0200
Subject: [Buildroot] [patch] sysroot support in toolchain,
	use correct pathes in staging_dir
In-Reply-To: <20070410103901.GC15274@aon.at>
References: <20070410103901.GC15274@aon.at>
Message-ID: <20070515114335.GA22166@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 10, 2007 at 12:39:01PM +0200, Bernhard Fischer wrote:
>Hi,
>
>This is a heads-up that i mean to correct the pathes to includes and
>libs in the staging dir as suggested in bug 
>http://busybox.net/bugs/view.php?id=1290
>Doing so is ment to ease moving the staging-dir (and it's
>cross-compiler) to a different machine for re-use.
>
>The theory of operation is that we aim to keep the positions of "normal"
>desktop machines for the directory layout and also build the toolchain
>with full sysroot-support to avoid trouble with hardcoded search pathes
>to headers and libraries.
>
>A preliminary incarnation which only takes care of gcc-4.x is here:
>
>http://uclibc.org/~aldot/buildroot.mine.cow.20070406-1957.diff.bz2
>(134688 Bytes)

updated patch is here:
http://uclibc.org/~aldot/buildroot.mine.cow.20070515-1321.diff.bz2

I converted a few more packages to install their files into the proper
place.
gcc-3.x support is (still) not done, 4.x works fine. Anyone willing to
fix gcc-3.x?
