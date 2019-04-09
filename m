From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Apr 2019 23:21:42 +0200
Subject: [Buildroot] [PATCH] package/vdr-plugin-vnsiserver: package
 needs host-gettext to build correctly
In-Reply-To: <20190409174535.31768-1-giulio.benetti@micronovasrl.com>
References: <20190409174535.31768-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190409232142.5c751a17@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Tue,  9 Apr 2019 19:45:35 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> During building msgmerge is used, so at the moment if build environment
> doesn't provide it, build will fail.
> 
> Add host-gettext to VDR_PLUGIN_VNSISERVER_DEPENDENCIES.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

In retrospect, I think http://patchwork.ozlabs.org/patch/1074926/ is better.

In fact, my analysis of Fabrice's patch was wrong. Even if the
gettext-tiny issue gets resolved, vdr-plugin-vnsiserver (apparently)
still needs msgfmt/msgmerge unconditionally, so we would indeed need a
host-gettext dependency.

But Fabrice's patch makes that not necessary, by only installing the
i18n files when BR2_SYSTEM_ENABLE_NLS=y.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
