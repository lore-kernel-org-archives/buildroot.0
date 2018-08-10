From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 22:31:31 +0200
Subject: [Buildroot] [PATCH 1/6] package/Makefile.in: Do not use
 CPPFLAGS for hardening options
In-Reply-To: <20180711143113.11927-2-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-2-matthew.weber@rockwellcollins.com>
Message-ID: <20180810223131.184d075c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Jul 2018 09:31:08 -0500, Matt Weber wrote:
> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> The hardening options are compiler flags, not pure pre-processor flags, so
> put them in CFLAGS, not CPPFLAGS.
> 
> This fixes build errors where -D_FORTIFY_SOURCE=2 whas put in CPPFLAGS and
> then applied to configure tests which could fail since the required -O2 is
> only in CFLAGS.
> 
> Originally submitted as
> http://patchwork.ozlabs.org/patch/904057/
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/Makefile.in | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
