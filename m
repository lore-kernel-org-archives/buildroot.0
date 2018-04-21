From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 14:59:16 +0200
Subject: [Buildroot] [PATCH] uclibc: backport upstream patch adding
 fcntl definitions on OpenRISC
In-Reply-To: <20180420095522.30646-1-thomas.petazzoni@bootlin.com>
References: <20180420095522.30646-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180421145916.6714b7bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 11:55:22 +0200, Thomas Petazzoni wrote:
> A number of fcntl.h definitions were missing on OpenRISC in uClibc-ng,
> causing build failures such as:
> 
> gfile.c: In function 'splice_stream_with_progress':
> gfile.c:3017:35: error: 'F_SETPIPE_SZ' undeclared (first use in this function)
>    buffer_size = fcntl (buffer[1], F_SETPIPE_SZ, 1024 * 1024);
> 
> This comit backports a patch that was merged in upstream uClibc-ng,
> which addresses this problem.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/182ebbba6c7466b07e965e5120d919cbcf5e9da6/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...dd-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/uclibc/0002-or1k-add-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
