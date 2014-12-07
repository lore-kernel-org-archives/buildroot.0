From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:02:07 +0100
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: bump to v3.7.1
In-Reply-To: <1417623505-5767-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1417623505-5767-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20141207230207.77875d75@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Wed,  3 Dec 2014 17:18:25 +0100, Angelo Compagnucci wrote:
> The main difference with v3.6.2 is that this patch calls "make defconfig"
> before make.
> "make defconfig" is called by the Makefile with .config file,
> so the original logic isn't changed.
> Calling "make defconfig" is required to correctly prepare dependencies file.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  boot/at91bootstrap3/at91bootstrap3.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks, I've applied your patch, but I've changed the logic: instead of
calling this "defconfig" target, I've changed the <pkg>_CONFIGURE_CMDS
step to use 'make <blabla>_defconfig', which is more logical.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
