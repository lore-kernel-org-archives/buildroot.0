From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 14:16:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/polkit: bump version to 1.105
In-Reply-To: <20180801074108.8926-1-apanfilov@spectracom.com>
References: <20180801074108.8926-1-apanfilov@spectracom.com>
Message-ID: <20180801141630.1afe4809@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Artem,

On Wed,  1 Aug 2018 10:41:08 +0300, Artem Panfilov wrote:
> Fixes build issue with network-manager package when polkit package is
> enabled.
> 
> Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
> ---
>  package/polkit/polkit.hash | 2 +-
>  package/polkit/polkit.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I've applied to master. However, your change to the .hash file was
wrong, and it couldn't build with it:

ERROR: No hash found for polkit-0.105.tar.gz
make[1]: *** [package/pkg-generic.mk:138: /home/thomas/projets/buildroot/output/build/polkit-0.105/.stamp_downloaded] Error 1
make: *** [Makefile:79: _all] Error 2

Indeed, you changed the hash, but not the name of the tarball.

I've fixed that up, and also extended the commit log with more details.

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
