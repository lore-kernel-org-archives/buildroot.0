From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 22:11:45 +0200
Subject: [Buildroot] [PATCH] chrony: backport upstream patch to fix
 blocking on getrandom() at startup with recent kernels
In-Reply-To: <20180809155728.22817-1-peter@korsgaard.com>
References: <20180809155728.22817-1-peter@korsgaard.com>
Message-ID: <20180809221145.701a9bb2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Aug 2018 17:57:28 +0200, Peter Korsgaard wrote:
> chrony calls getrandom() at startup if available, so it needs a workaround
> for the blocking behaviour on recent (4.14.39+), similar to what was done
> for util-linux in commit c4d86707cd6 (util-linux: add two upstream patches
> to fix blocking on getrandom() with recent kernels).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...ack-to-reading-dev-urandom-when-getrandom.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/chrony/0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
