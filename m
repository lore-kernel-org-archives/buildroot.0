From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 28 Dec 2018 16:25:31 +0100
Subject: [Buildroot] [PATCH] package/solarus: bump to version 1.6.0
In-Reply-To: <20181226213358.01ef170c@windsurf.home>
References: <20181223133317.3490-1-romain.naour@gmail.com>
 <20181226213358.01ef170c@windsurf.home>
Message-ID: <ce4698b6-7b30-51ae-bff0-f9ba3d417b05@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 26/12/2018 ? 21:33, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Sun, 23 Dec 2018 14:33:17 +0100, Romain Naour wrote:
>> Here are the big features in Solarus 1.6:
>>
>>     * OpenGL backend and support for GLSL shaders (by Stdgregwar and Vlag)
> 
> I am a bit confused because this OpenGL dependency now seems to be
> mandatory, but you don't make it mandatory.
> 
> cmake/AddDependencies.cmake contains:
> 
> find_package(OpenGL)
> if(NOT OPENGL_FOUND)
>   find_package(OpenGLES2 REQUIRED)
> endif()
> 
> So it seems like it wants either OpenGL or OpenGL ES2, no?
> 
> In any case, if it's really not mandatory, passing the appropriate
> -D<blah>=OFF to explicitly disable OpenGL support would be good.

The dependency on OpenGL is new with this release.
Also the dependency on OpenGLES doesn't build.

Since I can test only with OpenGL support (GLX) I disabled entirely the openGLES
support (which doesn't seems to build).

Best regards,
Romain


> 
> Thanks,
> 
> Thomas
> 
