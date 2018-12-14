From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:44:06 +0100
Subject: [Buildroot] [PATCH] package/eudev: fix build with kernel < 3.11
In-Reply-To: <20181211071859.19451-1-eric.le.bihan.dev@free.fr>
References: <20181211071859.19451-1-eric.le.bihan.dev@free.fr>
Message-ID: <20181214224406.7f2f3837@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Dec 2018 08:18:59 +0100, Eric Le Bihan wrote:
> As explained in issue 6267 of systemd [1], Linux < 3.11 does not provide
> definitions for BTN_DPAD_{UP,RIGHT}, which were introduced in [2].
> 
> So, add a patch to fix this issue.
> 
> [1] https://github.com/systemd/systemd/pull/6267
> [2] https://github.com/torvalds/linux/commit/9ee27487127461b5cf71670b708ed5b2b8da568c
> 
> Fixes:
> 
> - http://autobuild.buildroot.net/results/e9d94084be8ed3296ba63cffdb9d69ffcc3b7140/
> - http://autobuild.buildroot.net/results/d9c5ec07bfbde1fab62991bb509c2f90af1cb3f4/
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  .../0003-missing.h-add-BTN_DPAD_UP.patch      | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/eudev/0003-missing.h-add-BTN_DPAD_UP.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
