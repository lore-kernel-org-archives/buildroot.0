From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:18:14 +0200
Subject: [Buildroot] [PATCH v2] package/bc: bump to 1.07.1
In-Reply-To: <20190913185742.29038-1-matthew.weber@rockwellcollins.com>
References: <20190913185742.29038-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190915151814.2368c05f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Fri, 13 Sep 2019 13:57:42 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

>  * Added license hash files
>  * Updated site to new GNU location
>  * Reconfig required to use newer automake
>  * Dropped patch for 01_array_initialize.patch as it was fixed
>  * Refactored patches for makeinfo variable and write io errs
>  * Added new dc fix exit code patch from Debian sid
>  * Added new libmath offline gen cross-compile patch from Yocto
> 
> Upstream patch status: Pending
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Email sent direct to philnelson at acm.org for the following.
>  0001-bc-use-MAKEINFO-variable-for-docs.patch
>  0002-notice-read-and-write-errors-on-input-and-output.patch
>  0003-dc-fix-exit-code-of-q-command.patch
>  Discussion of libmath.h cross-compiling bug

I had to add MAKEINFO=true in BC_CONF_ENV, otherwise the build would
fail with:

/home/test/buildroot/output/build/bc-1.07.1/missing: line 81: makeinfo: command not found
/home/test/buildroot/output/build/bc-1.07.1/missing: line 81: makeinfo: command not found

on a system with makeinfo not installed.

Applied to master with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
