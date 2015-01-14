From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:03:16 +0100
Subject: [Buildroot] [PATCH V2] dvdauthor : new package
In-Reply-To: <54B47B2C.1010504@ou.edu>
References: <54B47B2C.1010504@ou.edu>
Message-ID: <20150114220316.49b1e5b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Mon, 12 Jan 2015 19:55:56 -0600, Steve Kenton wrote:
> DVDAuthor is a set of tools to help you author the file and directory
> structure of a DVD-Video disc, including programmatic commands for
> implementing interactive behaviour. It is driven by command lines and
> XML control files, though there are other programs that provide
> GUI-based front ends if you prefer
> 	
> Note - Despite lack of a version bump the two line gentoo
> patch to src/spuunmux.c against "stock" dvdauthor-0.7.1
>     if (setjmp(png_ptr->jmpbuf))
>     if (setjmp(png_jmpbuf(png_ptr)))
> # to allow use of libpng15/16 is already applied to downloadable
> # dvdauthor-0.7.1.tar.gz
> 
> http://dvdauthor.sourceforge.net
> 
> Signed-off-by Stephen M. Kenton <skenton@ou.edu>

Thanks, applied, after doing a number of changes:

[Thomas:
 - Make the libdvdread dependency optional: it is only needed for the
   dvdunauthor program, which can be disabled using a configure
   option. So a separate Config.in option was added for dvdunauthor.
 - Adjust license to GPLv2+, as can be seen in the source code itself.
 - Add optional dependency on fontconfig and imagemagick. Make sure we
   don't pick up a host installed GraphicsMagick (which is different
   from ImageMagick!)
 - Add a hash file.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
