From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 15:51:27 +0100
Subject: [Buildroot] [PATCH] binutils: improve poison system directory
 support
In-Reply-To: <1432544520-665-1-git-send-email-vapier@gentoo.org>
References: <1432544520-665-1-git-send-email-vapier@gentoo.org>
Message-ID: <20151004155127.4f116556@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike,

On Mon, 25 May 2015 05:02:00 -0400, Mike Frysinger wrote:
> From: Mike Frysinger <vapier@chromium.org>
> 
> I've added support for the gold linker and reworked a bit the system:
> * The command line flags are always available.
> * The flag names are tweaked slightly to match existing flag standards.
> * We can turn on & off the warning via the command line.
> * The configure option controls the default warning behavior.
> 
> This makes it easier for distros to take the patch and drop it into their
> setups.  If they don't pass the configure flag, then it isn't enabled by
> default, and they get the same behavior w/out the patch.  The difference
> is that people can still opt in to the warnings/errors via LDFLAGS.
> 
> Signed-off-by: Mike Frysinger <vapier@chromium.org>
> ---
>  .../2.25/600-poison-system-directories.patch       | 254 +++++++++++++--------
>  1 file changed, 154 insertions(+), 100 deletions(-)

We are in fact going to drop our binutils/gcc poison detection patches,
since we are moving to generalizing the toolchain wrapper to be also
used in the internal toolchain case. Since the wrapper already does the
poisoning detection, there will no longer be a point to have such
gcc/binutils patches in Buildroot.

Consequently, I've marked your patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
