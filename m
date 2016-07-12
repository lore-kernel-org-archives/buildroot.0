From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 23:50:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix localstatdir
	directory.
In-Reply-To: <1468343360-15309-1-git-send-email-aduskett@codeblue.com> (Adam
 Duskett's message of "Tue, 12 Jul 2016 13:09:20 -0400")
References: <1468343360-15309-1-git-send-email-aduskett@codeblue.com>
Message-ID: <87zipm5xvp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > syslog-ng is built with the default buildroot flag localstatdir=/var
 > This causes three issues:

 > 1) syslog-ng creates two files (syslog-ng.ctl and syslog-ng.persist in /var)
 > which shouldn't have random files generated in it.

 > 2) SELinux expects it in it's default directory /var/run.

 > 3) This breakes read only file systems because /var/ usually isn't mounted as
 > a seperate filing system.

 > Setting the buildflag to the default /var/run
 > fixes all three of thee of these issues.

 > Signed-off-by: Adam Duskett <aduskett@codeblue.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
