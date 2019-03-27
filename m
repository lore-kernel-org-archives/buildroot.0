From: Andreas Naumann <dev@andin.de>
Date: Wed, 27 Mar 2019 23:13:37 +0100
Subject: [Buildroot] [PATCH v4 6/6] qt5: Remove *.la/*.prl fixup script
In-Reply-To: <20190322183904.22401-7-anaumann@ultratronik.de>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-7-anaumann@ultratronik.de>
Message-ID: <502c3f48-3eb7-7d0b-dff6-c00bcbdf9658@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'd really be interested if somebody remembers why this was needed. *.la
files are fixed in another generic step anyway, so why do it twice?
Also, I have not found absolute /usr/lib pathes in any of the prl files
without this.

regards,
Andreas


Am 22.03.19 um 19:39 schrieb Andreas Naumann:
> After fixing Prefix in our custom qt.conf, Qt computes and embeds the
> correct sysroot prefixed pathes in all *.la and *.prl files.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de> --- 
> package/pkg-qmake.mk | 1 - 1 file changed, 1 deletion(-)
> 
> diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk index 
> 11cfb809fc..9293253fae 100644 --- a/package/pkg-qmake.mk +++ 
> b/package/pkg-qmake.mk @@ -77,7 +77,6 @@ define 
> $(2)_INSTALL_STAGING_CMDS $$(TARGET_MAKE_ENV) \ $$($(2)_MAKE_ENV) \ 
> $$(MAKE) -C $$($$(PKG)_SRCDIR) $$($(2)_INSTALL_STAGING_OPTS) - 
> $$(QT5_LA_PRL_FILES_FIXUP) endef endif
> 
> 
