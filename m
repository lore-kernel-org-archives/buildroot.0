From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:33:40 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: do not rely on package's
 .config as a timestamp
In-Reply-To: <20190530180909.14418-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 30 May 2019 20:09:09 +0200")
References: <20190530180909.14418-1-yann.morin.1998@free.fr>
Message-ID: <87zhmug23v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since linux-4.19, the kernel's build system internally touches its
 > .config file.

 > However, we currently used that file as a timestamp to detect whether
 > our kconfig fixups were to be (re)applied or not, which in turn is used
 > to decide whether we should (re)build the package or not.

 > But with latest kernel versions, this timestamp heuristic is now broken,
 > and we always rebuild the kernel on subsequent builds.

 > We fix that by introducing a spearate timestamp file of our own, which
 > we know the kernel (or the kconfig-based packages, for that matters)
 > does not use.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
