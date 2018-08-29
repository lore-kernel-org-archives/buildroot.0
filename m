From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 20:57:12 +0200
Subject: [Buildroot] [PATCH next v2] libyaml: fix libyaml-legal-info
 build failure
In-Reply-To: <20180829183635.112003-1-giulio.benetti@micronovasrl.com>
References: <87zhx5vxpk.fsf@tkos.co.il>
 <20180829183635.112003-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180829205712.6e06acc4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Aug 2018 20:36:35 +0200, Giulio Benetti wrote:
> LICENSE file changed and hash hasn't been recalculated, this leads to
> libyaml-legal-info build failure.
> 
> Kirill Simonov Copyright now covers 2006-2016.
> Ingy d?t Net Copyright has been added instead for 2017-2018.
> 
> Recalculate sha256 locally and substitute it in libyaml.hash file.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c10/c10baf6e9bae92d515264b677eeb1ce6c98c793d//
> http://autobuild.buildroot.net/results/c66/c66ddb56fecf1570a8669bd9d8824cd2132f9776//
> http://autobuild.buildroot.net/results/84e/84e9530aff0c981a009416f31470133fb2114421//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/libyaml/libyaml.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks. An additional thing that would have been nice
in the commit log is something like this:

"""
Commit a4633a53ae1592ad2f4ea6f931c061382cf44b7f ("libyaml: bump to
version 0.2.1") forgot to update the hash of the license file.
"""

or any other wording that references the commit that introduced the
problem. It is sometimes useful later on to figure out when a given
problem was introduced.

But that wasn't important enough for this one, so I've applied as-is.
Something to keep in mind for future contributions, though.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
