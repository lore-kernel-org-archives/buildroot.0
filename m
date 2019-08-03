From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 18:45:45 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/busybox: add init script for
 sysctl
In-Reply-To: <20190501231140.6365-2-unixmania@gmail.com>
 (unixmania@gmail.com's message of "Wed, 1 May 2019 20:11:40 -0300")
References: <20190501231140.6365-1-unixmania@gmail.com>
 <20190501231140.6365-2-unixmania@gmail.com>
Message-ID: <87d0hmb3k6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

Hi,

 > From: Carlos Santos <unixmania@gmail.com>
 > Add a simple init script that invokes sysctl early in the initialization
 > process to configure kernel parameters. This is already performed by
 > systemd (systemd-sysctl) but there is no sysvinit/busybox counterpart.

 > Files are read from directories in the following list in the given order
 > from top to bottom:

 >     /run/sysctl.d/*.conf
 >     /etc/sysctl.d/*.conf
 >     /usr/local/lib/sysctl.d/*.conf
 >     /usr/lib/sysctl.d/*.conf
 >     /lib/sysctl.d/*.conf
 >     /etc/sysctl.conf

 > A file may be used more than once, since there can be multiple symlinks
 > to it. No attempt is made to prevent this.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 > ---
 > Changes v2->v3:
 >   - Update SOB, since I don't work for DATACOM anymore.
 > Changes v1->v2:
 >   - Use a while loop to process all files.
 >   - Redirect sysctl's standard output to syslog with facility.level
 >     "kern.info" and standard error to syslog with facility.level
 >     "kern.err".
 >   - Do not pass "-q" to sysctl, since we wanto to see the results.
 >   - Use "Running" and "Rerunning" instead of "Starting", since we do not
 >     really start anything, just run a program.
 >   - Do nothing on "stop", since ther is no running daemon to stop.

Committed, thanks. Sorry for the delay.

-- 
Bye, Peter Korsgaard
