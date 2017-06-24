From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 17:29:32 +0200
Subject: [Buildroot] [PATCH v2 13/13] package/minetest_game: new package
In-Reply-To: <20170612205410.20230-13-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-13-romain.naour@gmail.com>
Message-ID: <20170624172932.04b4b03d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 22:54:10 +0200, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: update to 0.4.16
>     update license file
>     Add a hash file
>     backport an upstream patch due to regression.

I'm not a big fan of underscores in the name of packages, but I agree
it's the upstream name... and we already have a few packages with
underscores in their name, so I guess it's more a personal taste than a
real rule here.

> +define MINETEST_GAME_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/share/minetest/games/minetest_game
> +	rsync -av $(@D)/* --exclude=".*" $(TARGET_DIR)/usr/share/minetest/games/minetest_game

What about using "cp -dpfr", which we use more commonly in packages to
copy entire file/directory hierarchies?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
