From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 26 Nov 2009 16:21:39 -0600
Subject: [Buildroot] Found my LIBICONV problem, just ignore that one.
Message-ID: <200911261621.41946.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_PKG_CONFIG -> BR2_PACKAGE_LIBGLIB2 -> BR2_PACKAGE_LIBINTL && BR2_PACKAGE_LIBICONV
So once you select PKG-CONFIG, the others are set and remain set even when you deselect PKG-CONFIG.

It is just one of the irritations of the select "feature" of Kconfig;
Kconfig doesn't have an "auto-selected by" marker to support an "auto-unselect";
that would unselect the selections that it had previously over-ridden.  ;)

Not fixable, we just have to learn to live with it and use "search" when something gets "locked on".

Mike
