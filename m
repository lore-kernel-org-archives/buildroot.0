From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Dec 2018 09:22:20 +0100
Subject: [Buildroot] [PATCH] swupdate: pass full TARGET_CONFIGURE_OPTS
In-Reply-To: <20181217234301.7111-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 18 Dec 2018 00:43:01 +0100")
References: <20181217234301.7111-1-arnout@mind.be>
Message-ID: <87bm5j2qir.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Although we set CONFIG_CROSS_COMPILE to TARGET_CROSS in swupdate's
 > .config file, swupdate's build system just appends 'cc' to it, not
 > 'gcc'. Some external toolchains don't provide a cc -> gcc symlink,
 > leading to errors like:

 > /bin/sh: .../host/bin/arm-none-linux-gnueabi-cc: No such file or directory

 > We can just pass TARGET_CONFIGURE_OPTS which explicitly sets CC=, like
 > we do for all other packages.

 > Although this makes setting CONFIG_CROSS_COMPILE redundant, it's nice to
 > keep it as well for consistency.

 > Fixes:
 > http://autobuild.buildroot.net/results/e302d0edb59ff7617b5f2d21f06eb65ae04981fe
 > http://autobuild.buildroot.net/results/dbb69acadc20b4bb559311348eca276c1e6343f7

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

Do we still want https://patchwork.ozlabs.org/patch/1014334/ to handle
similar issues in other packages?

-- 
Bye, Peter Korsgaard
