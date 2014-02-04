From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Feb 2014 11:34:02 +0100
Subject: [Buildroot] [PATCH 1/1] Fix the syslogd initscript pidfile
 handling - Fix name to pidfile - Enable CONFIG_FEATURE_PIDFILE
In-Reply-To: <1364485286-24497-1-git-send-email-arved@arved.at>
References: <1364485286-24497-1-git-send-email-arved@arved.at>
Message-ID: <20140204113402.79cd0af4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Mar 2013 16:41:26 +0100, arved at arved.at wrote:
> From: Tilman Keskin?z <arved@arved.at>
> 
> 
> Signed-off-by: Tilman Keskin?z <arved@arved.at>
> ---
>  package/busybox/S01logging            |    4 ++--
>  package/busybox/busybox-1.20.x.config |    2 +-
>  package/busybox/busybox-1.21.x.config |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/busybox/S01logging b/package/busybox/S01logging
> index edece39..37a2c11 100644
> --- a/package/busybox/S01logging
> +++ b/package/busybox/S01logging
> @@ -6,13 +6,13 @@
>  case "$1" in
>    start)
>  	echo -n "Starting logging: "
> -	start-stop-daemon -S -q -p /var/run/syslog.pid --exec /sbin/syslogd -- -m 0
> +	start-stop-daemon -S -q -p /var/run/syslogd.pid --exec /sbin/syslogd -- -m 0
>  	start-stop-daemon -S -q -p /var/run/klogd.pid --exec /sbin/klogd
>  	echo "OK"

Sorry for taking so long to get back to you about this. We are doing
some cleanup in patchwork and are currently looking at old patches.

In the end, the problem you mentioned was resolved by adding the '-m'
option when calling start-stop-daemon, which means that
start-stop-daemon is now responsible for creating the PID file. This
was implemented in:

 http://git.buildroot.net/buildroot/commit/package/busybox?id=fc6b5e4411992f05ab45dac90be01ade8279e000

The part changing the path to the PID file was fixed by a patch from
you:

 http://git.buildroot.net/buildroot/commit/package/busybox?id=1b22957a2c8cb79024f811618f4d09f191d88a6f

Thanks for your contributions, and sorry for the long delay!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
