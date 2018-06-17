From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:50:41 +0200
Subject: [Buildroot] [PATCH] netplug: prevent starting multiple
 instances of netplugd
In-Reply-To: <20180607013641.22701-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Wed, 6 Jun 2018 22:36:41 -0300")
References: <20180607013641.22701-1-casantos@datacom.com.br>
Message-ID: <87602hquni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > Executing "/etc/init.d/S29netplug start" multiple times resulted in
 > multiple instances of netplugd.

 > Pass "-p /var/run/netplug.pid" to netplugd, so it creates the PID file
 > that start-stop-daemon needs to know that netplugd is already running.
 > Also use the pid file to stop netplugd, instead of the daemon name.

 > Fixes https://bugs.busybox.net/show_bug.cgi?id=10661

 > Reported-by: Joachim Krueger <mail2k@web.de>
 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
