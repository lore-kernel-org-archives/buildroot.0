From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 27 Nov 2009 09:54:08 +0100
Subject: [Buildroot] Found my LIBICONV problem, just ignore that one.
In-Reply-To: <200911261621.41946.minimod@morethan.org>
References: <200911261621.41946.minimod@morethan.org>
Message-ID: <1259312048.19800.14.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2009-11-26 at 16:21 -0600, Michael S. Zick wrote:
> BR2_PACKAGE_PKG_CONFIG -> BR2_PACKAGE_LIBGLIB2 -> BR2_PACKAGE_LIBINTL && BR2_PACKAGE_LIBICONV

This dependency chain is wrong though, as far as I can see. pkg-config
comes with its own copy of glib-1.2.10. It doesn't need libglib2 and it
doesn't need libintl or iconv either.


Sven
