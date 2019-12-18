From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:26:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/tcping: update the upstream URL
 in Config.in
In-Reply-To: <20191218132736.8052-1-mark@dibsco.co.uk>
References: <20191218132736.8052-1-mark@dibsco.co.uk>
Message-ID: <20191218232627.5d977ac3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

On Wed, 18 Dec 2019 13:27:36 +0000
Mark Corbin <mark@dibsco.co.uk> wrote:

> Update the upstream URL in the help text in Config.in. This
> addresses the 'Invalid(Err)' URL status in the package stats
> web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/tcping/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tcping/Config.in b/package/tcping/Config.in
> index e72df096c3..241561ce10 100644
> --- a/package/tcping/Config.in
> +++ b/package/tcping/Config.in
> @@ -11,4 +11,4 @@ config BR2_PACKAGE_TCPING
>  	  desired port is reachable and then start connection
>  	  establishment.
>  
> -	  http://linuxco.de/tcping/tcping.html
> +	  https://web.archive.org/web/20171102193822/linuxco.de/tcping/tcping.html

The tcping we have in Buildroot, in version 1.3.5 is from Marc
Kirchner, and he now has a Github at
https://github.com/mkirchner/tcping, where he has both the 1.3.5 and
even a newer 1.3.6 release.

So it seems like the best course of action for this package is to
switch to using this Github repository as the upstream (and of course
not just update Config.in, but also the .mk file and the version).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
