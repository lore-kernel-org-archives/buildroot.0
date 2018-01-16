From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 20:38:58 +0100
Subject: [Buildroot] [git commit] busybox: don't remove S01logging when
 CONFIG_SYSLOGD is disabled
In-Reply-To: <20180110220628.309B9835A1@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 10 Jan 2018 23:03:59 +0100")
References: <20180110220628.309B9835A1@busybox.osuosl.org>
Message-ID: <87a7xdfval.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=84e835ea9261b3e844f1a18489dd89253e3eb839
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The current busybox.mk explicitly removes S01logging if CONFIG_SYSLOGD
 > is disabled in the Busybox configuration. However:

 >  - This causes the removal of the S01logging script potentially
 >    installed by another package (currently syslog-ng, rsyslog and
 >    sysklogd can all install a S01logging script).

 >  - We generally don't try to clean-up stuff that we may have installed
 >    in a previous make invocation and that is no longer needed
 >    following a configuration change.

 > Fixes bug #10176

 > Reported-by: Karl Krach <mail@kkrach.de>
 > Fix-provided-by: Karl Krach <mail@kkrach.de>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
