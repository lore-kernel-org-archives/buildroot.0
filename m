From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 12 Sep 2011 07:45:43 -0500
Subject: [Buildroot] Dropbear reports errors in system log
In-Reply-To: <76CD2217761740AF8C8566A85C51B906@beraninstruments.com.local>
References: <76CD2217761740AF8C8566A85C51B906@beraninstruments.com.local>
Message-ID: <201109120745.46424.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon September 12 2011, Will Moore wrote:
> Buildroot dropbear is configured to log ssh access to /var/log/lastlog and
> /var/log/wtmp as well as /var/log/utmp.  It successfully logs to /var/log/utmp
> but reports the following entries in the /var/log/messages system log:
> 
> Sep 12 06:42:43 buildroot authpriv.warn dropbear[1019]: lastlog_perform_login:
> Couldn't stat /var/log/lastlog: No such file or directory
> Sep 12 06:42:43 buildroot authpriv.warn dropbear[1019]: lastlog_openseek:
> /var/log/lastlog is not a file or directory!
> Sep 12 06:42:43 buildroot authpriv.warn dropbear[1019]: wtmp_write: problem
> writing /var/log/wtmp: No such file or directory
> 
> I believe these errors can be stopped either by creating /var/log/lastlog and
> /var/log/wtmp (but this would seem to just duplicate logging) or by configuring
> dropbear --disable-lastlog and --disable-wtmp (better).  Is there something I am
> missing?
> 
> I note that other login accesses are reported to /var/log/utmp too.  Is there
> anything stopping /var/log/utmp growing over time?
>

A diligent administrator who does not want the default *nix behavior.

Seriously -
The utmp file was designed to be very small in *nix systems because
it was intended to grow over the life of the software installation.

For instance, the system on which I am writing this, that gets multiple
logins each and every day for seven years: 3,072 bytes.

So yes, it does grow over time, unless you do something about it.
Like, maybe delete it once a decade or when it reaches 4K bytes (one memory page).

Mike

> Regards,
> 
> 
> 
> Will
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
