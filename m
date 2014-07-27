From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 16:13:09 +0200
Subject: [Buildroot] [PATCH 0/9 v3] Cleanups in download helpers (branch
 yem/check-downloads)
In-Reply-To: <cover.1405895896.git.yann.morin.1998@free.fr>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
Message-ID: <20140727161309.5ed9ad32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Jul 2014 00:42:22 +0200, Yann E. MORIN wrote:

> This series is a follow-up to the previous download series. Following
> the advice from Arnout, I introduced a wrapper script that is responsible
> for the saving atomically in BR2_DL_DIR. If also manages all the temporary
> files, and properly cleans up.
> 
> Consequently, the helpers are now nuch more simple, and no longer need to
> duplicate the complex handling of atomicity in BR2_DL_DIR, nor do they
> need to manage temporary files.

In principle, it certainly looks good. I'm just wondering if we really
need the separate scripts for each of the download methods, since they
do just one command basically. What about a single
support/scripts/download-helper script, which does the common stuff +
contains a switch to call the appropriate sub-functions for each
download method?

What do others think? Could some others test the patch series and give
their feedback?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
