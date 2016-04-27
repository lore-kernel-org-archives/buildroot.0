From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Wed, 27 Apr 2016 16:54:32 -0300
Subject: [Buildroot] [PATCH 2/8] package/glmark2: gl support also
 depends on X.org
In-Reply-To: <20160427214946.2e9dcb25@free-electrons.com>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
 <1461586822-1003-2-git-send-email-bernd.kuhls@t-online.de>
 <20160427213230.0ee9fe71@free-electrons.com>
 <5721153E.6040608@free-electrons.com>
 <20160427214946.2e9dcb25@free-electrons.com>
Message-ID: <572118F8.90508@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/04/16 16:49, Thomas Petazzoni wrote:

> Not sure what you mean here. Do you mean we should have a
> BR2_PACKAGE_MESA3D_WAYLAND_EGL blind option?

Hi.
wayland-egl is basically (IIRC, i may miss a bit) a small piece of code 
of egl surface copy accelerator for wayland, which only mesa3d provides 
for now (like always when wayland is enabled).
So it should really be BR2_PACKAGE_PROVIDES_WAYLAND_EGL since i expect 
some other EGL stack will provide it eventually to play nice - 
essentially required for pure libgtk3 wayland support (example: 
rpi-userland can't work with libgtk3 that way, though i think that piece 
of code from mesa3d could be stripped out and work, maybe not with the 
greatest level of performance and probably somewhat grey regarding 
licensing).
Regards.
