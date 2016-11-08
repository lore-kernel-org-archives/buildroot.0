From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 8 Nov 2016 14:07:51 +1100
Subject: [Buildroot] [PATCH 1/1] mpv: fix build on powerpc64 w/ altivec
In-Reply-To: <20161107223541.15234e0b@free-electrons.com>
References: <2caa778dd77d8e8b473a9d2507368bb2c4b497b9.1478484002.git.sam.bobroff@au1.ibm.com>
 <20161107223541.15234e0b@free-electrons.com>
Message-ID: <20161108030751.GA16691@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 07, 2016 at 10:35:41PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,  7 Nov 2016 13:00:03 +1100, Sam Bobroff wrote:
> > Fixes
> > http://autobuild.buildroot.net/results/77f/77f00633b0b25f001cd4ca54ed3a12aee301c287
> > 
> > Add a patch to work around a name collision between bool and altivec's
> > bool.
> > 
> > Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> 
> Could you instead try to #include <stdbool.h> in this ao_sdl.c file?

Sure. It seems to work just as well, and I agree that it looks nicer.
I'll post a v2.

(I was a bit worried that including stdbool would change other bools
from vector types back to normal bool as well. From a bit of a look at
the file there doesn't seem to actually be any others so it doesn't
matter either way.)

Cheers,
Sam.
