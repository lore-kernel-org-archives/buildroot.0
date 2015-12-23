From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Wed, 23 Dec 2015 07:29:17 -0600
Subject: [Buildroot] [PATCH v7 1/1] package/unscd: new package
In-Reply-To: <20151223141340.2add43fd@free-electrons.com>
References: <1449068177-24100-1-git-send-email-rdkehn@yahoo.com>
 <20151222205808.2d24281e@free-electrons.com>
 <20151223125929.GA12722@dkarchlinux64.currentcomm.com>
 <20151223141340.2add43fd@free-electrons.com>
Message-ID: <20151223132917.GA12918@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Dec 23, 2015 at 02:13:40PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 23 Dec 2015 06:59:29 -0600, rdkehn at yahoo.com wrote:
> 
> > A PID file is created by unscd in /var/run/nscd/ when it is started.
> > The PID file is deleted when unscd is stopped; however, the
> > /var/run/nscd/ directory remains.
> > 
> > unscd can be started in debug mode (a.k.a foreground, -d option). In
> > doing so, PID file creation could be done in the init script as
> > requested. The problem I see here is that unscd logs to stderr when
> > started in debug mode.
> > 
> > Do you still prefer a patch for PID file creation in the init
> > script?
> 
> You can tell start-stop-daemon that the PID file is created by the
> daemon itself. Basically, pass just the -p <pid-file> option when
> starting and stopping the daemon. As long as you don't pass -m when
> starting the daemon, start-stop-daemon does not create the pid file.
> 
> See man start-stop-daemon(8) for all the details.
> 

Ah, you're not saying that you want stat-stop-daemon to create the
PID file. (It's early, coffee starting to kick in...)

Regards,
...doug
