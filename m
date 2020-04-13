From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 23:06:20 +0200
Subject: [Buildroot] [PATCH] package/exim: fix log and pid file paths
In-Reply-To: <20200302101902.8285-1-p.debruijn@unilogic.nl>
References: <20200302101902.8285-1-p.debruijn@unilogic.nl>
Message-ID: <20200413230620.10e385a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Mar 2020 11:19:02 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> both the logs and pid should not be placed in /var/spool
> 
> we place the log in /var/log/exim and
> we place the pid in /var/run/exim
> 
> using binary name subdirectory in both cases allows for the
> use of systemd's LogsDirectory and RuntimeDirectory statements
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Applied with an improved commit log. It would however be nice to
convert the exim init script to the "new" init script template, for
higher consistency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
