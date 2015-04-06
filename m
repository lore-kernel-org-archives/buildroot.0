From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:32:51 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: migrate to pkg-kconfig
In-Reply-To: <1428328986-1625-1-git-send-email-yann.morin.1998@free.fr>
References: <1428328986-1625-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150406233251.5f8ee862@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  6 Apr 2015 16:03:06 +0200, Yann E. MORIN wrote:
> From: Mauro Condarelli <mc5686@mclink.it>
> 
> In at91bootstrap3, defconfig files are spread out in various
> sub-directories, so we can't easily construct the path to those
> defconfig files.
> 
> As it turns out, there are no two defconfig files named the same; they
> all contain at least the board name, plus some extra info. And there is
> always only one directory depth below board/ where all defconfig files
> are to be found.
> 
> Also, at91bootstrap3's own Makefile relies on this single-match as it
> runs a 'find' command to locate the defconfig file.
> 
> So, even though we do not know the path to the defconfig file, we can
> construct a shell-glob quite easily (in the hope that there will never
> be more than one directory depth).
> 
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> [yann.morin.1998 at free.fr:
>   - remove custom _CONFIGURE_CMDS, handled by pkg-kconfig  (Thomas)
>   - remove redundant intermediate variable
>   - fix using internal defconfig files
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
