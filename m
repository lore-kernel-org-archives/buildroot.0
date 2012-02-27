From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 27 Feb 2012 13:38:53 +0100
Subject: [Buildroot] update libglib2 and libsoup
Message-ID: <1330346337-27342-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This is a patchset that updates libglib2 and libsoup to the latest
stable versions.

SSL/TLS support in libsoup does not any longer use libgcrypt directly
but relies on GIO modules that are provided by glib-networking. Thus
a new package "glib-networking" is introduced.

Packages using libsoup with SSL support don't need to be changed;
the BR2_PACKAGE_LIBSOUP_SSL option takes care of selecting the new
glib-networking package and compiling it with libgcrypt support.

There's also a patch included for gamin that is needed to make it
compile with the latest libglib2.
