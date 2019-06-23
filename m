From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 20:58:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build without
 cairo-svg
In-Reply-To: <20190623185232.61138-1-james.hilliard1@gmail.com>
References: <20190623185232.61138-1-james.hilliard1@gmail.com>
Message-ID: <20190623205807.02d2cd3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 12:52:32 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> test-ot-color.cc:40:10: fatal error: cairo-svg.h: No such file or directory
>    40 | #include <cairo-svg.h>
>       |          ^~~~~~~~~~~~~
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Hum, we fixed the same build issue with:

  https://git.buildroot.org/buildroot/commit/?id=ced273e4f1a0048319441a01be367c0bb65f6a2d

But probably your change is better, if the SVG dependency is in fact
not really needed ?

Fabrice, could you look at James patch and tell what you think ?

James: such patches should contain a reference to the autobuilder
failure it's fixing, like this:

Fixes:

  http://autobuild.buildroot.org/results/.../

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
