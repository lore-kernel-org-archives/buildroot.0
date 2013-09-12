From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 21:34:30 +0200
Subject: [Buildroot] [PATCH v2 03/17] ustr: new package
In-Reply-To: <1378936777-28308-4-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378936777-28308-4-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20130912213430.0898522c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 11 Sep 2013 16:59:23 -0500, Clayton Shotwell wrote:

>  .../ustr/ustr-0001-crossCompileModifications.patch |  144 ++++++++++++++++++++

Please name the patch:

ustr-0001-cross-compile-modifications.patch

The naming of patch files should be fixed globally in the patch series.
We use lower case names, with '-' as the separator between words in the
patch description.

Also, this package doesn't build properly when the toolchain does not
have large file support. Just like libselinux, the Makefile hardcodes
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE. Your options are either to
make ustr depend on large file support in the toolchain, or to modify
the Makefile.

Other than that, looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
