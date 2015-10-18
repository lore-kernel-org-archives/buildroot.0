From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 17:38:45 +0200
Subject: [Buildroot] [PATCHv3] syslog-ng: New package
In-Reply-To: <1444811658-16549-1-git-send-email-judge.packham@gmail.com>
References: <20151014100147.205b90f3@free-electrons.com>
 <1444811658-16549-1-git-send-email-judge.packham@gmail.com>
Message-ID: <20151018173845.62e62bd9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Wed, 14 Oct 2015 21:34:18 +1300, Chris Packham wrote:
> syslog-ng is an enhanced log daemon, supporting a wide range of input
> and output methods: syslog, unstructured text, queueing, SQL & NoSQL.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
> Changes since v1:
> - add hash file
> - use simplified logging configuration for buildroot
> - don't install man pages

Applied with a number of changes:

    [Thomas:
     - Rewrap Config.in.help text
     - Pass --pidfile option when starting syslog-ng so that its PID file
       is created in /var/run/syslog-ng.pid, which allows
       start-stop-daemon to actually stop syslog-ng. Without this,
       S01logging was not able to stop syslog-ng.
     - Pass the executable path at stop time in S01logging, so that
       start-stop-daemon can check we're not incorrectly stopping
       something completely different.
     - Add busybox as a dependency of syslog-ng if busybox is enabled,
       since we want to override Busybox's S01logging init script.
     - Simplify the python condition, since python and python3 are
       mutually exclusive.
     - Rewrap the comment above SYSLOG_NG_FIXUP_CONFIG.]
    
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
