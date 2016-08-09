From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 22:50:41 +0200
Subject: [Buildroot] [PATCH] system: zoneinfo usable by musl, too
In-Reply-To: <1470774355-26597-1-git-send-email-yann.morin.1998@free.fr>
References: <1470774355-26597-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160809225041.64ba4c43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 22:25:55 +0200, Yann E. MORIN wrote:
> Currently, we limit installing zoneinfo to non-musl toolchain, by lack
> of knowledge on how it would work on musl.
> 
> Turns out that musl uses the same zoneinfo format as glibc does.
> 
> Make it possible to install the TZ info whatever the C library; for
> musl, use tzdata as for glibc.
> 
> Thanks Rich! ;-)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Rich Felker <dalias@aerifal.cx>
> Cc: Marc Khouri <marc@khouri.ca>
> 
> ---
> Marc, with this patch, your libical change will just need to be a select
> on BR2_TARGET_TZ_INFO.
> ---
>  system/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
