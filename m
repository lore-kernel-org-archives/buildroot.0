From: Yvan Roch <yvan.roch@gmail.com>
Date: Wed, 19 Dec 2012 12:32:43 +0100
Subject: [Buildroot] Bug report in pkg-autotools.mk
Message-ID: <CAExA2HxbO1X8zt_+Q=BtUhqnWCCSeNGZ3ALR_FhJmhWnpGLBHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

In the pkg-autotools.mk file, line 238 (BR2012.11) or
Makefile.autotools.in line 250 (BR2012.02), there is the following
command:

$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \

This command corrects the bad path for libraries installed in the
staging directory in the libtool .la files.

But, if Buildroot resides in a directory that contains /usr (for
example /usr/local/src/buildroot-2012.11), $(STAGING_DIR) contains
/usr and this command is not idempotent.
Each time an autotools package is built, the paths in .la files are
longer and false.

Regards,

Yvan Roch.
