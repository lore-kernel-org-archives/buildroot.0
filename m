From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 16:10:10 +0200
Subject: [Buildroot] [PATCH] netplug: prevent starting multiple
 instances of netplugd
In-Reply-To: <20180607013641.22701-1-casantos@datacom.com.br>
References: <20180607013641.22701-1-casantos@datacom.com.br>
Message-ID: <20180607161010.01d1361c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Jun 2018 22:36:41 -0300, Carlos Santos wrote:
> Executing "/etc/init.d/S29netplug start" multiple times resulted in
> multiple instances of netplugd.
> 
> Pass "-p /var/run/netplug.pid" to netplugd, so it creates the PID file
> that start-stop-daemon needs to know that netplugd is already running.
> Also use the pid file to stop netplugd, instead of the daemon name.
> 
> Fixes https://bugs.busybox.net/show_bug.cgi?id=10661
> 
> Reported-by: Joachim Krueger <mail2k@web.de>
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/netplug/S29netplug | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
