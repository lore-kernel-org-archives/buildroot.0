From: Ralph Siemsen <ralphs@netwinder.org>
Date: Fri, 13 Jul 2007 10:12:13 -0400
Subject: [Buildroot] curl needs more love too
In-Reply-To: <0707081547390.3987@somehost>
References: <0707081547390.3987@somehost>
Message-ID: <20070713141212.GC27875@marvin.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 08, 2007 at 03:49:03PM +0200, Cristian Ionescu-Idbohrn wrote:

> -CURL_VERSION:=7.13.1
> +CURL_VERSION:=7.16.3

Current version seems to be 7.16.4

> -	toolchain/patch-kernel.sh $(CURL_DIR) package/curl/ \*.patch*
> +	toolchain/patch-kernel.sh $(CURL_DIR) package/curl curl-$(CURL_VERSION)-\*.patch*

Looks fine to me.

When cross-compiling though the configure script fails:
checking for "/dev/urandom"... configure: error: cannot check for file existence when cross compiling

I can fix this by passing --without-random, however there are plenty of
other opportunities for things to go wrong, as the Configure script
seems to do a lot of host-side inspection of headers/libraries.
How are other folks handling this situation?

-R
