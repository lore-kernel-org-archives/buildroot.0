From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Sep 2017 08:59:57 +0200
Subject: [Buildroot] [PATCH 2/2] dash: enable line editting if libedit
 is selected.
In-Reply-To: <816883822.11304783.1506543568981.JavaMail.zimbra@datacom.ind.br>
References: <1506530514-27185-1-git-send-email-casantos@datacom.ind.br>
 <1506530514-27185-2-git-send-email-casantos@datacom.ind.br>
 <20170927211805.62bb4cfb@windsurf.lan>
 <816883822.11304783.1506543568981.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170928085957.04978e60@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Sep 2017 17:19:28 -0300 (BRT), Carlos Santos wrote:

> > This really looks like a "personal preference" configuration, that is
> > more relevant in a custom rootfs overlay, no?  
> 
> This is the default behavior of BusyBox's shell, which is used in 98.73%
> of the Buldroot installations, according to my statistics factory, so I
> think we should use it by default.

Hum, OK.

> >> +ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> >> +DASH_DEPENDENCIES += libedit
> >> +DASH_CONF_OPTS += --with-libedit
> >> +DASH_POST_INSTALL_TARGET_HOOKS += DASH_INSTALL_PROFILE  
> > 
> > What about --without-libedit in an else case ?  
> 
> In the case else there is no libedit to which not to link. :-)

We always try to explicitly disable features, so that configure scripts
don't misdetect a system-installed libedit for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
