From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 20:32:57 +0100
Subject: [Buildroot] [PATCH] package/rng-tools: make jitterentropy
 conditional
In-Reply-To: <20200205182608.22695-1-matthew.weber@rockwellcollins.com>
References: <20200205182608.22695-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200205203257.48877881@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  5 Feb 2020 12:26:08 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> The update of rng-tools from 5 to 6.7 introduced a change where
> the jitterentropy library was enabled by default instead of
> returning a special 66 return code to hangle the case of no
> hwrng. This patch reverts that change and allows a user to
> select when to enable the jitterentropy source. The bug
> documents an issue of when a hwrng is enabled with jitterentropy
> there is a longer boot time.

I don't understand this story of the 66 return code. Could you explain
a bit more ?

> index 11386d1e5d..c0bcffe59e 100644
> --- a/package/rng-tools/rngd.service
> +++ b/package/rng-tools/rngd.service
> @@ -3,6 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
>  
>  [Service]
>  ExecStart=/usr/sbin/rngd -f $DAEMON_ARGS
> +SuccessExitStatus=66

Will this work even if jitterentropy support is enabled ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
