From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Mar 2015 21:44:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: journald should use
	volatile storage
In-Reply-To: <1425201058-3946-1-git-send-email-nroach44@gmail.com> (Nathaniel
 Roach's message of "Sun, 1 Mar 2015 17:10:58 +0800")
References: <1425201058-3946-1-git-send-email-nroach44@gmail.com>
Message-ID: <87h9u4xxb1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathaniel" == Nathaniel Roach <nroach44@gmail.com> writes:

 > (By default)
 > This fixes https://bugs.busybox.net/show_bug.cgi?id=7892

 > Journald was attempting to write the logs to file before the
 > underlying file system was up. A proposed solution was to bring
 > /tmp up beforehand, but that did not always solve the issue.

 > In addition, since the logging directory was a tmpfs to begin with
 > (/var/log -> /tmp) this should save some cycles.

 > Signed-off-by: Nathaniel Roach <nroach44@gmail.com>

Sorry, cannot reproduce this here. How do you see it exactly?

See bugtracker for details about my tests with
qemu_arm_versatile_defconfig.

-- 
Bye, Peter Korsgaard
