From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 00:10:14 +0200
Subject: [Buildroot] [PATCH v2] uclibc: ARC: Support syscall ABI v4
In-Reply-To: <1471499553-6145-1-git-send-email-vzakhar@synopsys.com>
References: <1471499553-6145-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160819001014.58b82e51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 08:52:33 +0300, Vlad Zakharov wrote:
> When used with GCC 6 ABIv4 is used.
> Missing this patch leads to numerous runtime errors.
> 
> The patch has already been accepted in uclibc-ng:
> http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=3e40f9669279f005f7154892539166f5081fbcb2
> 
> So the patch should be removed after update to a new version of uclibc-ng.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
> Changes v1-v2:
>  Added commit message and signed-off-by to the attached patch.

For some reason, your patch did not apply:

thomas at skate:~/projets/buildroot (master)$ git pwam 660333
Applying patch #660333 using 'git am -s -3'
Description: [v2] uclibc: ARC: Support syscall ABI v4
Applying: uclibc: ARC: Support syscall ABI v4
fatal: corrupt patch at line 69
error: could not build fake ancestor
Patch failed at 0001 uclibc: ARC: Support syscall ABI v4
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
ethomas at skate:~/projets/buildroot (master|AM 1/1)$ cat .git/rebase-apply/patch | patch -p1
patching file package/uclibc/0003-ARC-Support-syscall-ABI-v4.patch
patch: **** malformed patch at line 68: -- 

So I simply re-created it from the uClibc-ng Git repository, and
applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
