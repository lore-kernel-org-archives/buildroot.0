From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:46:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/gdb: use stat() privided by the
 system
In-Reply-To: <20180909163750.14196-2-romain.naour@gmail.com>
References: <20180909163750.14196-1-romain.naour@gmail.com>
 <20180909163750.14196-2-romain.naour@gmail.com>
Message-ID: <20180912234648.0e8f5e9f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 18:37:50 +0200, Romain Naour wrote:
> Use the same workaround [1] as gnulib use to get the original
> definition of stat. Otherwise with musl toolchains, gnulib try to use
> rpl_stat which is not defined.
> 
> Fixes:
> https://gitlab.com/free-electrons/toolchains-builder/-/jobs/95552308
> 
> [1] http://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stat.c?id=c9d72f69bd201a1ab31464d91f234ea1817fe0e1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Upstream has fixed the issue. Could you try to backport upstream
commit 3c025cfe5efc44eb4dfb03b53dca28e75096dd1e instead, and see if it
solves the problem ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
