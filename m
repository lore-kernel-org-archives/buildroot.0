From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:51:55 +0200
Subject: [Buildroot] [PATCH v4 8/9] package/pkg-generic: handle
 host-fakedate as a regular dependency
In-Reply-To: <20180324142008.10375-9-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Mar 2018 15:20:07 +0100")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-9-thomas.petazzoni@bootlin.com>
Message-ID: <87370ow3tw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit moves the host-fakedate dependency handling from
 > DEPENDENCIES_HOST_PREREQ to a proper regular dependency handled by the
 > package infrastructure.

 > host-fakedate is added as dependency to all packages, except
 > host-skeleton, because we depend on it.

 > In addition, we make sure that host-fakedate does not grow a
 > dependency on host-{tar,xz,lzip,ccache} to avoid circular
 > dependencies. host-fakedate does not need any extraction tool and does
 > not need to build C/C++ code (the source code is just a shell script
 > available in Buildroot).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes since v3:
 >  - Make sure we don't introduce a host-fakedate -> host-fakedate
 >    circular dependency.
 >  - Added Reviewed-by from Yann.

 > Changes since v2:
 >  - New patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
