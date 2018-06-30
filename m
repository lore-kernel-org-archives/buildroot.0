From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:11:31 +0200
Subject: [Buildroot] [PATCH] package/heimdal: fix build when the host
 has some DB libs
In-Reply-To: <20180630070310.16596-1-yann.morin.1998@free.fr>
References: <20180630070310.16596-1-yann.morin.1998@free.fr>
Message-ID: <20180630181131.25ef2984@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 09:03:10 +0200, Yann E. MORIN wrote:
> When the host has a DB library installed, namely LMDB, host-heimdal
> will detect it and try to use, resulting in a build failure due to
> missing symbols.
> 
> Really disable all the DB backends, we don't need them.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/heimdal/heimdal.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
