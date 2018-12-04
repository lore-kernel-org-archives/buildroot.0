From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 4 Dec 2018 05:26:04 +0100
Subject: [Buildroot] [PATCH v3 1/1] lua: remove 5.2.x version
In-Reply-To: <20181203222808.6dbfdecd@windsurf.home>
References: <20181202102506.24699-1-francois.perrad@gadz.org>
 <20181203222808.6dbfdecd@windsurf.home>
Message-ID: <CAB0FRstyzGdq2Yx5+FqryPGKzXD8GKuyFbdFqzoC3FMObuuNFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 3 d?c. 2018 ? 22:28, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fran?ois,
>
> On Sun,  2 Dec 2018 11:25:06 +0100, Francois Perrad wrote:
> > At this time :
> > - Lua 5.3.5 will be the last one of its serie.
> > - Lua 5.4 is up coming (lua-5.4.0-work2 is already available).
> > - Lua 5.2.4 was released on 2015.
> > For various reasons in the Lua ecosystem, the Lua 5.1 will stay.
> > On BR, Lua 5.3 is the default version since 2016.02.
> >
> > So, the serie which could be removed is the 5.2.x.
> > We could wait some days for other user feedback.
> >
> > Note: see discussion when 5.3.x was introduced :
> http://lists.busybox.net/pipermail/buildroot/2015-January/117638.html
>
> One quick question: Prosody 0.11 has been released, and they say:
>
> """
> Prosody has traditionally used Lua 5.1. As we announced back when 0.10
> was released, we are on the path to updating to more recent Lua
> versions.
>
> The recommended Lua version for 0.11 is Lua 5.2, while Lua 5.1 is still
> supported for the platforms that need it.
> """
>
> Should we keep Lua 5.2 for Prosody ?
>
>
I am aware on this announcement.

Now, see the note in the commit log of
https://patchwork.ozlabs.org/patch/1002646/ from my serie "support/testing:
Lua and friends"
So currently, the BR users of Prosody only use LuaJIT, (Lua 5.1 & 5.2 don't
work on BR, Lua 5.3 is not supported by Prosody).

LuaJIT is ABI compatible with Lua 5.1, and has some extensions from Lua 5.2
& 5.3.
I think that the Prosody team knows that their user base is mostly on
LuaJIT.
I also think that the official support of Lua 5.2 is a first step for the
Prosody team, they will target Lua 5.3.

In conclusion, I still want to remove Lua 5.2

Fran?ois

> v2 --> v3
> >   - rebase on top of BR 2018.11
>
> The changelog should go...
>
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
>
> ... here. Otherwise, it becomes part of the commit log when applying,
> which we don't want.
>
> Thanks!
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181204/3ae4b100/attachment.html>
