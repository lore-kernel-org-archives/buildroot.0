From: Bernhard Fischer <rep.nop@aon.at>
Date: Sat, 25 Nov 2006 12:25:56 +0100
Subject: [Buildroot] SDL_image, SDL_ttf & Co
In-Reply-To: <1164372612.4566ea842d1b4@imp2-g19.free.fr>
References: <1164372612.4566ea842d1b4@imp2-g19.free.fr>
Message-ID: <20061125112556.GB27344@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 24, 2006 at 01:50:12PM +0100, julien.boibessot at free.fr
wrote:
>Hi !
>
>I intend to add SDL_image, SDL_ttf (and probably some other) SDL
>extentions
>support to Buildroot and I'd like to know if the better way is to add
>these
>package generation inside "sdl/sdl.mk" or to create a "package/sdl_xx/"
>directory for each package ?

I'd put it in the existing sdl.mk

then
config BR2_PACKAGE_SDL_IMAGE
	bool "SDL_image"
	depends on BR2_PACKAGE_SDL
	help
	  foo
