From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Apr 2016 22:46:54 +0200
Subject: [Buildroot] [PATCH 1/8] package/mesa3d: introduce new Kconfig
	option to indicate full OpenGL support
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
 <20160427213040.327325f8@free-electrons.com>
Message-ID: <XnsA5F7E7BF5206DID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20160427213040.327325f8 at free-electrons.com: 

> This way, BR2_PACKAGE_MESA3D_OPENGL_GL is a blind option, that
> indicates to mesa3d.mk whether full OpenGL support is enabled or not.

Hi Thomas,

the goal of my patch series was to make the presence of OpenGL support in
mesa3d visible to the user, your proposal is technically also fine with me
but it needs more technical experience by users to enable the correct
options to enable OpenGL support because the OpenGL option is a blind one.
Users need to analyse the .mk files to get to know what is needed for
certain features, these two philosophies can be seen at work with the Kodi
and the Freeswitch package; the Kodi package provides a long list of
options which enable other packages while the Freeswitch package, in its
current state, relies only on previously enabled packages. 

Is there a general preference in either direction? If we want to have as
few visible Kconfig options as possible, then hiding the OpenGL option is
ok, but if we want to show behind-the-stage dependencies to the user I
vote for a visible OpenGL option as well, which is only visible if OpenGL
support is active, like in my patch series. 

Regards, Bernd
