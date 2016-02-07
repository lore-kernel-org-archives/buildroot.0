From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:16:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/irda-utils: fix musl build
In-Reply-To: <1454148798-28228-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454148798-28228-1-git-send-email-bernd.kuhls@t-online.de>
 <1454148798-28228-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207221650.2ee89791@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 11:13:18 +0100, Bernd Kuhls wrote:

> diff --git a/package/irda-utils/0004-musl.patch b/package/irda-utils/0004-musl.patch
> new file mode 100644
> index 0000000..e3e766f
> --- /dev/null
> +++ b/package/irda-utils/0004-musl.patch
> @@ -0,0 +1,37 @@
> +Fix musl build
> +
> +Downloaded from
> +http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This...

> +
> +
> +Replace use of <net/if_packet.h> with <linux/if_packet.h>.
> +
> +kernel headers <linux/if_packet.h> already provides the
> +needed definitions, moreover not all libc implementations
> +provide if_packet.h e.g. musl
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending

... should have been here.

Applied after fixing this.

Can you check if the patch has really been submitted upstream? I
quickly looked in the irda-utils archives, and couldn't find it. Also,
if you could submit upstream the other patches we have, it would be
great.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
