From: pierre <devpfl@gmail.com>
Date: Sun, 20 Nov 2016 19:58:32 +0100
Subject: [Buildroot] [PATCH 4/4] package/efl: add Evas GL DRM Engine
 support
In-Reply-To: <0ffc3f79-6c30-3b06-3dcd-f0d0d447d248@gmail.com>
References: <20160917191442.7ea32f90@free-electrons.com>
 <0ffc3f79-6c30-3b06-3dcd-f0d0d447d248@gmail.com>
Message-ID: <8e86826d-c754-9d88-d756-1888b10bd6b6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I try to reply to this mail :

http://lists.busybox.net/pipermail/buildroot/2016-September/172422.html

I am not sure I set my email header right..


> -------- Message transf?r? --------
> Sujet : Re: [Buildroot] [PATCH 4/4] package/efl: add Evas GL DRM Engine support
> Date : Sat, 17 Sep 2016 19:14:42 +0200
> De : Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Organisation : Free Electrons
> Pour : Romain Naour <romain.naour@gmail.com>
> Copie ? : buildroot at buildroot.org
>
> Hello,
>
> On Wed,  7 Sep 2016 23:08:43 +0200, Romain Naour wrote:
>
>> diff --git a/package/efl/Config.in b/package/efl/Config.in
>> index 6171b29..c6c26d8 100644
>> --- a/package/efl/Config.in
>> +++ b/package/efl/Config.in
>> @@ -208,6 +208,16 @@ comment "Evas DRM Engine needs mesa3d w/ EGL support, threads"
>>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL
>>  	depends on BR2_PACKAGE_EFL_ELPUT
>>
>> +config BR2_PACKAGE_EFL_GL_DRM
>
> Is it useful to have it as a separate option from BR2_PACKAGE_EFL_DRM ?
> In which case can BR2_PACKAGE_EFL_DRM without BR2_PACKAGE_EFL_GL_DRM be
> useful ?
>
>> +	bool "Evas GL DRM Engine"
>> +	depends on BR2_PACKAGE_EFL_DRM
>> +	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
>
> So perhaps "BR2_PAKCAGE_EFL_GLES_DRM" is a better name? "GL" usually
> refers to "full OpenGL", as opposed to OpenGL ES.
>
>> +	help
>> +	  This option enable building support for the Evas DRM Engine.
>
> This help text is wrong, as it is just a copy/paste of the one of
> BR2_PACKAGE_EFL_DRM.
>
>> +
>> +comment "Evas GL DRM Engine needs Evas DRM Engine, OpenGL ES w/ EGL"
>> +	depends on BR2_PACKAGE_EFL_DRM && !BR2_PACKAGE_EFL_OPENGLES
>
> I find all those DRM/OpenGLES options in the efl package very
> confusing. Are all those options needed? What are the use cases for the
> different possible cases?

I am agree EFL and DRM are confusing. And it is not finished yet. They 
are doing an other DRM implementation 'DRM2'.

https://blogs.s-osg.org/introducing-new-improved-ecore_drm2-library/

But, you are asking for use case. So, here is mine :

I am doing a stand alone application on imx6. I am using EFL to run on 
top of DRM. Without X or wayland. My application is simple, I am not 
sure if the support of opengles is good for me or not.. as the boot time 
is important for me. Maybe loading opengl libs at start would slow down 
start up. I don't know..

I will resend the patch of Romain Naour, they are usefull for me.
http://patchwork.ozlabs.org/patch/671260
http://patchwork.ozlabs.org/patch/671261


>
> Thanks,
>
> Thomas

Cheers,

Pierre Floury
