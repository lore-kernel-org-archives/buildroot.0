From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 17 May 2013 09:21:03 +0200
Subject: [Buildroot] how to specify custom rsync options
Message-ID: <CAKAx1cgACDFWgQqYUx9fCCqKKXpgbADeH9p_io-cbnHpjYMPTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a custom package defined with the 'generic package'
infrastructure. I copy the sources from a local folder using the
'local' method.

In this case, the rsync command-line to copy the contents is hardcoded to

rsync -au --cvs-exclude --include core [...]

as seen in the package/pkg-generic.mk file.

It looks like sensible options to me, but in my very specific source
code I also store some static libraries (*.a files), and the
--cvs-exclude seems to exclude them, thus my package does not compile.

I am searching for the best way to override this rsync command-line
for my package, or maybe this is the opportunity to suggest having
some kind of RSYNC_OPT variable to add options on a per-package
basis... Else, should I create a rule named $(MYPKG_TARGET_RSYNC) to
override the default one?

Any hints?

Thanks,
Lionel
