From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 14:19:25 +0200
Subject: [Buildroot] [PATCH 1/3] systemd: bump to v239
In-Reply-To: <20180629222552.12808-2-jeremy.rosen@smile.fr>
References: <20180629222552.12808-1-jeremy.rosen@smile.fr>
 <20180629222552.12808-2-jeremy.rosen@smile.fr>
Message-ID: <20180701141925.69267e02@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 00:25:50 +0200, J?r?my Rosen wrote:
> * remove upstreamed patches
> * refresh patch 0002 which didn't apply cleanly
> * update patch 0001 to catch more uses of agetty
> 
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/systemd/0001-fix-getty-unit.patch     |  61 ++++--
>  .../0002-install-don-t-use-ln-relative.patch  |  19 +-
>  ...-include-libmount-h-in-a-header-file.patch |  75 -------
>  .../0005-basic-macros-rename-noreturn.patch   | 201 ------------------
>  package/systemd/systemd.hash                  |   2 +-
>  package/systemd/systemd.mk                    |   2 +-
>  6 files changed, 63 insertions(+), 297 deletions(-)
>  delete mode 100644 package/systemd/0004-core-dont-include-libmount-h-in-a-header-file.patch
>  delete mode 100644 package/systemd/0005-basic-macros-rename-noreturn.patch

I've applied, after fixing the issues pointed out by Romain: do not
re-assign the patches to yourself when you're just making some small
adjustements, use "git format-patch -N".

Also, you forgot to update the hash of the README file, which has
changed. That was breaking "make legal-info", so I fixed that.

Finally, I did a follow-up commit dropping the 0003 patch, which as
noted by Romain Naour was no longer needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
