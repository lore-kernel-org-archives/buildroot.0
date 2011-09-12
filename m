From: Will Moore <will.moore@beraninstruments.com>
Date: Mon, 12 Sep 2011 12:39:51 +0100
Subject: [Buildroot] Dropbear reports errors in system log
Message-ID: <76CD2217761740AF8C8566A85C51B906@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot dropbear is configured to log ssh access to /var/log/lastlog and
/var/log/wtmp as well as /var/log/utmp.  It successfully logs to /var/log/utmp
but reports the following entries in the /var/log/messages system log:

Sep 12 06:42:43 buildroot authpriv.warn dropbear[1019]: lastlog_perform_login:
Couldn't stat /var/log/lastlog: No such file or directory
Sep 12 06:42:43 buildroot authpriv.warn dropbear[1019]: lastlog_openseek:
/var/log/lastlog is not a file or directory!
Sep 12 06:42:43 buildroot authpriv.warn dropbear[1019]: wtmp_write: problem
writing /var/log/wtmp: No such file or directory

I believe these errors can be stopped either by creating /var/log/lastlog and
/var/log/wtmp (but this would seem to just duplicate logging) or by configuring
dropbear --disable-lastlog and --disable-wtmp (better).  Is there something I am
missing?

I note that other login accesses are reported to /var/log/utmp too.  Is there
anything stopping /var/log/utmp growing over time?
 
Regards,



Will
