From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 23:51:11 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/sdl2: remove
 sdl2-config.cmake
In-Reply-To: <20200505184303.609201-1-romain.naour@gmail.com>
References: <20200505184303.609201-1-romain.naour@gmail.com>
Message-ID: <20200624235111.0e70178b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 May 2020 20:43:02 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> We are using autotools build system for sdl2, so the sdl2-config.cmake
> include path are not resolved like for sdl2-config script [1].
> Remove sdl2-config.cmake file and avoid unsafe include path if this
> file is used by a cmake based package.
> 
> This trigger an issue with ogre 1.12.6 package that replaced
> FindSDL2.cmake by sdl2-config.cmake [2].
> 
> Thanks to Pavel Rojtberg for the help [3].
> 
> [1] https://bugzilla.libsdl.org/show_bug.cgi?id=4597
> [2] https://github.com/OGRECave/ogre/commit/6de6f9b4081a07c911932441700c54b72ec1ee1f
> [3] https://github.com/OGRECave/ogre/issues/1568
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: new patch
> ---
>  package/sdl2/sdl2.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

I've applied to master. However, this would really need to be fixed
upstream: if the sdl2-config.cmake is not "prepared" properly when the
autotools build system is used, then why is it installed by the
autotools build system ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
