From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 17:24:47 +0100
Subject: [Buildroot] [PATCH 1/1] cairo : bump version
In-Reply-To: <1358084322-16330-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Sun, 13 Jan 2013 14:38:42 +0100")
References: <1358084322-16330-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <87a9sdyrsg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> cairo : bump version
 Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 Sagaert> ---
 Sagaert>  package/cairo/cairo.mk | 6 ++++--
 Sagaert>  1 file changed, 4 insertions(+), 2 deletions(-)

 Sagaert> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
 Sagaert> index 6cf910a..bd670d9 100644
 Sagaert> --- a/package/cairo/cairo.mk
 Sagaert> +++ b/package/cairo/cairo.mk
 Sagaert> @@ -3,8 +3,10 @@
 Sagaert>  # cairo
 Sagaert>  #
 Sagaert>  #############################################################
 Sagaert> -CAIRO_VERSION = 1.10.2
 Sagaert> -CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.gz
 Sagaert> +CAIRO_VERSION = 1.12.8
 Sagaert> +CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 Sagaert> +CAIRO_LICENSE = LGPLv2.1+
 Sagaert> +CAIRO_LICENSE_FILES = COPYING

Next to the comments Thomas mentioned about the commit message, it
doesn't actually work here:

>>> cairo 1.12.8 Extracting
xzcat /var/lib/downloads/cairo-1.12.8.tar.xz | tar --strip-components=1 -C /home/peko/source/buildroot/testcairo/build/cairo-1.12.8  -xf -
>>> cairo 1.12.8 Patching package//cairo

Applying cairo-1.10.2-directfb.patch using patch: 
patching file src/cairo-directfb-surface.c
Hunk #1 FAILED at 700.
Hunk #2 FAILED at 928.
Hunk #3 FAILED at 1584.
Hunk #4 FAILED at 1809.
4 out of 4 hunks FAILED -- saving rejects to file src/cairo-directfb-surface.c.rej
Patch failed!  Please fix cairo-1.10.2-directfb.patch!

Please fix and resubmit.

-- 
Bye, Peter Korsgaard
