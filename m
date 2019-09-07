From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 15:04:08 +0200
Subject: [Buildroot] [PATCH] package:gmp: enable C++ support when
 BR2_INSTALL_LIBSTDCPP=y
In-Reply-To: <1567690842-33954-1-git-send-email-gwenj@trabucayre.com>
References: <1567690842-33954-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20190907150408.1fb6b015@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  5 Sep 2019 15:40:40 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> gmp has a optional and disable by default, option to add C++ support.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

The correct prefix in the commit title is "package/gmp:", not
"package:gmp:".

> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +GMP_CONF_OPTS += --enable-cxx
> +endif

We like to have an explicit --disable-cxx in an else clause.

I fixed both issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
