From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 03 May 2020 19:15:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/cegui: select libglu when libgl
 is detected
References: <20200428195844.48124-1-b.bilas@grinn-global.com>
 <20200428195844.48124-2-b.bilas@grinn-global.com>
 <20200429225315.5d39a390@windsurf.home>
 <605471f7-f313-6c79-af48-a36b928013f3@grinn-global.com>
Message-ID: <bqa3ogxjat.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Thu, 30 Apr 2020 21:54:15 +0200 schrieb Bartosz Bilas:

> Are you sure? There is a couple of packages which have similar fix such
> as:
> 
> package/ogre/Config.in:??? select BR2_PACKAGE_LIBGLU # GL/glu.h

sent http://patchwork.ozlabs.org/project/buildroot/patch/
20200503171227.1411086-1-bernd.kuhls at t-online.de/

which removes the libglu dependency coming from upstream-included glew.h.

> package/supertux/Config.in:??? select BR2_PACKAGE_LIBGLU # GL/glu.h

dito, sent http://patchwork.ozlabs.org/project/buildroot/patch/
20200503171227.1411086-2-bernd.kuhls at t-online.de/

> package/lugaru/Config.in:?? ?select BR2_PACKAGE_LIBGLU # GL/glu.h

This package directly includes GL/glu.h:

https://bitbucket.org/osslugaru/lugaru/src/
f6049187585733143f2fb2d688097cc711e15cf0/Source/gamegl.h#lines-42

and does not make use of libglew at all.

Cegui also directly includes GL/glu.h:

https://github.com/cegui/cegui/blob/master/cegui/include/CEGUI/
RendererModules/OpenGL/GL.h#L49

which makes libglu a hard dependency for this package even when
-DGLEW_NO_GLU was added to CXXFLAGS.

Regards, Bernd
