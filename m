From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:42:11 +0200
Subject: [Buildroot] [PATCH v4 4/9] package/pkg-generic: handle host-tar
 as an extract dependency
In-Reply-To: <20180324142008.10375-5-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Mar 2018 15:20:03 +0100")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-5-thomas.petazzoni@bootlin.com>
Message-ID: <87k1u0w4a4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This moves the host-tar dependency handling from
 > DEPENDENCY_HOST_PREREQ to an extract dependency.

 > To achieve that, check-host-tar.mk fills in the
 > BR2_TAR_HOST_DEPENDENCY variable with host-tar if building a host-tar
 > is needed. The name BR2_TAR_HOST_DEPENDENCY has been chosen because it
 > matches the name BR2_CMAKE_HOST_DEPENDENCY already used in
 > check-host-cmake.mk.

 > The BR2_TAR_HOST_DEPENDENCY is added to all packages, except host-tar
 > itself (obviously) and host-skeleton, because we depend on
 > host-skeleton to install host-tar properly in HOST_DIR.

 > In addition, we modify tar.mk to explicitly build host-tar without
 > ccache: since ccache source code is available as a tarball, ccache
 > will obviously depend on host-tar if the system tar is insufficient.

 > Finally, to make things really clean, we also add
 > $(BR2_TAR_HOST_DEPENDENCY) to the dependencies of the tar filesystem
 > format, since it requires tar, so we'd better make sure we have a
 > suitable tar.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes since v3:
 >  - Add dependency on BR2_TAR_HOST_DEPENDENCY in the tar filesystem
 >  - Use = instead of += when defining BR2_TAR_HOST_DEPENDENCY
 >  - Fix typo in commit log
 >  - Added Reviewed-by from Yann.

 > Changes since v2:
 >  - New patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
