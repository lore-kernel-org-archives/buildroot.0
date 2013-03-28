From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Mar 2013 08:09:19 +0100
Subject: [Buildroot] [PATCH 3/4] Fix path to pidfile
In-Reply-To: <1364222893-23858-3-git-send-email-arved@arved.at>
References: <1364222893-23858-1-git-send-email-arved@arved.at>
 <1364222893-23858-3-git-send-email-arved@arved.at>
Message-ID: <5153EC9F.4070109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/03/13 15:48, arved at arved.at wrote:
> From: Tilman Keskin?z <arved@arved.at>
>
>
> Signed-off-by: Tilman Keskin?z <arved@arved.at>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(untested)

  Regards,
  Arnout

> ---
>   package/busybox/S01logging |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/busybox/S01logging b/package/busybox/S01logging
> index edece39..37a2c11 100644
> --- a/package/busybox/S01logging
> +++ b/package/busybox/S01logging
> @@ -6,13 +6,13 @@
>   case "$1" in
>     start)
>   	echo -n "Starting logging: "
> -	start-stop-daemon -S -q -p /var/run/syslog.pid --exec /sbin/syslogd -- -m 0
> +	start-stop-daemon -S -q -p /var/run/syslogd.pid --exec /sbin/syslogd -- -m 0
>   	start-stop-daemon -S -q -p /var/run/klogd.pid --exec /sbin/klogd
>   	echo "OK"
>   	;;
>     stop)
>   	echo -n "Stopping logging: "
> -	start-stop-daemon -K -q -p /var/run/syslog.pid
> +	start-stop-daemon -K -q -p /var/run/syslogd.pid
>   	start-stop-daemon -K -q -p /var/run/klogd.pid
>   	echo "OK"
>   	;;
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
