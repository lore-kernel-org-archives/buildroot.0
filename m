From: daggs <daggs@gmx.com>
Date: Sun, 1 Apr 2018 09:59:19 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
In-Reply-To: <3ee6pexo6d.ln2@ID-313208.user.individual.net>
References: <20180401070337.18301-1-bernd.kuhls@t-online.de>
 <trinity-60c51855-aef6-4353-90a8-2e1f048863e2-1522567079284@3c-app-mailcom-bs16>
 <3ee6pexo6d.ln2@ID-313208.user.individual.net>
Message-ID: <trinity-6857ce13-66c1-4750-93d8-23958a21ffa8-1522569558927@3c-app-mailcom-bs16>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Bernd,

> Sent: Sunday, April 01, 2018 at 10:30 AM
> From: "Bernd Kuhls" <bernd.kuhls@t-online.de>
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
>
> Hi daggs,
> 
> Am Sun, 01 Apr 2018 09:17:59 +0200 schrieb daggs:
> 
> > I'm trying to understand this change, does this means libamlogic is
> > missing something or kodi doesn't supports gles anymore?
> 
> it means that buildroot does not provide the OpenGL ES libraries needed 
> for amlogic support in Kodi.
> 
> > also, can you explain how Libreelec provided pre-compiled OpenGL ES
> > libraries for AML are related to this? the link you've added points to a
> > systemd script
> 
> Please have a look at https://github.com/LibreELEC/LibreELEC.tv/blob/
> master/packages/graphics/opengl-meson/package.mk#L42, it states:
> 
> "opengl-meson: OpenGL ES pre-compiled libraries for Mali GPUs found in 
> Amlogic Meson SoCs"
> 
> Atm these libraries are not provided by buildroot, so in the current 
> state, buildroot can not build Kodi with amlogic support, this patch 
> fixes the problem. If someone is interested in amlogic support in Kodi 
> please send patches to provide the needed libraries.
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

the OpenGL ES libraries are part of buildroot, see odroid-mali which uses version r6p1.
do you mean that they need to be upgraded?

Dagg.
