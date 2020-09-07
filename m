From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:51:20 +0200
Subject: [Buildroot] [PATCH v2] package/htpdate: new package
In-Reply-To: <20200807205806.1580019-1-angelo@amarulasolutions.com>
References: <20200807205806.1580019-1-angelo@amarulasolutions.com>
Message-ID: <20200907235120.2b46ab87@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Fri,  7 Aug 2020 22:58:06 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Adding htpdate, a time syncronization software based on http.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

I've applied after fixing some minor issues. First, some check-package
warnings:

package/Config.in:2085: Packages in: menu "Networking applications",
                        are not alphabetically ordered;
                        correct order: '-', '_', digits, capitals, lowercase;
                        first incorrect package: hplip
package/htpdate/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

> +HTPDATE_VERSION = 1.2.4
> +HTPDATE_SITE = $(call github,angeloc,htpdate,v$(HTPDATE_VERSION))
> +HTPDATE_LICENSE = GPL-2.0-or-later

We use GPL-2.0+ in Buildroot, not GPL-2.0-or-later.

> +define HTPDATE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) CC=$(TARGET_CC) $(MAKE) -C $(@D) $(HTPDATE_BUILD_OPTS)

I've changed CC=$(TARGET_CC) to $(TARGET_CONFIGURE_OPTS) so that our
CFLAGS are passed.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
