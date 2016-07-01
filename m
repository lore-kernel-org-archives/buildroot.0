From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:18:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/ucl: fix build with host gcc 6.x
In-Reply-To: <20160616160049.19597-1-martin@barkynet.com>
References: <20160616160049.19597-1-martin@barkynet.com>
Message-ID: <20160701161801.1a86708b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 17:00:49 +0100, Martin Bark wrote:
> ucl fails with the following error when using gcc 6.x on the host:
> 
>  checking whether your compiler passes the ACC conformance test... FAILED
>  configure:
>  configure: Your compiler failed the ACC conformance test - for details see
>  configure: `config.log'. Please check that log file and consider sending
>  configure: a patch or bug-report to <markus@oberhumer.com>.
>  configure: Thanks for your support.
>  configure:
>  configure: error: ACC conformance test failed. Stop.
> 
> Fix the issue by using the ISO C90 standard.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---
> Note: I found the fix here https://bugs.archlinux.org/task/49287
> ---
>  package/ucl/ucl.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
