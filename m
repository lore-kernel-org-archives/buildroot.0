From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:52:02 +0200
Subject: [Buildroot] [PATCH] package/iptraf-ng: really add _GNU_SOURCE
 in CFLAGS
In-Reply-To: <1464441352-24940-1-git-send-email-romain.naour@gmail.com>
References: <1464441352-24940-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160528155202.77779355@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 15:15:52 +0200, Romain Naour wrote:
> When iptraf-ng is build with musl, it needs _GNU_SOURCE in CFLAGS to define
> the content of "struct tcphdr".
> 
> iptraf-ng.mk try to add _GNU_SOURCE in CFLAGS but it's not taken into account.
> 
> Add it using IPTRAF_NG_CONF_ENV instead of IPTRAF_NG_MAKE_ENV.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a1b/a1b18f2e3d075d349c19536a7c5553f24b75a323
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/iptraf-ng/iptraf-ng.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
