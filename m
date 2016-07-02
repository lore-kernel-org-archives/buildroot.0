From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:16:25 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/busybox: support spaces in
 module aliases in mdev
In-Reply-To: <1467399379-945-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1467399379-945-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <20160702131625.156b07a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 21:56:19 +0300, Andy Shevchenko wrote:
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
> Fixes: 07f46c2b6dae ("package/busybox: support automatic module loading with mdev")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  package/busybox/S10mdev | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master with the change suggested by Yann. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
