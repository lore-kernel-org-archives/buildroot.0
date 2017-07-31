From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:34:33 +0200
Subject: [Buildroot] [PATCH] squashfs: fix build with gcc 7
In-Reply-To: <51890a64ced8a223b72a52bdb0e98fc31f539a30.1501007295.git.baruch@tkos.co.il>
References: <51890a64ced8a223b72a52bdb0e98fc31f539a30.1501007295.git.baruch@tkos.co.il>
Message-ID: <20170731193433.7eb92d7d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Jul 2017 21:28:15 +0300, Baruch Siach wrote:
> gcc 7 with -Os (optimize for size) takes the liberty to remove the code of
> inline function entirely. This leads to undefined function references at link
> time. Restore gcc original inline behaviour to fix this issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3c5/3c5b1d799dce3ba361d618330c242bf4eba76019/
> http://autobuild.buildroot.net/results/09f/09f350b62e2486404b78222dce211400bb233000/
> http://autobuild.buildroot.net/results/693/693960ed7c01622c756dcc929e83b3b713c16ccc/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> The gcc doc[1] doesn't mention that feature of C99. A gcc bug, maybe?

Applied to master, thanks. To be honest, I hesitated between your
proposal and patching the mksquashfs.c code, but OK, I went with your
solution.

Can you send a patch upstream that removes the "inline" or switches
them to "static inline" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
