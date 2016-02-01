From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 09:06:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: Fix install,
 procps-ng does not use /usr/bin anymore
In-Reply-To: <1454304096-22841-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454304096-22841-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160201090622.04980cd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Mon,  1 Feb 2016 06:21:36 +0100, Bernd Kuhls wrote:
> We do not need to move binaries around anymore since this commit:
> https://gitlab.com/procps-ng/procps/commit/430b559ba2826f80dffa840622ae0fc744000b13
> 
> Fixes
> http://autobuild.buildroot.net/results/ab7/ab7ed83d60823c1b023c7b76fcbe9c20d537ed4c//
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/procps-ng/procps-ng.mk | 12 ------------
>  1 file changed, 12 deletions(-)

Does it mean we can remove:

        --prefix=/usr \
        --exec-prefix=/ \
	...
        --libdir=/usr/lib \
        --bindir=/bin \
        --sbindir=/sbin

from procps-ng.mk ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
