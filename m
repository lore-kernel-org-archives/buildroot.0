From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 23:00:26 +0100
Subject: [Buildroot] [PATCH] package/mender: fix sysv startup script
In-Reply-To: <20190215214410.29132-1-angelo@amarulasolutions.com>
References: <20190215214410.29132-1-angelo@amarulasolutions.com>
Message-ID: <20190215230026.6b1e4857@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Feb 2019 22:44:10 +0100
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> Mender is a service explicitly written for systemd and so it doesn't
> fork on background, doesn't redirect outputs and doesn't create a pid
> file by itself.
> To make the service running correctly is therefore necessary to use the
> -m switch of start-stop-daemon to create the pid file and -b option to
> send the process to background.
> Logging is preserved because the service will log anyway on syslog.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/mender/S42mender | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
