From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jun 2008 13:59:39 +0200
Subject: [Buildroot] Getting the toolchain generation out of Buildroot ?
Message-ID: <20080613135939.44dab265@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is certainly a vast topic, but this is something I'm thinking of
since quite some time. Buildroot is mainly designed to build a root
filesystem, but also comes with the ability of generating a
cross-compiling toolchain. However, these two tasks are very distinct:
you usually generate the toolchain once, then build your root
filesystem several times until it works, and at some points you might
want to generate your toolchain again with some more options or other
versions of the tools. But you always end up to do that separatly.

From my perspective, it would make a lot of sense to have two distinct
tools, like "buildtoolchain" and "buildroot". And it happens that
crosstool-ng [1] basically is what "buildtoolchain" could be. What
about focusing the efforts of toolchain generate on crosstool-ng and
getting rid of that feature in buildroot so that we have two nice
tools, with similar behaviour, for these two separate tasks ?

Sincerly,

Thomas

[1] http://ymorin.is-a-geek.org/dokuwiki/projects/crosstool
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080613/654e1c27/attachment.pgp 
