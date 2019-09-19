From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 21:11:03 +0200
Subject: [Buildroot] [pkg-luarocks 3/6] pkg-luarocks: regen packages
 with external dependencies
In-Reply-To: <CAB0FRssGnc0G1XTb=SNEa=gONK42+L5gxife9QJQTS_P=v=SiQ@mail.gmail.com>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
 <20190918061915.31250-3-francois.perrad@gadz.org>
 <20190918093501.5b91d097@windsurf>
 <CAB0FRstytkW+C-PcTKXQubHJZRwryrGwHB5tr7j-4jwTZt6wCA@mail.gmail.com>
 <20190918211642.1517aa3f@windsurf>
 <CAB0FRssGnc0G1XTb=SNEa=gONK42+L5gxife9QJQTS_P=v=SiQ@mail.gmail.com>
Message-ID: <20190919211103.2057aa9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Thu, 19 Sep 2019 18:38:14 +0200
Fran?ois Perrad <francois.perrad@gadz.org> wrote:

> Previously, there is in the config file:
>     external_deps_dirs = { getenv('STAGING_DIR') .. [[/usr]] }
> and this path was globally used.
> 
> The config file is common for host-luarocks and luarocks,
> so this way is no longer doable.

We cannot pass a separate configuration file when building things for
the host and building things for the target ?

> `external_deps_dirs` has no equivalent as CLI option.
> But for each external dependency `BAR`, a CLI option `BAR_DIR` is available
> and must be set to `$(STAGING_DIR)/usr` (This is the LuaRocks way).
> 
> There are some explanations in the commit log 2/6.
> 
> If you look at the final point of the serie, the LuaRocks infrastructure is
> greatly improved:
>   - host-luarocks is now supported
>   - luarocks.mk contains no longer the cross-compilation stuff
>   - the macro _INSTALL_TARGET_CMDS in pkg-luarocks, contains all the
> cross-compilation stuff (better design compatible with per-package folders)
>   - luarocks is called without the full path of host-lua and without
> LUAROCKS_RUN_ENV

Don't get me wrong, I definitely agree that the series brings a number
of useful improvements. I just find it annoying that now all packages
need to pass a BAR_DIR = $(STAGING_DIR)/usr for all their native
dependencies, while it was not needed before. So that's why I'm asking
a few questions to see if we could do better.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
