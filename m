From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:28:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/nginx: disallow AIO support on
 arc
In-Reply-To: <1417871738-13421-1-git-send-email-s.martin49@gmail.com>
References: <1417871738-13421-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141207212822.5fb1d702@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat,  6 Dec 2014 14:15:37 +0100, Samuel Martin wrote:
> The nginx AIO support cannot build on arc, because it hardcodes
> the usage of SYS_eventfd(), while it should just use eventfd() from
> the C library.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/f3e/f3e2c7a937517a5444f8c6cc0b02692af897b3e0/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/nginx/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied after slightly tweaking the comment as suggested by
Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
