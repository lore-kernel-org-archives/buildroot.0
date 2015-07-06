From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 15:49:59 +0200
Subject: [Buildroot] [PATCH 1/2] system: allow using mdev for firmware
 loading only
In-Reply-To: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>
References: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150706154959.4ac7d085@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On Mon,  6 Jul 2015 15:09:34 +0200, Luca Ceresoli wrote:
> Busybox's mdev nicely provides the ability to load a firmware requested by
> the kernel.
> 
> However, when using a static /dev management, mdev is not installed as a
> hotplug helper (i.e. S10mdev is not installed) and
> CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not enabled in the busybox
> configuration.
> 
> Provide a knob for static /dev users to easily enable mdev for firmware
> loading.
> 
> This is just a matter of extending the ifeq condition around the S10mdev
> installation and kconfig fixups that enable the needed configuration in
> busybox. But leave mdev.conf installation under the old condition, it's
> not needed for firmware loading.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Are you really a poor soul stuck with a pre-2.6.32 kernel preventing
you from using devtmpfs ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
