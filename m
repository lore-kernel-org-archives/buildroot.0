From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 2 Jul 2015 07:44:05 +0000
Subject: [Buildroot] [PATCH 2/2] package/pkg-kconfig: define
	KCONFIG_EDITORS_MAKE_ENV
In-Reply-To: <1435582227-26345-2-git-send-email-talz@ezchip.com>
References: <1435582227-26345-1-git-send-email-talz@ezchip.com>
 <1435582227-26345-2-git-send-email-talz@ezchip.com>
Message-ID: <1435823045.2966.23.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tal,

On Mon, 2015-06-29 at 15:50 +0300, Tal Zilcer wrote:
> From: Tal Zilcer <talz@ezchip.com>, 
> 
> When building a configuration editor we assume its for the HOST.
> However some packages might define MAKE_ENV as TARGET_MAKE_NEV.
> Using this variable adds to beginning of $(PATH),
> the directory $(HOST_DIR)/usr/bin.
> 
> This cause us to not use pkg-config from our host machine but the one
> from $(HOST_DIR)/usr/bin. This pkg-config does not support QT.
> Now when we try to run for example linux-xconfig we fail since QT is 
> not found.
> 
> To overcome this we defined a dedicated variable for the 
> configuration editors
> 
> Signed-off-by: Tal Zilcer <talz@ezchip.com>
> ---

I'm wondering why did you put 2 patches in one series?
 [1] https://patchwork.ozlabs.org/patch/489307/
 [2] https://patchwork.ozlabs.org/patch/489306/

I'd say these 2 patches solve completely different problems and so
should be posted as 2 separate patches compared to your [PATCH 1/2],
[PATCH 2/2].

The problem with series patches within series could not be applied
separately, that means chances are you may not get either applied
because:
 a) At least one patch could not be accepted by maintainer
 b) At least one patch required rework

So in case of (a) you'll need to resend appropriate patch separately
and in case of (b) you'll need to resend all patches in the series even
if only one patch was modified.

As for this one I really like it. IMHO problem and solution are very
valid.

The only note this patch won't apply clean on current master due to
recent changes in "package/pkg-kconfig.mk". I.e. rebase is required
now.

Please rebase this patch on top of the current master and resend this
patch (preferably separately from another patch of the current series).

Feel free to add:
Reviewed-by: Alexey Brodkin <abrodkin@synopsys.com>

-Alexey
