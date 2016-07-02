From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:03:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/busybox: support spaces in
 module aliases in mdev
In-Reply-To: <1467462140-35190-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1467462140-35190-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <20160702150340.73f1723d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 15:22:20 +0300, Andy Shevchenko wrote:
> The new change which enabled automatic module loading on boot does not handle
> the cases when module alias includes spaces. It prevents modules to be loaded
> since script fails:
> 
>   % find /sys/ -name modalias | xargs sort -u
>   sort: /sys/devices/platform/Fixed: No such file or directory
> 
> First alias in question is "platform:Fixed MDIO bus".
> 
> Amend the script to support above like cases.
> 
> Note: the -z option to sort in Busybox depends on SORT_BIG, which is enabled
> in out busybox bundled configuration, so we can use it.
> 
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Fixes: 07f46c2b6dae ("package/busybox: support automatic module loading with mdev")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for this new version, but in the mean time, I had already
modified and applied your first version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
