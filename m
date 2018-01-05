From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 5 Jan 2018 14:03:40 +0100
Subject: [Buildroot] [PATCH 2/3] package/waffle: new package
In-Reply-To: <20171229232748.28a799d3@windsurf.lan>
References: <20171225154923.18773-1-romain.naour@gmail.com>
 <20171225154923.18773-2-romain.naour@gmail.com>
 <20171229232748.28a799d3@windsurf.lan>
Message-ID: <72210198-42a8-d04a-6ea7-b42ac72565c3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 29/12/2017 ? 23:27, Thomas Petazzoni a ?crit?:
> Hello,
> 
> In fact, another question.
> 
> On Mon, 25 Dec 2017 16:49:22 +0100, Romain Naour wrote:
> 
>> +config BR2_PACKAGE_WAFFLE
>> +	bool "waffle"
>> +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
>> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBEGL
> 
> You require libgl *or* libegl. What about OpenGL ES ?
> 
> Indeed, when you have OpenGL ES, you generally have EGL support as
> well, but it seems weird that an optional dependency on OpenGL ES is
> not expressed. I am missing something ?

It's not expressed in the build system.

We need to enable one of these option while configuring Waffle:
waffle_has_glx		(OpenGL with X11)
waffle_has_wayland      (egl with wayland)
waffle_has_x11_egl      (egl with X11)
waffle_has_gbm		(mesa3d with EGL support)

So, Waffle can't be build with only OpenGLES.

Looking at the code, libGLESv2.so.2 library is loaded at runtime with dlopen().
I'm not sure how Waffle behave when this library is missing (for example with
the glx only case).

Best regards,
Romain

> 
> Thomas
> 
