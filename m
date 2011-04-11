From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Mon, 11 Apr 2011 17:34:59 -0600
Subject: [Buildroot] which templates are used?
In-Reply-To: <BANLkTime4xLnnmc31J-SUBj0mLgoAxFCnA@mail.gmail.com>
References: <4DA36046.2040606@michaelburghart.de>
	<4DA369FA.8050505@michaelburghart.de>
	<BANLkTime4xLnnmc31J-SUBj0mLgoAxFCnA@mail.gmail.com>
Message-ID: <1302564899.17872.17.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-04-11 at 23:14 +0200, Bj?rn Forsman wrote:
> Buildroot has a quirk: the rootfs skeleton is copied to the target dir
> only once(!). If you change any files in ./fs/skeleton (or your custom
> path) you have to do "make clean" and start over (or hack the
> Makefile, around line 420...).

I've been copying the skeleton to the "customize" package (re:
package/customize/source), removing output/build/.root and rerunning the
make.  I think this will recopy the skeleton I updated before generating
the fs image, but without having to recompile everything.  You just have
to have the customize package enabled.

I say this with only modest confidence - I don't remember checking if it
*actually* ran the custom package build again but I was pretty sure it
did.  That was how I was picking up skeleton changes from my build
system.

-- 
Michael J. Hammel <buildroot@graphics-muse.org>
