From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 16:05:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Fix Raspberry Pi support
 in package SDL2
In-Reply-To: <20180118081528.16612-1-g@maral.me>
References: <20180116175054.GB28324@enterprise.starfleet>
 <20180118081528.16612-1-g@maral.me>
Message-ID: <20180118160514.0684a720@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for respining! It looks much better, but there's still one thing
I'm not sure is very good. See below.

On Thu, 18 Jan 2018 00:15:28 -0800, Guillermo A. Amaral wrote:

> ++#if SDL_VIDEO_DRIVER_RPI
> ++    path = SDL_getenv("LD_LIBRARY_PATH");
> ++    if (path) {
> ++        const int path_size = SDL_strlen(path) + 1 + sizeof(g_rpi_opt_path);
> ++        char *new_path = SDL_calloc(1, path_size);
> ++        strcat(new_path, path);
> ++        strcat(new_path, ":");
> ++        strcat(new_path, g_rpi_opt_path);
> ++        SDL_setenv("LD_LIBRARY_PATH", new_path, 1);
> ++        SDL_free(new_path);
> ++    } else {
> ++        SDL_setenv("LD_LIBRARY_PATH", g_rpi_opt_path, 1);
> ++    }
> ++    path = NULL;

Yerk, upstream has accepted this? To me, it looks really terrible to
set LD_LIBRARY_PATH from within a program. Is it really considered a
good practice ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
