From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 14:40:11 +0200
Subject: [Buildroot] [PATCH] package/brltty: fix cross-compilation
In-Reply-To: <20180822082832.7497-1-yann.morin.1998@free.fr>
References: <20180822082832.7497-1-yann.morin.1998@free.fr>
Message-ID: <20180825144011.20ed76af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 10:28:32 +0200, Yann E. MORIN wrote:
> brltty has a very inventive buildsystem, where it internall runs
> ./configure for the build machine In doing so, it generates a list
> of make variables to define what the build machine supports, like
> it does for the target.
> 
> However, the build variables are generated with a convoluted sed
> script that scans the target list, and appends _FOR_BUILD to each
> target variables. Then, both lists are included from the Makefile,
> on the assumption that the build variables will not clash with the
> target variables.
> 
> Where it gets interesting, is that that sed script considers the
> variables names to match '[A-Za-z][A-Za-z0-9_]*'
> 
> And there we see why ATSPI2_PACKAGE does not match: it contains a
> digit.
> 
> So, some build variables will inevitably override target ones.
> 
> Fix that by simply expanding the matching regexp to allow digits
> in variable names.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/a37/a37782b3cfc1a96cc129db8fade20a36a7b2d470/
>     http://autobuild.buildroot.org/results/97e/97edc6a47d2140968e84b409cdc960604e5896f2/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Mario Lang <mlang@blind.guru>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0004-buildsys-fix-cross-compilation.patch      | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/brltty/0004-buildsys-fix-cross-compilation.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
