From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 14:57:14 +0100
Subject: [Buildroot] [RFC PATCH 1/1] package/cegui: rename and bump
 version
In-Reply-To: <0d04353d-faf2-35d2-5a58-cb293ef52f86@grinn-global.com>
References: <20200318085125.12843-1-b.bilas@grinn-global.com>
 <20200321165503.7baa0173@windsurf.home>
 <0d04353d-faf2-35d2-5a58-cb293ef52f86@grinn-global.com>
Message-ID: <20200322135714.GD2364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2020-03-22 14:44 +0100, Bartosz Bilas spake thusly:
> On 21.03.2020 16:55, Thomas Petazzoni wrote:
> >On Wed, 18 Mar 2020 09:51:25 +0100
> >Bartosz Bilas <b.bilas@grinn-global.com> wrote:
> >>Since spice ver. 0.12.6 doesn't depend on cegui anymore let's bump to the latest stable version
> >>and rename package.
> >>
> >>Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[--SNIP--]
> >>+ifeq ($(BR2_PACKAGE_OGRE),y)
> >>+CEGUI_DEPENDENCIES += ogre
> >>+endif
> >[... snip ...]
> >
> >So I take it there are no enable/disable options ?
> Those options are automatically set based on found dependencies so I think
> that there is no necessity to override them in mk file (or am I wrong?).

We still want to forcibly enable/disable optional features rather than
leave them to chance. Also, if your target is x86_64 and your build
machine is also x86_64 (for example), then if you machine has one of
thedependencies installed, the CEGUI buildsyste,m may find them, instead
of those from Buildroot.

So, we still want to have the proper enable/disable options.

Regards,
Yann E. MORIN.

> >
> >Thanks!
> >
> >Thomas
> 
> Best
> Bartek
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
