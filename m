From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 19:59:42 +0200
Subject: [Buildroot] [review request] rework of libtool
Message-ID: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch serie tries to rework how buildroot deals with libtooled
packages.

The main thing to retain is that instead of dealing with the libtool
scripts shipped within the packages, we want to use our own slightly
modified libtool version. The downside of this approach is that now,
we have to turn on autoreconfiguration on libtooled packages. And so
we need to make a pass on all concerned packages to make sure nothing
is broken. Otherwise, most of the concerned packages just need a
simple modification of the <PKG_NAME>_AUTORECONF and
<PKG_NAME>_LIBTOOL_PATCH variables.

This series shows the modifications to bring for a few packages.
