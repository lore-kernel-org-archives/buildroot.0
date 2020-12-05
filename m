From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:45:40 +0100
Subject: [Buildroot] [PATCH 2/2] package/quickjs: depends on glibc
In-Reply-To: <20201205064442.606683-2-francois.perrad@gadz.org>
References: <20201205064442.606683-1-francois.perrad@gadz.org>
 <20201205064442.606683-2-francois.perrad@gadz.org>
Message-ID: <20201205214540.7448387d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Dec 2020 07:44:42 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> fix build http://autobuild.buildroot.org/results/d45/d456eefffd138a714e367f9520adb662f5e0f57e/

Well, this configuration *is* using glibc, so clearly the patch you're
proposing cannot fix this build failure.

stdatomic.h is provided by gcc, not by the C library, so a C library
option change most likely cannot be the proper solution.

We already have several atomic-related options in toolchain/Config.in,
but I'm not sure any of them is correct to express the need for
<stdatomic.h>. In fact, I'm not quite sure in which circumstances is
this header not provided by gcc.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
