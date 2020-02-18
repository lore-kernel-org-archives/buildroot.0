From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2020 23:10:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/apache: fix build with
 per-package directory support
In-Reply-To: <20200217234639.107108-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 18 Feb 2020 00:46:39 +0100")
References: <20200217234639.107108-1-thomas.petazzoni@bootlin.com>
 <20200217234639.107108-2-thomas.petazzoni@bootlin.com>
Message-ID: <87pnebeecj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When APR_INCLUDEDIR and APU_INCLUDEDIR point to the same directory,
 > Apache builds properly. However, with per-package directory support,
 > they point to different directories, and APU_INCLUDEDIR contains both
 > the APR headers and the APU headers.

 > Due to this, the Apache Makefile logic to generate its exports.c file
 > leads to duplicate definitions, because the APR headers are considered
 > twice: once from APR_INCLUDEDIR, once from APU_INCLUDEDIR.

 > We fix this by introducing a patch to the Apache build system.

 > In addition, apr provides a special libtool script that gets used by
 > apr-util and apache. apr-util already had a fixup for this, but apache
 > did not, which was causing the gcc from apr-util per-package
 > directories be used during the apache build, causing build failures.

 > To fix this, we adjust this libtool script to point to the correct
 > tools in apache's per-package directories.

 > There are no autobuilder failures for this, because Apache needs
 > apr-util, and apr-util currently fails to build when
 > BR2_PER_PACKAGE_DIRECTORIES=y.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
