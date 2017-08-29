From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 23:28:09 +0200
Subject: [Buildroot] [PATCH V2] bcusdk: eibd: drop local clock_gettime
 in USB backends
In-Reply-To: <1503695470-27811-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1503695470-27811-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20170829232809.31f49502@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Aug 2017 23:11:10 +0200, Kurt Van Dijck wrote:
> clock_gettime is defined locally, and calls pth_int_time, which
> in turn calls clock_gettime.
> The USB backend shouldn't overrule clock_gettime in the first place.
> This patch fixes this endless recursion by removing the local defition.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> ---
>  ...endless-recursion-when-using-USB-backends.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
