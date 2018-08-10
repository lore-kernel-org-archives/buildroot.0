From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 22:32:17 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/Makefile.in: Do not use
 CPPFLAGS for hardening options
In-Reply-To: <1531998123-28360-2-git-send-email-stefan.sorensen@spectralink.com>
References: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
 <1531998123-28360-2-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20180810223217.21bcb66f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 13:02:01 +0200, Stefan S?rensen wrote:
> The hardening options are compiler flags, not pure pre-processor flags, so
> put them in CFLAGS, not CPPFLAGS.
> 
> This fixes build errors where -D_FORTIFY_SOURCE=2 whas put in CPPFLAGS and
> then applied to configure tests which could fail since the required -O2 is
> only in CFLAGS.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

I have applied this patch, from the series resent by Matt Weber.

See:
https://git.buildroot.org/buildroot/commit/?h=next&id=d4f5801027f3329fb6c2cd096f3396d3cd067390

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
