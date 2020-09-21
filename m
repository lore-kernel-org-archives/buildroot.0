From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 22:43:37 +0200
Subject: [Buildroot] [PATCH] package/busybox/udhcpc.script: support
 RFC3442 static routes
In-Reply-To: <20200921162002.22197-1-peter@korsgaard.com>
References: <20200921162002.22197-1-peter@korsgaard.com>
Message-ID: <20200921224337.6b52eef9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Sep 2020 18:20:02 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> RFC3442 specifies a DHCP extension to provide the client with a list of
> static routes to use.  This is already handled by udhcpc and exposed as the
> "staticroutes" environment variable, but currently not handled by the action
> script.
> 
> Extend the script to do so.  The RFC specifies that if this option is
> provided by the server then the normal "routes" (3) option should be
> ignored, so ensure that is done.
> 
> As we may now have more than just a default route on the interface, extend
> the route cleanup logic to handle all routes for the interface (except for
> the implied local 0.0.0.0 one).
> 
> Notice that this option is only sent by servers if explicitly requested by
> the client, E.G.  using the -O staticroutes option to udhcpc.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/busybox/udhcpc.script | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
