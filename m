From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:09:19 +0200
Subject: [Buildroot] [PATCH v3] modem-manager: select libgudev,
 if systemd is enabled
In-Reply-To: <1441955387-6002-1-git-send-email-yegorslists@googlemail.com>
References: <1441955387-6002-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150920150919.7b658f6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear yegorslists at googlemail.com,

On Fri, 11 Sep 2015 09:09:47 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> When eudev is used as the udev provider, libgudev is automatically
> provided as it is part of eudev. However, when systemd is used as
> the udev provider, libgudev is not provided, and needs to be built
> separately. This is why we select the libgudev package only if
> systemd is used.
> 
> Fixes: http://autobuild.buildroot.net/results/d59/d597a81271a082c8252e2333906815c437b6576d/
> 
> While at it, group the existing dbus select together with the dbus-glib
> select, so that all "select" statements are together.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v3: reduce comments and put select/depends reodering again (Thomas Petazzoni)
>         v2: change patch name (Vicente Olivert Riera)
>             add fix description (Vicente Olivert Riera)
>             add explanations to Config.in and *.mk files (Vicente Olivert Riera)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
