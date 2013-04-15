From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Apr 2013 09:36:10 +0200
Subject: [Buildroot] [RFCv2] Per-package out-of-tree build
In-Reply-To: <CALR4fELqcE9HsOp+CoPzv-O0UrcH-iPii1CFVOr0z8zAb87tSg@mail.gmail.com>
References: <20130413205422.7eb87375@skate>
 <CALR4fELqcE9HsOp+CoPzv-O0UrcH-iPii1CFVOr0z8zAb87tSg@mail.gmail.com>
Message-ID: <20130415093610.41836fc2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Diego Iastrubni,

On Sun, 14 Apr 2013 08:55:01 +0300, Diego Iastrubni wrote:

> >  * A <pkg>_SUPPORTS_OUT_OF_TREE variable defines whether the package
> >    supports out of tree build or not. By default, it's set to NO, in
> >    which case the package source code is rsynced from its source
> >    directory to the build directory at the beginning of the
> > configure step. It is set to YES by both the autotools and cmake
> > package infrastructures (which have been modified to do out of tree
> > build), and by some packages that use the generic infrastructure but
> >    nonetheless support out of tree build.
> Does buildroot support also qmake? qmake has also out of source build
> support.

We don't have a specific qmake infrastructure, so for now the packages
that rely on the qmake build system use the 'generic-package' Buildroot
package infrastructure. It is therefore up to them to support
out-of-tree build.

If qmake packages become more widespread, it might be useful to add a
specific infrastructure for them. For now, I feel their number is a bit
limited to do so.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
