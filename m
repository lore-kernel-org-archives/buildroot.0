From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:22:42 +0100
Subject: [Buildroot] [PATCH] glibc: security bump to the latest commit
 on 2.26 branch
In-Reply-To: <20180206153032.903-1-peter@korsgaard.com>
References: <20180206153032.903-1-peter@korsgaard.com>
Message-ID: <20180208232242.2882a9dd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 16:30:32 +0100, Peter Korsgaard wrote:
> Fixes the following security issues according to NEWS:
> 
> CVE-2017-1000408: Incorrect array size computation in _dl_init_paths leads
> to the allocation of too much memory.  (This is not a security bug per se,
> it is mentioned here only because of the CVE assignment.) Reported by
> Qualys.
> 
> CVE-2017-1000409: Buffer overflow in _dl_init_paths due to miscomputation of
> the number of search path components.  (This is not a security vulnerability
> per se because no trust boundary is crossed if the fix for CVE-2017-1000366
> has been applied, but it is mentioned here only because of the CVE
> assignment.) Reported by Qualys.
> 
> CVE-2017-16997: Incorrect handling of RPATH or RUNPATH containing $ORIGIN
> for AT_SECURE or SUID binaries could be used to load libraries from the
> current directory.
> 
> CVE-2018-1000001: Buffer underflow in realpath function when getcwd function
> succeeds without returning an absolute path due to unexpected behaviour of
> the Linux kernel getcwd syscall.  Reported by halfdog.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/glibc/glibc.hash | 2 +-
>  package/glibc/glibc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
