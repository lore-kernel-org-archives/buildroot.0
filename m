From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:19:24 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain: limit musl/kernel headers
 conflict workaround
In-Reply-To: <d68921fb2a2c2decd1be2268025f24eb328de37f.1518524870.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 13 Feb 2018 14:27:50 +0200")
References: <00926ed70cd14972bac0ce653b1f383b4a31492c.1518524870.git.baruch@tkos.co.il>
 <d68921fb2a2c2decd1be2268025f24eb328de37f.1518524870.git.baruch@tkos.co.il>
Message-ID: <874lkx5q2r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The musl/kernel headers workaround was added in commit 196932cd91
 > (toolchain: workaround musl/kernel headers conflict) to fix definition
 > collisions in networking related headers between musl headers and kernel
 > headers. Kernel headers from version 4.15 and newer do not need this
 > workaround anymore since kernel commit c0bace798436bc (uapi libc compat:
 > add fallback for unsupported libcs). The C library does not have to
 > define the __GLIBC__ macro to make the __UAPI_DEF_* macros effective.

 > Updated the comment to accordingly.

 > Tested with the xl2tp package. This package fails to build with older
 > kernel headers without the workaround (struct in_pktinfo redefinition,
 > among others). With 4.15 headers, xl2tp builds fine with this patch
 > applied. That is, no workaround needed.

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
