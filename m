From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 22:19:58 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <53569BBE.1020707@mind.be>
References: <20140420063009.8B76B100DB9@stock.ovh.net>
 <20140420104812.5bc926a9@skate> <53569BBE.1020707@mind.be>
Message-ID: <20140422221958.6240077e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 22 Apr 2014 18:41:34 +0200, Arnout Vandecappelle wrote:

>  I think there should be two changes to the autobuilders.
> 
> - Reduce the % yes. With the growing number of packages, the number of
> selected packages is also becoming unrealistically large.

True. Currently the KCONFIG_PROBABILITY is chosen between 1% and 35%.
Should I reduce that to 30% ? 25% ?

> - If webkit is selected, increase the timeout with an hour. I don't know
> how easy that is, though.

Not easy with the current horrible script, because the timeout is
chosen in a shell script that runs the Python script that actually
generates the configuration and runs the build.

So let's say that I'll reduce the KCONFIG_PROBABILITY on one side, and
increase the timeout for all builds by an hour on the other side. How
does that look?

>  It would of course be even better if the autobuilder would calculate the
> timeout based on historical information from build-time.log, but I guess
> that's a bit too ambitious :-)

Hmmm, sounds fun! But I'd prefer to keep the autobuilder logic smaller
in size than Buildroot itself, if possible :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
