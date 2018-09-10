From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 22:55:18 +0200
Subject: [Buildroot] [PATCH 4/5] core/download: add per-download timeout
In-Reply-To: <ae42dac572665985954d708489bb5474ccae3edc.1534972250.git.yann.morin.1998@free.fr>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
 <ae42dac572665985954d708489bb5474ccae3edc.1534972250.git.yann.morin.1998@free.fr>
Message-ID: <20180910225518.3ae7dfb3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 23:10:57 +0200, Yann E. MORIN wrote:
> In case an remote sitre is slow, or hangs for whatever reasons, of the

an remote sitre -> a remote site


> +    if [ -n "${timeout}" ]; then
> +        # Timeout after the specified delay; additionaly, leave
> +        # 30 more seconds for the backend to properly terminate
> +        # (e.g. to cleanup behind itself), after which forcibly
> +        # kill the backend.
> +        timeout_cmd="timeout --kill-after=30s ${timeout}"

What happens if 30 seconds are not enough for the cleanup ? I suppose
we already handle that (as we can already interrupt the build at any
point), and the next build will already clean up whatever mess what left
behind. If that's indeed the case, then the --kill-after=30s looks a
bit useless, we should just abort the download and move on with the
next step. Indeed, saying "30 seconds should be enough" sounds like
saying "640 KB of memory should be enough" :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
