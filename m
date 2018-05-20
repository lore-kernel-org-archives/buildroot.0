From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:31:55 +0200
Subject: [Buildroot] [PATCH 2/4] package/transmission: fix systemd
 support
In-Reply-To: <20180502060540.11628-2-bernd.kuhls@t-online.de>
References: <20180502060540.11628-1-bernd.kuhls@t-online.de>
 <20180502060540.11628-2-bernd.kuhls@t-online.de>
Message-ID: <20180520153155.1af6c039@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 08:05:38 +0200, Bernd Kuhls wrote:
> Patch 0005-libsystemd.patch backports an upstream commit which renames
> the systemd configure option.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/transmission/transmission.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

The order of the patches in your patch series is not very good. Indeed,
patches 2/4, 3/4 and 4/4 are fixing problems that exist *today* in
Buildroot, with the current version of transmission being packaged.
Therefore, they should appear first in the series, before the bump.

This is even more relevant right now, as patches 2/4, 3/4 and 4/4
should be applied to master, while patch 1/4 is only for next.

So, I've applied this patch to master, after fixing the commit log to
mention 0006-libsystemd.patch, since the patch is named this way in
master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
