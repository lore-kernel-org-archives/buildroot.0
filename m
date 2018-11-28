From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 21:54:04 +0100
Subject: [Buildroot] [PATCH] strace: don't remove strace-graph
 unconditionally
In-Reply-To: <e86fb4b00011e29c62871b0386b09af09939badd.1543313816.git.baruch@tkos.co.il>
References: <e86fb4b00011e29c62871b0386b09af09939badd.1543313816.git.baruch@tkos.co.il>
Message-ID: <20181128215404.3e2ddc5e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Nov 2018 12:16:56 +0200, Baruch Siach wrote:
> strace-graph is a perl script. This script is removed unconditionally
> since commit 720c0ca5ba7 ("strace: convert to makefile.autotools.in
> format") from 2008. Since then Buildroot added support for perl on
> target. Don't remove strace-graph when perl is built for target.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/strace/strace.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to next after moving the hook definition inside the condition.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
