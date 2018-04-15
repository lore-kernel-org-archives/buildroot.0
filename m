From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:14:03 +0200
Subject: [Buildroot] [PATCH] sqlite: avoid use of unsupported -Ofast
 CFLAGS
In-Reply-To: <1523650954-23449-1-git-send-email-joshua.henderson@microchip.com>
References: <1523650954-23449-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180415221403.533eae86@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Apr 2018 13:22:34 -0700, Joshua Henderson wrote:
> sqlite3 refuses to be built with -ffast-math (a side effect of -Ofast) when it
> falls back to implementing its own isnan() function.
> 
> sqlite3.c: In function ?sqlite3IsNaN?:
> sqlite3.c:28554:3: error: #error SQLite will not work correctly with the -ffast-math option of GCC.
> 
> To work around this, when -Ofast is used replace with -O3.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>  package/sqlite/sqlite.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
