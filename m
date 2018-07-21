From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 15:25:57 +0200
Subject: [Buildroot] [PATCH v3 10/22] package/x11r7/xkeyboard-config:
 switch to xorgproto
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-11-bernd.kuhls@t-online.de>
 <20180702214801.GP2604@scaer> <omcn1fx702.ln2@ID-313208.user.individual.net>
 <20180715154441.GB2516@scaer>
Message-ID: <5sob2fx9u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 15 Jul 2018 17:44:41 +0200 schrieb Yann E. MORIN:

> However, I find it hard to believe that the xorg-proto, which supposedly
> provides prototype information, is only a runtime dependency.
> 
> Similarly, I also find it hard to accept that xlib-libx11 is only a
> runtime dependency.
> 
> I am afraid that only xapp-xkbcomp is actually a runtime dependency. The
> rest are really build-time dependencies. /me thinks.

Hi Yann,

xkeyboard-config does not install any binary files, only keyboard 
configuration data. No part of this package links to libx11 during the 
build. These commits done by Thomas and Peter introduced the current 
Config.in content and provide background information about the x11 
runtime dependencies:

https://git.buildroot.net/buildroot/commit/?
id=dde83bc4639a7bf80ddd0d66b9ea3a8cc0157d65

https://git.buildroot.net/buildroot/commit/?
id=2ce67935e80b2ea6b24f22ebf1e810eae3dcefe0

Regards, Bernd
