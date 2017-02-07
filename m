From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2017 17:46:27 +0100
Subject: [Buildroot] [PATCH 1/1] Added keepalived package
In-Reply-To: <1486484458-8233-2-git-send-email-apalos@gmail.com>
References: <1486484458-8233-1-git-send-email-apalos@gmail.com>
 <1486484458-8233-2-git-send-email-apalos@gmail.com>
Message-ID: <20170207174627.025008a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Feb 2017 18:20:58 +0200, Ilias Apalodimas wrote:
> Signed-off-by: Ilias Apalodimas <apalos@gmail.com>

Thanks for this patch. This looks mostly good, so great for a first
contribution.

A few comments:

 - You don't need to send a series with a cover letter for just a
   single patch. Just send the patch itself.

 - Make a change to the DEVELOPERS file to associate your name/email to
   this package. This way, you'll get notified when/if this package
   fails to build, or when someone sends a patch touching this package.

 - You're missing a hash file. See other packages and the manual for
   the format/details.

> diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
> new file mode 100644
> index 0000000..ee4ab7a
> --- /dev/null
> +++ b/package/keepalived/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_KEEPALIVED
> +	bool "keepalived"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_POPT

Are you sure this builds even for no-MMU platforms, static linking
scenario? It's pretty likely that keepalived uses fork() and therefore
will not work on no-MMU platforms.

Yann E. Morin has just submitted a script today to help checking a
package, you may want to use it. It will be merged soon, which will
make things easier.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
