From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 21:15:39 +0200
Subject: [Buildroot] [PATCH/next] acpid: use shutdown for poweroff,
 if available, not /sbin/poweroff
In-Reply-To: <20180830132120.10889-1-casantos@datacom.com.br>
References: <20180830132120.10889-1-casantos@datacom.com.br>
Message-ID: <20180910211539.1763d962@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 10:21:20 -0300, Carlos Santos wrote:
> It's preferable to use "shutdown -hP now" to ensure that the runlevel is
> known, preventing this message on the system console and log:
> 
>   WARNING: could not determine runlevel - doing soft poweroff
>     (it's better to use shutdown instead of poweroff from the command line)
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/acpid/acpid.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Nobody complained about this since ~2 weeks and it looks reasonable, so
I've applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
