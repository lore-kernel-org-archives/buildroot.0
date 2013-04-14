From: Diego Iastrubni <diegoiast@gmail.com>
Date: Sun, 14 Apr 2013 08:55:01 +0300
Subject: [Buildroot] [RFCv2] Per-package out-of-tree build
In-Reply-To: <20130413205422.7eb87375@skate>
References: <20130413205422.7eb87375@skate>
Message-ID: <CALR4fELqcE9HsOp+CoPzv-O0UrcH-iPii1CFVOr0z8zAb87tSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 13, 2013 at 9:54 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>  * Each tarball is extracted and patched only once, even if there is
>    both a target build and a host build. Once a package has been
>    extracted and patched, its source code is changed to not have write
>    permissions, in order to catch misbehaving packages in terms of out
>    of tree build.
Nice

>  * A <pkg>_SUPPORTS_OUT_OF_TREE variable defines whether the package
>    supports out of tree build or not. By default, it's set to NO, in
>    which case the package source code is rsynced from its source
>    directory to the build directory at the beginning of the configure
>    step. It is set to YES by both the autotools and cmake package
>    infrastructures (which have been modified to do out of tree build),
>    and by some packages that use the generic infrastructure but
>    nonetheless support out of tree build.
Does buildroot support also qmake? qmake has also out of source build support.
