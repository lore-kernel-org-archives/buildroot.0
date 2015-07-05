From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2015 16:27:27 +0200
Subject: [Buildroot] Hash checking infrastructure
In-Reply-To: <20150705083253.1bfaefa5@core2quad.morethan.org>
References: <20150704140142.3aa5c982@core2quad.morethan.org>
 <20150704214734.GC3634@free.fr>
 <20150704213628.21ff7e6e@core2quad.morethan.org>
 <20150705000050.7c2be969@core2quad.morethan.org>
 <20150705111007.63ff239b@free-electrons.com>
 <20150705083253.1bfaefa5@core2quad.morethan.org>
Message-ID: <20150705142725.GN3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

On 2015-07-05 08:32 -0500, Mike spake thusly:
> On Sun, 5 Jul 2015 11:10:07 +0200
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
[--SNIP--]
> > I.e, it works perfectly fine.
> > 
> > So there is something else you are doing, or that is special in your
> > setup.
[--SNIP--]
> The problem area:
> 
> >>> host-luajit custom Downloading
> --2015-07-05 08:15:09--  http://luajit.org/download/LuaJIT-custom.tar.gz
> Resolving luajit.org... 94.23.39.66
> Connecting to luajit.org|94.23.39.66|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2015-07-05 08:15:10 ERROR 404: Not Found.
> 
> --2015-07-05 08:15:10--  http://sources.buildroot.net/LuaJIT-custom.tar.gz
> Resolving sources.buildroot.net... 176.9.16.109
> Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2015-07-05 08:15:10 ERROR 404: Not Found.
> 
> make: *** [/var1/arm/new-i386/build/host-luajit-custom/.stamp_downloaded] Error 1
> make: Leaving directory `/var1/arm/buildroot.git'

Ah, but that is *not* a problem with the hash infra at all!

And infact, I already reproduced *that* error and already sent a patch:
    https://patchwork.ozlabs.org/patch/491307/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
