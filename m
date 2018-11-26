From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:14:59 +0100
Subject: [Buildroot] [PATCH next v6 03/10] Makefile: rework main
 directory creation logic
In-Reply-To: <20181123145815.13008-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 23 Nov 2018 15:58:08 +0100")
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-4-thomas.petazzoni@bootlin.com>
Message-ID: <87woozso2k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In the current code, the creation of the main output directories
 > (BUILD_DIR, STAGING_DIR, HOST_DIR, TARGET_DIR, etc.) is done by a
 > global "dirs" target. While this works fine in the current situation,
 > it doesn't work well in a context where per-package host and target
 > directories are used.

 > For example, with the current code and per-package host directories,
 > the output/staging symbolic link ends up being created as a link to
 > the per-package package sysroot directory of the first package being
 > built, instead of the global sysroot.

 > This commit reworks the creation of those directories by having the
 > package/pkg-generic.mk code ensure that the build directory, target
 > directory, host directory, staging directory and binaries directory
 > exist before they are needed.

 > Two new targets, host-finalize and staging-finalize are added in the
 > main Makefile to create the compatibility symlinks for host and
 > staging directories. They will be extended later with additional logic
 > for per-package directories.

 > Thanks to those changes, the global "dirs" target is entirely removed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
