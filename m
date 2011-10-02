From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Oct 2011 19:12:27 +0200
Subject: [Buildroot] [PATCH] Remove / after $(PKG)_DIR_PREFIX
In-Reply-To: <1317512626-30779-1-git-send-email-arnout@mind.be>
References: <1317512626-30779-1-git-send-email-arnout@mind.be>
Message-ID: <20111002191227.0c1e65cb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun,  2 Oct 2011 01:43:46 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> With the automatic derivation of the package directory, the $(PKG)_DIR_PREFIX
> variable already contains a final /.  Therefore there is no need to have an
> additional / after the uses of this variable.

For the "package: fix bootloader building" patch I posted a few days
ago, I hesitated between :

 * Ensuring that pkgparentdir returns a string with no final /

or

 * Changing the test for bootloaders from "boot" to "boot/".

The latter was the simplest solution, so it's the one I did. But seeing
your patch, I think the former solution would be better, because I
don't really like the fact of not having a / between
$($(PKG)_DIR_PREFIX) and the rest of the path.

I'll rework my pkg-infra-urgent branch to take this into account.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
