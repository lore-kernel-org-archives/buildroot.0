From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:43:02 +0200
Subject: [Buildroot] [PATCH 1/1] sysklogd: add patch to fix build with
 glibc 2.24
In-Reply-To: <20161008035232.24677-1-bluemrp9@gmail.com>
References: <20161008035232.24677-1-bluemrp9@gmail.com>
Message-ID: <20161009224302.7639a434@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Oct 2016 20:52:32 -0700, Ryan Coe wrote:
> Building sysklogd with glibc 2.24 fails with the following error:
> 
> syslogd.c: In function ?reapchild?:
> syslogd.c:2097:13: error: storage size of ?status? isn?t known
>   union wait status;
>              ^
> Makefile:99: recipe for target 'syslogd.o' failed
> make[2]: *** [syslogd.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> package/pkg-generic.mk:201: recipe for target './buildroot/output/build/sysklogd-1.5.1/.stamp_built' failed
> make[1]: *** [./buildroot/output/build/sysklogd-1.5.1/.stamp_built] Error 2
> Makefile:41: recipe for target '_all' failed
> make: *** [_all] Error 2
> 
> union wait was marked deprecated in glibc 2.23 and removed in glibc 2.24.
> The fix is to declare it as an int.
> 
> See https://sourceware.org/ml/libc-alpha/2016-02/msg00342.html
> 
> Sent upstream via their mailing list
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  ...01-replace-deprecated-union-wait-with-int.patch | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/sysklogd/0001-replace-deprecated-union-wait-with-int.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
