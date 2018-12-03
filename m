From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 21:27:17 +0100
Subject: [Buildroot] [PATCH 1/2] gnutls: Give library a default trust
 location
In-Reply-To: <20181116201718.22455-1-tpiepho@impinj.com>
References: <20181116201718.22455-1-tpiepho@impinj.com>
Message-ID: <20181203212717.7ada5025@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Nov 2018 20:17:32 +0000, Trent Piepho wrote:
> Gnutls is building with no default location to look for CA certs.  Since
> there are buildroot packages to provide these, configure it to use them
> by default.
> 
> Configure gnutls to find them using the bundle file which contains all
> certs, rather than looking in the cert directory.  When gnutls is told
> to use the directory, it loads *every* file in it.  This means it loads
> the bundle with all certs, then loads each cert a second time using the
> individual pem files, and then loads them all the third time via the
> hash symlinks to the pem files.
> 
> When p11-kit is enabled, use its trust module instead of the bundle
> file.  p11-kit can be configured to use the bundle (the default), but it
> can do other things too, such as integrate with the "trust" command for
> adding and removing trust anchors.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  package/gnutls/gnutls.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
