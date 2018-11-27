From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Nov 2018 11:35:57 +0100
Subject: [Buildroot] [PATCH] strace: don't remove strace-graph
 unconditionally
In-Reply-To: <e86fb4b00011e29c62871b0386b09af09939badd.1543313816.git.baruch@tkos.co.il>
References: <e86fb4b00011e29c62871b0386b09af09939badd.1543313816.git.baruch@tkos.co.il>
Message-ID: <20181127113557.2299b963@windsurf.home>
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

Would be nice to enclose the STRACE_REMOVE_STRACE_GRAPH function into
the condition. No need to resend just for that, it can be fixed when
applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
