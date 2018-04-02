From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 14:13:27 +0200
Subject: [Buildroot] [v4 08/13] pkg-download: support new subdir for
 mirrors
In-Reply-To: <20180402081434.4411-8-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
 <20180402081434.4411-8-maxime.hadjinlian@gmail.com>
Message-ID: <20180402141327.328775df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Apr 2018 10:14:29 +0200, Maxime Hadjinlian wrote:
> Since we introduced subdirectory to the DL_DIR, we need to support them
> in the PRIMARY and BACKUP mirror as they evolve to the new tree
> structure.
> 
> We check first the new URI (with the subdir), and in case of failure, we
> go check without.
> By checking both URIs, we ensure that old mirror are usable.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Shouldn't this be squashed into the previous patch ?

Indeed, as soon as PATCH 07/13 is merged, the sources.buildroot.net
mirror will start storing new tarballs in sources.buildroot.net/<pkg>/
and not directly in sources.buildroot.net/. So we should at the same
time start storing tarballs in the per-package sub-folder *and* start
querying primary/backup site inside their sub-folder.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
