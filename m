From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:36:59 +0200
Subject: [Buildroot] [PATCH v4 1/9] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
In-Reply-To: <20180324142008.10375-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Mar 2018 15:20:00 +0100")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-2-thomas.petazzoni@bootlin.com>
Message-ID: <87woy0w4is.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > As part of the per-package SDK work, we want to avoid having logic
 > that installs files to the global HOST_DIR, and instead do it inside
 > packages. One thing that gets installed to the global HOST_DIR is the
 > minimal "skeleton" that we create in host:

 >  - the "usr" symbolic link for backward compatibility

 >  - the "lib" directory, and its lib64 or lib32 symbolic links

 > This commit moves this logic to a new host-skeleton package, and makes
 > all packages (except itself) depend on it. We also make sure that this
 > host-skeleton package doesn't depend on host-patchelf, because
 > host-patchelf depends on host-skeleton.

 > While at it, use $(Q) instead of @ in the HOST_SKELETON_INSTALL_CMDS.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes since v3:
 >  - Use $(Q) instead of @ in the HOST_SKELETON_INSTALL_CMDS
 >  - Add Reviewed-by from Yann
 > Changes since v2:
 >  - None
 > Changes since v1:
 >  - New patch

Committed after dropping the host-patchelf reference, thanks.

-- 
Bye, Peter Korsgaard
