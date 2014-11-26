From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:01:46 +0100
Subject: [Buildroot] [PATCH] autobuild-run: disable gdb &
 conntrack-tools for non-working toolchains
In-Reply-To: <1417003285-8983-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417003285-8983-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141126220146.7c3c9535@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 26 Nov 2014 12:01:25 +0000, Vicente Olivert Riera wrote:
> This MIPS uClibc toolchain doesn't have the needed fix in order to build
> gdb and conntrack-tools packages statically for uClibc. It fails with
> messages like these ones:
> 
> libdl.c:(.text+0x1840): undefined reference to `TLS_DTPREL_VALUE'
> libdl.c:(.text+0x1884): undefined reference to `TLS_TPREL_VALUE'
> 
> This is due to certain missing fixes in uClibc, as built by
> Crosstool-NG.
> 
> Related:
>   http://lists.uclibc.org/pipermail/uclibc/2013-April/047708.html
>   http://git.buildroot.net/buildroot/commit/?id=c0b4c45780e4ffe23101a407e7c4cde22e27815a
> 
> Fixes:
>   http://autobuild.buildroot.net/results/77e/77e5f95ec4f0b3284eb7a48b8152690f8bf81a2a/
>   http://autobuild.buildroot.net/results/977/977d901c500074a6b26f331ae43808bafab58239/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  scripts/autobuild-run | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
