From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Thu, 31 Mar 2011 15:55:47 -0600
Subject: [Buildroot] makeconv: hidden symbol
 `__sync_val_compare_and_swap_4'
In-Reply-To: <1301257751.2716.55.camel@galileo.graphics-muse.org>
References: <1301257751.2716.55.camel@galileo.graphics-muse.org>
Message-ID: <1301608547.2118.2.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2011-03-27 at 14:29 -0600, Michael J. Hammel wrote:
> 1. It is in gcc 4.4.1 but Buildroot's 2011.02 makeconv build is not
> compatible with this - 2010.10 seems to work okay.
> 2. It isn't in gcc 4.4.1 and I need some additional option to enable it
> or switch to an appropriate version of the compiler that does
> 3. It is in gcc 4.4.1 and it works with makeconv but I'm just not using
> the two together correctly somehow.

Just to follow up my own question:
Looks like this may have been related to the use of an older uClibc
within Crosstool-NG.  I've upgraded my toolchain build to 1.10.0 and
uClibc to 0.9.30.2 with gcc 4.5.2 and the 2011.02 build completes
successfully (sans mplayer for ARM, which is an unrelated problem).
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
