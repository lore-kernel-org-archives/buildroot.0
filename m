From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Sun, 04 Oct 2009 20:40:02 +0200
Subject: [Buildroot] Question about libtool patching
Message-ID: <1254681602.25803.41.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying to integrate some new packages in buildroot. Those packages
use the autotools and need to be libtool patched to work with my
toolchain.

I'm wondering why the libtool patching is done twice in the build
process. One time after extraction of the package, another time at
configuration time.

The reason of this question is that I'm having problems with the first
patching. As long as the configure script has not been run, the patching
fails.

Couldn't we just trigger the patch at extraction only if autoreconf is
not required ?

Here a patch to try to implement this proposition.


-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
