From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 May 2017 10:47:13 +0200
Subject: [Buildroot] [PATCH] binutils: disallow selection of 2.27 on
 ARM/noMMU
In-Reply-To: <1493911717-11921-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1493911717-11921-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170505104713.7daa4054@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 May 2017 17:28:37 +0200, Thomas Petazzoni wrote:
> binutils 2.27 triggers a segfault in elf2flt on ARM/noMMU. While Arnout
> has identified a binutils 2.28 commit that can be backported on 2.27,
> this commit is huge and we don't clearly understand the impact.
> 
> Since both binutils 2.26 and 2.28 are unaffected by this issue, we
> simply disallow the selection of binutils 2.27 on ARM/noMMU, and default
> to binutils 2.28.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/e14cadb290b0b86cac12c4bfb681eb6eee9e6dea/
>   and lots of other similar ARM/Cortex-M4 failures
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/binutils/Config.in.host | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
