From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:31:12 +0100
Subject: [Buildroot] [PATCH 4/7] rsyslog: clean up sysv initscript
In-Reply-To: <1421191022-5509-4-git-send-email-gustavo@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
 <1421191022-5509-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150114203112.3412efb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 13 Jan 2015 20:16:59 -0300, Gustavo Zacarias wrote:

>  start() {
> -	echo -n "Starting rsyslog daemon: "
> -	umask 077
> -	start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
> -	echo "OK"
> +  echo -n "Starting rsyslog daemon: "
> +  umask 077

Do we really need this umask 077 ?

>  restart() {
> -	stop
> -	start
> +  stop
> +  sleep 1

And this sleep 1 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
