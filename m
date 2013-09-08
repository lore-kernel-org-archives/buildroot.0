From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Sep 2013 22:45:19 +0200
Subject: [Buildroot] [PATCH v3 1/1] change package tarball compression
	to xz whenever possible
In-Reply-To: <1378448055-3056-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Fri, 6 Sep 2013 08:14:15 +0200")
References: <1378448055-3056-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <87a9jnxctc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 Jerzy> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 Jerzy> ---
 Jerzy> v3
 Jerzy> - actualization (some package tarballs have been changed in the mean time)

 Jerzy> v2
 Jerzy> - usbutils.mk has been changed in the mean time
 Jerzy> - zlib tarball has already been changed to xz

 Jerzy> --- a/package/xz/xz.mk
 Jerzy> +++ b/package/xz/xz.mk
 Jerzy> @@ -5,7 +5,7 @@
 Jerzy>  ################################################################################
 
 Jerzy>  XZ_VERSION = 5.0.4
 Jerzy> -XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 Jerzy> +XZ_SOURCE = xz-$(XZ_VERSION).tar.xz

That's no good with the recent xzcat change (xzcat: treat as host
prerequisite and build if needed) as we then need xzcat to extract the
tarball to build xzcat.

Committed without this change, thanks.

-- 
Bye, Peter Korsgaard
