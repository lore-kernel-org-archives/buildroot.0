From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 15:24:13 +0100
Subject: [Buildroot] [PATCH next v8 3/6] package/pkg-generic: make
 libtool .la files compatible with per-package directories
In-Reply-To: <20191105164646.23820-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 5 Nov 2019 17:46:42 +0100")
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
 <20191105164646.23820-4-thomas.petazzoni@bootlin.com>
Message-ID: <87eexqahgy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Libtool .la files unfortunately contain a number of absolute paths,
 > which now refer to per-package directories. Due to this, when building
 > package A, .la files may contain absolute paths referring to
 > directories in package B per-package sysroot. This causes some -L
 > flags referring to other sysroot from being added, which doesn't work
 > as the linker no longer realizes that such paths are within its
 > sysroot.

 > To fix this, we introduce a replacement step of .la files in the
 > configure step, to make sure all paths refer to this package
 > per-package directory.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
