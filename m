From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:41:16 +0200
Subject: [Buildroot] [PATCH 3 of 3 v3] pkgconf: don't double prefix
 lib/include paths with sysroot
In-Reply-To: <5aefddc71a6fc227c718.1403362909@localhost>
References: <patchbomb.1403362906@localhost>
 <5aefddc71a6fc227c718.1403362909@localhost>
Message-ID: <20140629124116.033bfeb8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sat, 21 Jun 2014 17:01:49 +0200, Thomas De Schampheleire wrote:
> A .pc file could contain statements of the form:
>     -L/usr/lib
> but also:
>     -L/path/to/sysroot/usr/lib
> 
> The latter form typically occurs when the dependency was configured with a
> statement like --with-xxx=$(STAGING_DIR)/usr.
> 
> pkgconf only expects the first form, and prefixes it with the specified
> sysroot. However, this strategy would result in a double sysroot in the
> second case:
>     -L/path/to/sysroot/path/to/sysroot/usr/lib
> 
> This patch checks for the presence of the sysroot in the specified -L or -I
> directives, and only adds the sysroot when not already present.
> 
> Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
