From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 28 Dec 2018 17:09:31 +0100
Subject: [Buildroot] [PATCH 1/3] package/lua-debug: new package
In-Reply-To: <20181228161618.39acb1bd@windsurf>
References: <1545957452-9451-1-git-send-email-james.hilliard1@gmail.com>
 <CAB0FRssfuEbz=KUdcpaaoeJd+a1Yoo-URrjvFf1N8L3Csxdr1Q@mail.gmail.com>
 <20181228161618.39acb1bd@windsurf>
Message-ID: <CAB0FRssRpE8AZwYiTrr=yJGkNSOxjRuhN+z7OLxC3KkFvBjXvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le ven. 28 d?c. 2018 ? 16:16, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fran?ois,
>
> Thanks a lot for your feedback on this series.
>
> On Fri, 28 Dec 2018 15:32:39 +0100, Fran?ois Perrad wrote:
>
> > > +# lua-debug
> >
> > This rock uses the namespace std.
> > So, in order to avoid future name collision, it must be named
> lua-std-debug
>
> Just for my own understanding, could you give a few more details about
> this? We don't have any package today named lua-std-<something>, so I'm
> interested in understanding this "namespace std" thing and the
> namespace pollution issue.
>
>
The risk of collision is with `debug` and `normalize` which are very common
word, not with `std`.

On luarocks, their name are std._debug & std.normalize.
See https://luarocks.org/modules/gvvaughan/std._debug and
https://luarocks.org/modules/gvvaughan/std.normalize

Also, is your automated luarocks package generation logic
> (http://patchwork.ozlabs.org/patch/1015895/) going to name such a
> package lua-std-debug and not lua-debug ?
>

You could run :
    $ luarocks buildroot std._debug lua-std-debug

std._debug allows to find it on luarocks
lua-std-debug is our name on BR

Fran?ois


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181228/f37187e7/attachment.html>
