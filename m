From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Dec 2018 09:30:17 +0100
Subject: [Buildroot] [PATCH] swupdate: pass full TARGET_CONFIGURE_OPTS
In-Reply-To: <20181217234301.7111-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 18 Dec 2018 00:43:01 +0100")
References: <20181217234301.7111-1-arnout@mind.be>
Message-ID: <8736qv2q5i.fsf@dell.be.48ers.dk>
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

Hmm, wait - This also passes LD="$(TARGET_LD)", whereas swupdate used CC
to link. Is that really working?

-- 
Bye, Peter Korsgaard
