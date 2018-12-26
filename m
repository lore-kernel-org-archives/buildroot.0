From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 21:33:58 +0100
Subject: [Buildroot] [PATCH] package/solarus: bump to version 1.6.0
In-Reply-To: <20181223133317.3490-1-romain.naour@gmail.com>
References: <20181223133317.3490-1-romain.naour@gmail.com>
Message-ID: <20181226213358.01ef170c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Sun, 23 Dec 2018 14:33:17 +0100, Romain Naour wrote:
> Here are the big features in Solarus 1.6:
> 
>     * OpenGL backend and support for GLSL shaders (by Stdgregwar and Vlag)

I am a bit confused because this OpenGL dependency now seems to be
mandatory, but you don't make it mandatory.

cmake/AddDependencies.cmake contains:

find_package(OpenGL)
if(NOT OPENGL_FOUND)
  find_package(OpenGLES2 REQUIRED)
endif()

So it seems like it wants either OpenGL or OpenGL ES2, no?

In any case, if it's really not mandatory, passing the appropriate
-D<blah>=OFF to explicitly disable OpenGL support would be good.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
