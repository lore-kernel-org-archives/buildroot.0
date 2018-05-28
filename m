From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 17:21:58 +0200
Subject: [Buildroot] [PATCH-NEXT 2/2] chrony: S49chrony: drop
 /etc/chrony.conf check
In-Reply-To: <20180528132258.13860-2-peter@korsgaard.com>
References: <20180528132258.13860-1-peter@korsgaard.com>
 <20180528132258.13860-2-peter@korsgaard.com>
Message-ID: <20180528172158.6828b1bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 May 2018 15:22:58 +0200, Peter Korsgaard wrote:
> With CHRONY_ARGS in /etc/default/chrony, chrony may asked to use an
> alternative configuration file (with the -f option), so drop the explicit
> /etc/chrony.conf check.
> 
> In case the configuration file isn't present chrony will anyway loudly
> complain which is preferable to this silent failure:
> 
> chronyd -f /non/existing/file.conf
> Could not open configuration file /non/existing/file.conf : No such file or directory
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I really hate those stupid checks, they cause more harm than good. So
it's great to remove those checks.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
