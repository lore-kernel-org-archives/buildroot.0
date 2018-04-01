From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 01 Apr 2018 09:30:43 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
References: <20180401070337.18301-1-bernd.kuhls@t-online.de>
 <trinity-60c51855-aef6-4353-90a8-2e1f048863e2-1522567079284@3c-app-mailcom-bs16>
Message-ID: <3ee6pexo6d.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi daggs,

Am Sun, 01 Apr 2018 09:17:59 +0200 schrieb daggs:

> I'm trying to understand this change, does this means libamlogic is
> missing something or kodi doesn't supports gles anymore?

it means that buildroot does not provide the OpenGL ES libraries needed 
for amlogic support in Kodi.

> also, can you explain how Libreelec provided pre-compiled OpenGL ES
> libraries for AML are related to this? the link you've added points to a
> systemd script

Please have a look at https://github.com/LibreELEC/LibreELEC.tv/blob/
master/packages/graphics/opengl-meson/package.mk#L42, it states:

"opengl-meson: OpenGL ES pre-compiled libraries for Mali GPUs found in 
Amlogic Meson SoCs"

Atm these libraries are not provided by buildroot, so in the current 
state, buildroot can not build Kodi with amlogic support, this patch 
fixes the problem. If someone is interested in amlogic support in Kodi 
please send patches to provide the needed libraries.

Regards, Bernd
