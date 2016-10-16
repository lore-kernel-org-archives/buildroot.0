From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 13:13:05 +0200
Subject: [Buildroot] [PATCH] gzip: force shell shebang to /bin/sh
In-Reply-To: <20161015211411.810-1-arnout@mind.be>
References: <20161015211411.810-1-arnout@mind.be>
Message-ID: <20161016131305.781a727f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 23:14:11 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> gzip's configure uses $SHELL to find a POSIX-compliant shell to put in
> the shebang of its shell scripts (zcat, gzexe, ...). However, we set
> $SHELL to /bin/bash in the Makefile, which may not be present on the
> target. We do make sure that /bin/sh always points to a valid shell on
> the target so we can use that.
> 
> The configure discovery is completely broken for cross-compilation. The
> same $SHELL is used during the build (it is used by make to run the
> commands in rules) and on the target. Also, the checks for a valid
> shell use the host shell, not the target shell.
> 
> We could try to patch gzip to fix that, but the checks can anyway not
> be run for the target shell, so we'll have to override it with a cache
> value anyway. So we can just as well do exactly that, without patching.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reported-by: Pascal Speck <kernel@iktek.de>
> ---
>  package/gzip/gzip.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
