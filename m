From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 23:49:18 +0200
Subject: [Buildroot] [git commit] Rework the logging daemons startup
In-Reply-To: <20110705230329.5523cbdf@skate> (Thomas Petazzoni's message of
 "Tue, 5 Jul 2011 23:03:29 +0200")
References: <20110704191001.ADED18A31E@busybox.osuosl.org>
 <20110705230329.5523cbdf@skate>
Message-ID: <87oc18v1nl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Le Mon, 4 Jul 2011 21:03:37 +0200,
 Thomas> Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

 >> # Logging junk
 >> null::sysinit:/bin/touch /var/log/messages
 >> -null::respawn:/sbin/syslogd -n -m 0
 >> -null::respawn:/sbin/klogd -n

 Thomas> Starting the daemon is removed, but stopping the daemons is still there:

Ahh yes, will fix. We should probably tweak rcS so we can call all the
init scripts in reverse order with stop argument for shutting down.

-- 
Bye, Peter Korsgaard
