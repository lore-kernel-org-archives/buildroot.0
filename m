From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Feb 2012 23:19:17 +0100
Subject: [Buildroot] [PATCH v2] mdev.conf: Add ttyO devices
In-Reply-To: <1325564832-3149-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Mon, 2 Jan 2012 23:27:12 -0500")
References: <1325564832-3149-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87mx92ci3e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 Frank> This is needed to support the serial ports on OMAP/AM335x devices
 Frank> when using mdev.

 Frank> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 Frank> ---
 Frank>  package/busybox/mdev.conf |    1 +
 Frank>  1 files changed, 1 insertions(+), 0 deletions(-)

 Frank> diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
 Frank> index 247c0ed..7fb71bc 100644
 Frank> --- a/package/busybox/mdev.conf
 Frank> +++ b/package/busybox/mdev.conf
 Frank> @@ -20,6 +20,7 @@ tty		root:tty 666
 Frank>  tty[0-9]*	root:tty 660
 Frank>  vcsa*[0-9]*	root:tty 660
 Frank>  ttyS[0-9]*	root:root 660
 Frank> +ttyO[0-9]*	root:root 660

What does this exactly do? Isn't root:root / perm 660 default anyway?

-- 
Bye, Peter Korsgaard
