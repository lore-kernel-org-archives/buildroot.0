From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 12:37:58 +0200
Subject: [Buildroot] [PATCH] toolchain-external: trivial clean up of
 messages
In-Reply-To: <1442005078-17556-1-git-send-email-arnout@mind.be>
References: <1442005078-17556-1-git-send-email-arnout@mind.be>
Message-ID: <20150913123758.2a781303@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Fri, 11 Sep 2015 22:57:58 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Before this commit, the output of the toolchain-external build steps
> looked like this (abbreviated for clarity):
> 
> >>> toolchain-external undefined Building
> >>> toolchain-external undefined Installing to staging directory
> >>> toolchain-external undefined Copying external toolchain sysroot to staging...
> >>> toolchain-external undefined Building ext-toolchain wrapper
> mkdir -p output/host/usr/bin; cd output/host/usr/bin; for i in ...
> /usr/bin/gcc -O2 -Ioutput/host/usr/include -DBR_SYSROOT='...
> if test -f output/host/usr/bin/i686-pc-linux-gnu-gdb ; then mkdir -p ...
> >>> toolchain-external undefined Fixing libtool files
> >>> toolchain-external undefined Installing to target
> >>> toolchain-external undefined Copying external toolchain libraries to target...
> if test -e output/target/lib/ld-uClibc.so.1; then ln -sf ld-uClibc.so.1 output/target/lib/ld-uClibc.so.0 ; fi
> if test -e output/target/lib/ld64-uClibc.so.1; then ln -sf ld64-uClibc.so.1 output/target/lib/ld64-uClibc.so.0 ; fi
> 
> All the long lines with conditions and loops in them are not usefull,
> so put $(Q) in front of them. The line with mkdir can better be split
> on a separate line so the cd stands out more. There are two redundant
> semicolons that can be removed. The installation of gdbinit could
> use an extra message so the user can see what is going on.
> 
> After this commit, the toolchain-external build steps look like this:
> >>> toolchain-external undefined Building
> >>> toolchain-external undefined Installing to staging directory
> >>> toolchain-external undefined Copying external toolchain sysroot to staging...
> >>> toolchain-external undefined Building ext-toolchain wrapper
> /usr/bin/gcc -O2 -Ioutput/host/usr/include -DBR_SYSROOT='...
> >>> toolchain-external undefined Installing gdbinit
> >>> toolchain-external undefined Fixing libtool files
> >>> toolchain-external undefined Installing to target
> >>> toolchain-external undefined Copying external toolchain libraries to target...
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
