From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 19 Aug 2007 23:58:02 +0200 (CEST)
Subject: [Buildroot] sstrip vs. strip
Message-ID: <0708192347500.12216@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If sstrip is selected (instead of the default strip) it needs to be built
early, else things like this:

,----
| make[1]: Leaving directory `buildroot/build_i486/gmp-4.2.1'
| buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-sstrip
| --strip-unneeded buildroot/build_i486/staging_dir/usr/lib/libgmp.so*
| /bin/sh: buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-sstrip:
| No such file or directory
| make: *** [buildroot/build_i486/staging_dir/usr/lib/libgmp.so]
| Error 127
`----

may occur.

Moreover, sstrip does not have any options, so that options like
s-/--strip-all, --strip-unneeded, --remove-section and so on need to be
hidden behind $(STRIP).


Cheers,

-- 
Cristian
