From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 09:15:28 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: fix AM_PATH_LIBGCRYPT not found
In-Reply-To: <20140611213246.GC27579@free.fr>
References: <1402521982-31067-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140611213246.GC27579@free.fr>
Message-ID: <20140612091528.6d8f0c76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 11 Jun 2014 23:32:46 +0200, Yann E. MORIN wrote:

> OK, so let me sum up the thing:
>   - we can't use autoreconf because of 'ln --relative' which is not
>     available everywhere
>   - if we could use autoreconf, we would not need this gcrupt.m4 stuff

No, the opposite. We need to autoreconf to be able to patch our the 'ln
--relative' calls. And to be able to autoreconf, we need this
libgcrypt.m4 stuff.

To me, hacking around the 'ln --relative' problem is not a proper
solution. Because the next time we need a patch for systemd that
requires autoreconf (like if we backport a fix from upstream or another
change), then we will be back to the current situation where autoreconf
cannot be done with libgcrypt.m4.

So I agree with the solution proposed by Eric here to bundle the
libgcrypt.m4 file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
