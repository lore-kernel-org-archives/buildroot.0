From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Sep 2019 16:03:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/kompexsqlite: fixup the 'v'
 prefix in the version
In-Reply-To: <20190911172256.30003-1-fontaine.fabrice@gmail.com>
References: <20190911172256.30003-1-fontaine.fabrice@gmail.com>
Message-ID: <20190914160323.35da35da@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 11 Sep 2019 19:22:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the kompexsqlite version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> KOMPEXSQLITE_SOURCE and not KOMPEXSQLITE_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've applied to master, but I have a comment, see below.

> -KOMPEXSQLITE_VERSION = v1.10.12-1
> -KOMPEXSQLITE_SOURCE = $(KOMPEXSQLITE_VERSION).tar.gz
> +KOMPEXSQLITE_VERSION = 1.10.12-1
> +KOMPEXSQLITE_SOURCE = v$(KOMPEXSQLITE_VERSION).tar.gz
>  KOMPEXSQLITE_SITE = https://github.com/Aethelflaed/kompex-sqlite-wrapper/archive

When I look at
https://github.com/Aethelflaed/kompex-sqlite-wrapper/releases, to me it
seems like only the automatically generated tarballs are there. In such
cases, we should use the github macro instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
