From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Feb 2019 14:57:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/s6-linux-utils: bump to 2.5.0.0
In-Reply-To: <20190130201436.9514-1-patrickdepinguin@gmail.com>
References: <20190130201436.9514-1-patrickdepinguin@gmail.com>
Message-ID: <20190202145704.27115bc9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Jan 2019 21:14:35 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> In 2.4.0.2, compilation under glibc 2.28 is fixed.
> While at it, bump to the latest released version 2.5.0.0.
> 
> From the NEWS file:
> 
> In 2.5.0.0
> ----------
>  - Optional nsss support.
>  - s6-devd, s6-uevent-listener, s6-uevent-spawner removed.
> 
> In 2.4.0.2
> ----------
>  - s6-logwatch rewrite.
>  - Better portability with old glibc versions.
>  - s6-uevent-listener and s6-uevent-spawner are marked as deprecated. (The
>    mdevd package obsoletes them.)
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

This patch seems to be incomplete:

$ make s6-linux-utils-legal-info
s6-linux-utils-2.5.0.0.tar.gz: OK (sha256: 78571574464c76fc623ef50dc14800138b4fd98c5fa877af6850fdd9c2f90213)
>>> s6-linux-utils 2.5.0.0 Extracting
gzip -d -c /home/thomas/dl/s6-linux-utils/s6-linux-utils-2.5.0.0.tar.gz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/s6-linux-utils-2.5.0.0   -xf -
>>> s6-linux-utils 2.5.0.0 Patching

Applying 0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch using patch: 
patching file src/minutils/s6ps_ttycache.c
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file src/minutils/s6ps_ttycache.c.rej
make[1]: *** [package/pkg-generic.mk:198: /home/thomas/projets/buildroot/output/build/s6-linux-utils-2.5.0.0/.stamp_patched] Error 1
make: *** [Makefile:84: _all] Error 2

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
