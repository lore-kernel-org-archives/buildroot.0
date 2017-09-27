From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 21:21:24 +0200
Subject: [Buildroot] [PATCH] openntpd: fix build with musl
In-Reply-To: <cd1a6a1cfa3a72fab2856192ffb16dee2dc9acc5.1506429455.git.baruch@tkos.co.il>
References: <cd1a6a1cfa3a72fab2856192ffb16dee2dc9acc5.1506429455.git.baruch@tkos.co.il>
Message-ID: <20170927212124.20eaf823@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Sep 2017 15:37:35 +0300, Baruch Siach wrote:
> The recent version bump added a local sys/cdefs.h header that overrides
> the internal libc provided one. But since musl does not use this header,
> the __dead definition in this file is missing. Add a patch that moves
> the __dead definition to sys/types.h.
> 
> Update the autoreconf reason comment. Current openntpd ships libtool
> version 2.4.2 that Buildroot can safely patch.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2b1/2b14b7012b93f0f2bfaf9e61435dd8826217d481/
> http://autobuild.buildroot.net/results/7b0/7b08c987ce200deefa21ba85a9361d818be6b206/
> http://autobuild.buildroot.net/results/230/2304c4de26bd6217b79aa035be340a3c81497cbd/
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-Revert-use-__dead-macro-from-sys-cdefs.h.patch | 91 ++++++++++++++++++++++
>  package/openntpd/openntpd.mk                       |  2 +-
>  2 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 package/openntpd/0001-Revert-use-__dead-macro-from-sys-cdefs.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
