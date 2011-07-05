From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 23:03:29 +0200
Subject: [Buildroot] [git commit] Rework the logging daemons startup
In-Reply-To: <20110704191001.ADED18A31E@busybox.osuosl.org>
References: <20110704191001.ADED18A31E@busybox.osuosl.org>
Message-ID: <20110705230329.5523cbdf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 4 Jul 2011 21:03:37 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

>  # Logging junk
>  null::sysinit:/bin/touch /var/log/messages
> -null::respawn:/sbin/syslogd -n -m 0
> -null::respawn:/sbin/klogd -n

Starting the daemon is removed, but stopping the daemons is still there:

# Stuff to do before rebooting
null::shutdown:/usr/bin/killall klogd
null::shutdown:/usr/bin/killall syslogd

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
