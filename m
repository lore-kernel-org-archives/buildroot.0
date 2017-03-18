From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:01:40 +0100
Subject: [Buildroot] [PATCH] uboot-tools: pass empty CFLAGS on
 invocation of libfdt/setup.py
In-Reply-To: <1489768962-26768-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489768962-26768-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170318140140.208140fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Mar 2017 09:42:42 -0700, Max Filippov wrote:
> When building u-boot tools in cross-build environment CFLAGS environment
> variable set up for target is taken into an account when building code
> for host. Make it empty on invocation of python.
> 
> This fixes the following build errors when cross-compiling for xtensa:
> 
>   cc1: error: unrecognized command line option "-mlongcalls"
>   cc1: error: unrecognized command line option "-mauto-litpools"
> 
> Fixes:
>   http://autobuild.buildroot.net/results/439d6dacfaa7f9244bd15ca04990c12a25ff4777
>   http://autobuild.buildroot.net/results/e2fe36c20e75d01a01a6659ef11e888965a843b9
>   http://autobuild.buildroot.net/results/6f37ff347822a76571a9fe9cf3c491fe7e4164fa
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
> Upstream status: fix is posted to the list.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
