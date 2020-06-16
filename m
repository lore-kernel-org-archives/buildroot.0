From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Jun 2020 20:02:53 +0200
Subject: [Buildroot] [PATCH v3] package/libcamera: bump version to
 96fab38
In-Reply-To: <20200614170205.GH2346@scaer>
References: <20200611094228.14887-1-ps.report@gmx.net>
 <e96772e7-eec4-1b04-6889-1a11a05c4225@ideasonboard.com>
 <20200614170205.GH2346@scaer>
Message-ID: <20200616200253.17555c74@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, 14 Jun 2020 19:02:05 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

[...]

> > > +
> > > +ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
> > > +LIBCAMERA_DEPENDENCIES += qt5base
> > > +ifeq ($(BR2_PACKAGE_QT5TOOLS)$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),yy)
>
> BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS is already a sub-option of BR2_PACKAGE_QT5TOOLS,
> so the former can't be enabled if the latter is not. Thus, the following
> condition is enough:
>
>     ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
>

Same would apply to

	ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)

vs.
	ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)

and the source (package/libv4l/libv4l.mk) where I copied it from (and introduced it back in 2015)?

Regards,
Peter
