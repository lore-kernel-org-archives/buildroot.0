From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Jun 2014 08:51:29 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to v213
In-Reply-To: <1401833204-32300-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1401833204-32300-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140604085129.70751c98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Wed,  4 Jun 2014 00:06:44 +0200, Eric Le Bihan wrote:
> This patch bumps systemd to v213. This new version introduces
> systemd-timesyncd, a SNTP daemon, which requires a new user
> systemd-timesync to be created.
> 
> It also refreshes the patch for reverting the use of --relative option
> when calling `ln`. Since this version, the configure script checks if
> `ln` supports the --relative option and fails if it does not. Instead of
> reverting commit 446883528524429283626208928b51f49f28f810, which affects
> configure.ac, the configure script is directly patched to remove this
> check (hence avoiding an autoreconf).

The patch is nonetheless changing a Makefile.am, so it should need an
autoreconf anyway, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
