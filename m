From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Jul 2020 10:05:14 +0200
Subject: [Buildroot] [PATCH] initscripts: Make installation of
 S20urandom optional.
In-Reply-To: <20200718224444.2748609-1-christoph.muellner@theobroma-systems.com>
References: <20200718224444.2748609-1-christoph.muellner@theobroma-systems.com>
Message-ID: <20200719100514.618894ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christoph,

On Sun, 19 Jul 2020 00:44:44 +0200
christoph.muellner at theobroma-systems.com wrote:

> From: Christoph M?llner <christoph.muellner@theobroma-systems.com>
> 
> S20urandom is a nice script. However, there are systems, which
> cannot make use of that script for some reasons (e.g. systems that
> only have read-only partitions).
> 
> So let's install S20urandom only if configured to do so
> (with default y to keep backwards-compatibility).
> 
> Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>

Hm, indeed it saves to /var/lib/random-seed, which we do not seem to
symlink to a tmpfs place when the rootfs is read-only. I'm not entirely
sure we want to add yet another option for this, or if we want to fix
it so that it "works" even in read-only rootfs scenarios. I don't have
a very clear opinion on how to handle that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
