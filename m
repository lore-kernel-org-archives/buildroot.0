From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 20:39:31 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: patch configure.ac to check for
 ldaddr on when checking libunwind
In-Reply-To: <20180415181555.20945-1-asafka7@gmail.com>
References: <20180415181555.20945-1-asafka7@gmail.com>
Message-ID: <20180415203931.213e4a59@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Apr 2018 21:15:55 +0300, Asaf Kahlon wrote:
> Fixes:
> http://autobuild.buildroot.net/results/2b1aaf7e35651f04a9e9d0269e49c1b0bd87ae29/
> 
> configure.ac can fail the build when there's no dynamic library support,
> since it cannot find dladdr which is needed only when we have libunwind.
> Therefore, configure.ac was patched to check for dladdr only in the libunwind
> check section. As a consequence of the patch, ZEROMQ_AUTORECONF was set.
> 
> The patch was applied to the zeromq master branch, see:
> https://github.com/zeromq/libzmq/commit/c971445025535b9f989ab0b78f5ddd1c026f1878
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                                    |  1 +
>  ...-serach-for-dladdr-only-on-libunwind.patch | 44 +++++++++++++++++++
>  package/zeromq/zeromq.mk                      |  2 +
>  3 files changed, 47 insertions(+)
>  create mode 100644 package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
