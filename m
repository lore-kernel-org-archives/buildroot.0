From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 16:22:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/syrepo: fix SysV init script
In-Reply-To: <20200420095738.16104-1-heiko.thiery@gmail.com>
References: <20200420095738.16104-1-heiko.thiery@gmail.com>
Message-ID: <20200425162221.5105443c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

Minor nit: typo in commit title: syrepo -> sysrepo. More questions below.

On Mon, 20 Apr 2020 11:57:38 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The sysrepo-plugind does not support to be controlled via the PID by the
> start-stop-daemon. This is because sysrepo-plugind does a fork.
> Thus the daemon is running with another PID known by start-stop-daemon.

"known" by start-stop-daemon, or "not known" ?

Also, it is not very clear. Indeed, in the "start" step, you're not
asking start-stop-daemon to create a PID file using the -m option. So
you're relying on the daemon to create one. Is this PID file incorrect
? Normally, when it is created by the daemon itself, even if the daemon
forks, it should be fine.

Otherwise, can you ask the daemon not to fork, and let
start-stop-daemon take care of this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
