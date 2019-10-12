From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 17:40:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva: fix mesa3d glx support
References: <20191001060520.1191-1-bernd.kuhls@t-online.de>
 <20191008233258.2537f1dc@windsurf>
Message-ID: <fo897gx8vh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 08 Oct 2019 23:32:58 +0200 schrieb Thomas Petazzoni:
>> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
>> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
>>  LIBVA_DEPENDENCIES += mesa3d
> 
> I think that depending on mesa3d and a mesa3d-specific option is
> probably not correct. Indeed, a different OpenGL implementation than
> Mesa3D can provide OpenGL GLX. For example, the nvidia-driver and
> amd-catalyst drivers I believe also provide OpenGL GLX.

Hi Thomas,

you are right, sent patch: http://patchwork.ozlabs.org/patch/1175726/

Regards, Bernd
