From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:55:29 +0200
Subject: [Buildroot] [PATCH] package/dhcp: install shared libraries
In-Reply-To: <20190809022759.8601-1-unixmania@gmail.com>
References: <20190809022759.8601-1-unixmania@gmail.com>
Message-ID: <20190809225529.44ca0fb7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  8 Aug 2019 23:27:59 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> We don't use "make install" for target installation because we build all
> utilities (server, relay, client) but install only the selected ones.
> 
> The utilities, however, require the shared libraries to work, so use the
> "install-exec" make target to install them. This also installs static
> libraries but they are removed later by target-finalize.
> 
> With this change the omshell utility is installed if server is selected.
> We keep it, since it is small and may be useful at run-time.
> 
> Fixes:
>   https://bugs.busybox.net/show_bug.cgi?id=12086
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/dhcp/dhcp.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
