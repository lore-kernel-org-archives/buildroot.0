From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 May 2019 21:36:02 +0200
Subject: [Buildroot] [PATCH 1/2] meson: add entry for libgcrypt-config
 in cross file
In-Reply-To: <25be7377-dabe-41b6-68b3-f9d2a2537aad@mind.be>
References: <20190403183202.19682-1-joerg.krause@embedded.rocks>
 <20190413182422.7e8f5f22@windsurf>
 <20190423232944.70aeddba@gmx.net>
 <6f5eef5542a44d775baa396c7fa7c01a2e6e2c4d.camel@embedded.rocks>
 <trinity-a5fd1873-52f7-4d2a-9195-2a9713d0b83a-1556612829462@3c-app-gmx-bs70>
 <2e75711ff4c34669fce6f86c50b34897d92ecb76.camel@embedded.rocks>
 <25be7377-dabe-41b6-68b3-f9d2a2537aad@mind.be>
Message-ID: <20190501213602.323f22eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 May 2019 13:13:03 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> - I don't think it's appropriate to generate the cross-compilation.conf file in
>  PKG_BUILDDIR. I think it should be at top level, i.e. $(@D).

I'd say it depends the $(@D) of which step. Indeed, in the (admittedly
long term) perspective of per-package out-of-tree build, the source
tree would be shared between the host and target builds of a given
package, and this cross-compilation.conf file would only make sense for
the target variant of the package, and therefore it should be in the
build directory of the target variant.

So, if this file is generated during the "configure" step, we are good,
because $(@D) will point to the build directory. If it's generated in
an earlier step, $(@D) points to the source directory (with per-package
out-of-tree build implemented, of course).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
