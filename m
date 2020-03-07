From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:25:43 +0100
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.33
In-Reply-To: <20200228102840.4vv4wuqw42kmm37s@waldemar-brodkorb.de>
References: <20200228102840.4vv4wuqw42kmm37s@waldemar-brodkorb.de>
Message-ID: <20200307222543.0067ef9b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Waldemar,

On Fri, 28 Feb 2020 11:28:40 +0100
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...lude-ctype.h-drop-is-_l-macro-definitions.patch | 72 ----------------------
>  ...de-ctype.h-restore-__isctype_l-definition.patch | 32 ----------
>  package/uclibc/uclibc.hash                         |  4 +-
>  package/uclibc/uclibc.mk                           |  2 +-
>  4 files changed, 3 insertions(+), 107 deletions(-)
>  delete mode 100644 package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch
>  delete mode 100644 package/uclibc/0002-include-ctype.h-restore-__isctype_l-definition.patch

There is something odd with your release tarball. When it gets
extracted, I get gazillions of:

>>> uclibc 1.0.33 Extracting
xzcat /home/thomas/dl/uclibc/uClibc-ng-1.0.33.tar.xz | /home/thomas/projets/buildroot/output/host/bin/tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/uclibc-1.0.33   -xf -
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'LIBARCHIVE.creationtime'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.dev'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.ino'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.nlink'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.dev'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.ino'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.nlink'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.dev'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.ino'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.nlink'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'LIBARCHIVE.creationtime'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.dev'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.ino'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.nlink'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.dev'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.ino'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.nlink'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.dev'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.ino'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.nlink'
/home/thomas/projets/buildroot/output/host/bin/tar: Ignoring unknown extended header keyword 'SCHILY.dev'

And when I say gazillions I mean it: there are 15502 of such messages
printed when extracting your tarball. I don't get any of those messages
when extracting the uClibc 1.0.32 tarball.

Could you fix this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
