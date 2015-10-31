From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 18:24:21 +0100
Subject: [Buildroot] [PATCH 2/4] package/dvblast: fix static linking
In-Reply-To: <408895b4d5738d83013ff4b493ba3293ae30e48d.1446219805.git.yann.morin.1998@free.fr>
References: <cover.1446219805.git.yann.morin.1998@free.fr>
 <408895b4d5738d83013ff4b493ba3293ae30e48d.1446219805.git.yann.morin.1998@free.fr>
Message-ID: <20151031182421.1b49965c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 30 Oct 2015 16:43:41 +0100, Yann E. MORIN wrote:
> dvblast links to -lev, which calls functions from -lm, like floor().
> 
> dvblast does not use libtool, so it does not pull in the libev
> dependencies when doing a static link.
> 
> Fix that by always pulling in -lm after -lev. We can not do it from the
> .mk, because libraries passed from the .mk end up at the beginning of
> the list.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/1f0/1f02f84fb926839a1adbe3af457bb909fdc44433/
>     http://autobuild.buildroot.org/results/6af/6af3abcdced1cc689a59fe11483f5cdcae0cfd38/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Julian Scheel <julian@jusst.de>
> ---
>  package/dvblast/0001-missing-lm.patch | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/dvblast/0001-missing-lm.patch

Applied, thanks. Please submit the patch upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
