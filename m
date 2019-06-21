From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 21:41:30 +0200
Subject: [Buildroot] syslog-ng test does not work due to lack of random
 numbers
Message-ID: <20190621214130.1074b702@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The syslog-ng runtime test is no longer working:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/237108732

I had a look, and the problem is that syslog-ng is stuck when starting,
waiting for random numbers. strace shows:

[pid    65] open("/dev/random", O_RDONLY|O_LARGEFILE) = 6
[pid    65] _newselect(7, [6], NULL, NULL, NULL

And then nothing.

Adding haveged to the configuration would have been an option, but
haveged is started as S21haveged, while syslog-ng is started as
S01syslog-ng, so obviously, this won't help.

What should we do ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
