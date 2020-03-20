From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2020 22:41:52 +0100
Subject: [Buildroot] [pkg-luarocks 3/6] pkg-luarocks: regen packages
 with external dependencies
In-Reply-To: <CAB0FRssGnc0G1XTb=SNEa=gONK42+L5gxife9QJQTS_P=v=SiQ@mail.gmail.com>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
 <20190918061915.31250-3-francois.perrad@gadz.org>
 <20190918093501.5b91d097@windsurf>
 <CAB0FRstytkW+C-PcTKXQubHJZRwryrGwHB5tr7j-4jwTZt6wCA@mail.gmail.com>
 <20190918211642.1517aa3f@windsurf>
 <CAB0FRssGnc0G1XTb=SNEa=gONK42+L5gxife9QJQTS_P=v=SiQ@mail.gmail.com>
Message-ID: <20200320224152.031fea6e@windsurf.home>
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

According to
https://github.com/luarocks/luarocks/wiki/config-file-format, the path
to the configuration file can be overridden using the environment
variable LUAROCKS_CONFIG. This would allow to have one config file to
use when building host LuaRocks packages, and one to use when building
target LuaRocks packages. Thanks to that, we could keep the
external_deps_dirs in the LuaRocks config file used for target
packages, and avoid adding all those BAR_DIR, FOO_DIR variables in a
number of packages.

Could you have a look at whether this is possible ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
