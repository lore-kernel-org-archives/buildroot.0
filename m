From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 1 Sep 2019 09:46:45 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-stats: more upstream names
In-Reply-To: <20190828144648.1f4f0925@windsurf.home>
References: <20190828070251.22886-1-francois.perrad@gadz.org>
 <20190828070251.22886-2-francois.perrad@gadz.org>
 <20190828144648.1f4f0925@windsurf.home>
Message-ID: <CAB0FRstgORAB_Fibaiey-PasEi-YeaPAgfJ-FWZAfUtnQApwGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 28 ao?t 2019 ? 14:47, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fran?ois,
>
> +Victor Huesca in Cc.
>
> On Wed, 28 Aug 2019 09:02:51 +0200
> Francois Perrad <fperrad@gmail.com> wrote:
>
> > the python infrastructure populates the variables _NAME_UPSTREAM
> > (like the luarocks one).
> > and pkg-stats uses them.
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> I think this should be split into two parts:
>
>  - one changing pkg-stats to use NAME_UPSTREAM, as it already helps for
>    luarocks-package. However, could you name a few luarocks packages
>    where their NAME_UPSTREAM matches the name of the project on
>    release-monitoring.org ?
>

lua-basexx (basexx) see https://release-monitoring.org/project/15672/
lua-lpeg-patterns (lpeg_patterns) see
https://release-monitoring.org/project/15670/
lua-stdlib (stdlib) see https://release-monitoring.org/project/11735/

There is another issue with LuaRocks packages:
There is already a mismatch between the rock version and the upstream
version found by release-monitoring, for example:
    lua-http 0.3-0 vs 0.3
    lua-iconv 7-1 (https://luarocks.org/modules/luarocks/lua-iconv/7-1) vs
7 (https://release-monitoring.org/project/11668/)
This issue could be solve only by adding a specific LuaRocks backend to
release-monitoring.

Fran?ois


>  - for the Python case, what should "upstream name" match ? The name
>    registered on PyPi ? Sometimes the name registered on PyPi doesn't
>    always exactly match the upstream name.
>
>    In any case, the new NAME_UPSTREAM variable in python-package should
>    be documented in the manual.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190901/80dd9a5f/attachment.html>
