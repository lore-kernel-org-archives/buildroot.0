From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:30:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] lighttpd: Add systemd tmpfile to fix
 lighttpd systemd boot
In-Reply-To: <20180730102416.20507-1-laurent.hartanerot@gmail.com> (Laurent
 Hartanerot's message of "Mon, 30 Jul 2018 12:24:16 +0200")
References: <20180727213514.19361-1-laurent.hartanerot@gmail.com>
 <20180730102416.20507-1-laurent.hartanerot@gmail.com>
Message-ID: <87bm9skvzd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Laurent" == Laurent Hartanerot <laurent.hartanerot@gmail.com> writes:

 > From: Laurent Hartanerot <laurent.hartanerot@atos.net>
 > Problem starting lighttpd application with systemd.

 > /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
 > 2018-06-22 11:21:34: (server.c.733) opening errorlog '/var/log/lighttpd-error.log' failed: Permission denied
 > 2018-06-22 11:21:34: (server.c.1420) Opening errorlog failed. Going down.

 > Lighttpd can not write the 'lighttpd-access.log' and 'lighttpd-error.log' files
 > to the directory '/var/log/'.

 > When using systemd the directory '/var/log' does not allow the user www-data to
 > write.

 > To correct the problem, we add /usr/lib/tmpfiles.d/lighttpd.conf.
 > This file create the 'lighttpd-access.log' and 'lighttpd-error.log' files  with
 > the permission


 > Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
