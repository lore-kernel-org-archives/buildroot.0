From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Sep 2011 23:09:15 +0200
Subject: [Buildroot] [PATCH v3 1/2] netsnmp: fix stop and restart
	actions in init script
In-Reply-To: <1314819999-9099-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Wed, 31 Aug 2011 21:46:38 +0200")
References: <1308238033-20127-1-git-send-email-luca@lucaceresoli.net>
 <1314819999-9099-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87hb4ieqh0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> /etc/init.d/S59snmpd stop (and restart) currently fail if either
 Luca> snmpd or snmptrapd are not running.  This is because
 Luca> start-stop-daemon -K returns nonzero if the process to be killed
 Luca> is not running, and this causes the whole script to fail because
 Luca> it runs under 'set -e'.

Committed. thanks.

-- 
Bye, Peter Korsgaard
