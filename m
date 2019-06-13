From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Jun 2019 13:28:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr-plugin-vnsiserver: needs
 host-gettext
In-Reply-To: <20190613045042.31272-1-bernd.kuhls@t-online.de>
References: <20190613045042.31272-1-bernd.kuhls@t-online.de>
Message-ID: <20190613132842.21409a0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jun 2019 06:50:42 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> msgfmt is needed to build vdr-plugin-vnsiserver
> https://github.com/FernetMenta/vdr-plugin-vnsiserver/blob/master/Makefile#L106
> 
> On hosts which provide msgfmt the build succeeds
> 
> msgmerge -U --no-wrap --no-location --backup=none -q -N po/lt_LT.po po/vnsiserver.pot
> msgmerge -U --no-wrap --no-location --backup=none -q -N po/de_DE.po po/vnsiserver.pot
> msgfmt -c -o po/lt_LT.mo po/lt_LT.po
> msgfmt -c -o po/de_DE.mo po/de_DE.po
> 
> On other systems the build fails:
> 
> msgmerge -U --no-wrap --no-location --backup=none -q -N po/de_DE.po po/vnsiserver.pot
> msgmerge -U --no-wrap --no-location --backup=none -q -N po/lt_LT.po po/vnsiserver.pot
> fopen: No such file or directory
> fopen: No such file or directory
> 
> Hopefully fixes
> http://autobuild.buildroot.net/results/777/77784c9c169b7cee63ad331c5af9eede1ab0ee00/
> and many others.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I think we have a better proposal for this:
http://patchwork.ozlabs.org/patch/1074926/. I switched it back to the
"New" state.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
