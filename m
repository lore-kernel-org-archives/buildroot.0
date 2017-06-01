From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:42:33 +0200
Subject: [Buildroot] [PATCH] sudo: add upstream security patch for
	CVE-2017-1000367
In-Reply-To: <20170531064718.13667-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 31 May 2017 08:47:18 +0200")
References: <20170531064718.13667-1-peter@korsgaard.com>
Message-ID: <87shjjhiqu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > CVE-2017-1000367 - Potential overwrite of arbitrary files on Linux
 > On Linux systems, sudo parses the /proc/[pid]/stat file to determine the
 > device number of the process's tty (field 7).  The fields in the file are
 > space-delimited, but it is possible for the command name (field 2) to
 > include spaces, which sudo does not account for.  A user with sudo
 > privileges can cause sudo to use a device number of the user's choosing by
 > creating a symbolic link from the sudo binary to a name that contains a
 > space, followed by a number.

 > If SELinux is enabled on the system and sudo was built with SELinux support,
 > a user with sudo privileges may be able to to overwrite an arbitrary file.
 > This can be escalated to full root access by rewriting a trusted file such
 > as /etc/shadow or even /etc/sudoers.

 > For more details, see: https://www.sudo.ws/alerts/linux_tty.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
