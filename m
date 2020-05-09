From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:42:19 +0200
Subject: [Buildroot] [PATCH v1 3/4] package/exfatprogs: fix compile
 failure missing braces around initializer
In-Reply-To: <20200509162117.8728-3-ps.report@gmx.net>
References: <20200509162117.8728-1-ps.report@gmx.net>
 <20200509162117.8728-3-ps.report@gmx.net>
Message-ID: <20200509224219.71f3ed96@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 May 2020 18:21:16 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add upstream commit to fix host package compile failure.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/d9c5d17de03f5d0316d5f54f9cd579b79d311d03
> 
>   fsck.c:1213:9: error: missing braces around initializer [-Werror=missing-braces]
>     struct fsck_user_input ui = {0,};
>            ^
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../0004-fsck-Zero-init-using-memset.patch    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/exfatprogs/0004-fsck-Zero-init-using-memset.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
