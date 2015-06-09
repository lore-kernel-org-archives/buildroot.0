From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:55:39 +0200
Subject: [Buildroot] [PATCH 16/32 v2] package/matchbox-common: fix
 dependencies
In-Reply-To: <20150609215104.GA3671@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
 <9fa81fd7cbd6c1694dd4718ccf1ec24fe45f63fe.1433362840.git.yann.morin.1998@free.fr>
 <20150609230440.6a91bd70@free-electrons.com>
 <20150609215104.GA3671@free.fr>
Message-ID: <20150609235539.60591c63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Jun 2015 23:51:04 +0200, Yann E. MORIN wrote:

> As far as I understand it, matchbox-common installs the "desktop
> folders" which are only meaningful with a "desktop manager", i.e. either
> matchbox-panel or matchbox-desktop.
> 
> Conversely, neither "matchbox-panel" nor "matchbox-desktop" require
> "matchbox-common".
> 
> So I still believe the dependency is correct:
>   - no reason to expose matchbox-common if neither matchbox-panel nor
>     matchbox-desktop is available,
>   - expose matchbox-common when either or both are enabled,
>   - no reason to forcibly select matchbox-common from either of those
>     two packages.

Hum, well then in such cases, for other packages in Buildroot, we
simply don't have any "depends on". We don't try to hide libraries when
no application using them is enabled, for example.

> [
> Unrelated to that patch, but worth commenting on, however:
> 
> Besides, matchbox-panel and matchbox-desktop are not mutually exclusive
> at build time; at runtime, they can't both run simultaneously on the
> same X display, probably (it would be like running both Kwin and Unity
> at the same time on the same X display).
> ]

I haven't looked at all, but isn't matchbox-desktop taking care of the
"desktop" (i.e background, etc.) while matchbox-panel is taking care
really of the panel (with the menu to start applications, the taskbar
and al.) ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
