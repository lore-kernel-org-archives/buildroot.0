From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 12 Aug 2019 13:33:39 -0300
Subject: [Buildroot] [PATCH] package/nfs-utils: enable IPv6 if libtirpc
 is selected
In-Reply-To: <20190812181450.70b8c901@gmx.net>
References: <20190812030954.4880-1-unixmania@gmail.com>
 <20190812181450.70b8c901@gmx.net>
Message-ID: <CAJ4jsaf4i+Lev0axg0hJQ9xtQB=fvo=TYgfUgc1y8Chedp3eiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 12, 2019 at 1:14 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello Carlos,
>
> On Mon, 12 Aug 2019 00:09:54 -0300, unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > IPv6 support depends on libtirpc, so no not disable it if libtirpc is
>
> s/no not/do not/

Ops! I will fix it.

> > selected. In practice this always enables IPv6, since nfs-utils needs
> > rpcbind, which in its turn always selects libtirpc.
>
> Why not simple select it directly?

I was following Arnout's suggested in

  https://bugs.busybox.net/show_bug.cgi?id=10806#c1

But I agree that selecting directly is a simpler and better approach.

-- 
Carlos Santos <unixmania@gmail.com>
