From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 22:27:29 +0200
Subject: [Buildroot] [RFC v1 2/2] libdrm: change to meson build system
In-Reply-To: <20180713205801.25976-2-ps.report@gmx.net>
References: <20180713205801.25976-1-ps.report@gmx.net>
 <20180713205801.25976-2-ps.report@gmx.net>
Message-ID: <20180714222729.00517695@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Jul 2018 22:58:01 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - convertion from "LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'"
>     is missing (maybe meson gets it right (?) or use LIBDRM_MESON_CFLAGS
>     to force it)

With all those packages migrating to meson, would it be possible to
look at removing some dependencies from host-ninja/host-meson ? Right
now, host-ninja forces to build a Python interpreter, either
host-python or host-python3, and then host-meson forces to build
host-python3.

If Ninja is compatible with both Python 2 and Python 3, why can't we
use the system-provided Python interpreter rather than building our
own ?

Does Meson absolutely needs a Python 3 interpreter ?

Meson allows faster builds than autoconf/automake, but in practice, for
a simple build with just a few packages, if one of them uses Meson,
then the build is actually slower due to the need to build
host-python3, and maybe even host-python, as that's what host-ninja
defaults to.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
