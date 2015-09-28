From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 22:50:44 +0200
Subject: [Buildroot] [PATCH] Fix musl-based builds on ARMhf platforms.
In-Reply-To: <1443361702-27612-1-git-send-email-vicencb@gmail.com>
References: <1443361702-27612-1-git-send-email-vicencb@gmail.com>
Message-ID: <20150928225044.19e13433@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Bergas,

On Sun, 27 Sep 2015 14:48:22 +0100, Vicente Bergas wrote:
> When ARCH is arm and the hard-floating-point option is on executables
> expect to find the dynamic linker at /lib/ld-musl-armhf.so.1 and not
> /lib/ld-musl-arm.so.1
> There are two ways of fixing this:
>  1) Changing the actual location of the dynamic linker.
>  2) Changing the expected location of the dynamic linker.
> This patch uses option 1.
> I don't know how to do option 2 and also don't know which option is better.
> 
> Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 2 ++
>  1 file changed, 2 insertions(+)

I've slightly tweaked the commit log and applied. In fact your
explanation about "two ways of fixing this" is not completely correct:
the dynamic linker in musl is part of the C library itself. So all what
Buildroot is doing is create a symbolic link with the name of the
dynamic linker encoded into the executables, which points to the musl C
library. So all what your patch is doing is adjusting the logic that
calculates the name of this symbolic link.

Thanks for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
