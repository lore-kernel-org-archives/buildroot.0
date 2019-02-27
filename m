From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 27 Feb 2019 12:19:17 -0500
Subject: [Buildroot] [PATCH next 1/1] package/libwebsockets: bump
 version to 3.1.0
In-Reply-To: <20190225222058.1d0a106b@windsurf.home>
References: <20190223201736.106101-1-aduskett@gmail.com>
 <20190225222058.1d0a106b@windsurf.home>
Message-ID: <CAFSsvmo4vvANQse18AxJ8RyK4KZfLWBBZVAafeNUAM_G5EKc=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
On Mon, Feb 25, 2019 at 4:20 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Adam,
>
> On Sat, 23 Feb 2019 15:17:36 -0500
> aduskett at gmail.com wrote:
>
> > +-if (LWS_WITH_LIBEV AND LWS_WITH_LIBEVENT)
> > +-    message(FATAL_ERROR "Sorry libev and libevent conflict with each others' namespace, you can only have one or the other")
> > +-endif()
>
> I'm a bit confused by this patch. Why are removing this check ? If
> libwebsockets is anyway only using libev *or* libevent, what about
> changing libwebsockets.mk to only allow using one or the other ?
>
We are removing the check for three reasons that I can see:
1) Libwebsockets works just fine with both libev and libevent with
this check removed.
2) Some people may be using libwebsockets with libev and libevent
installed, and this is the least disruptive patch.
3) If I had set a check in the make file that favored either libev or
libevent over the other, who is to say that one should take
    precedence over the other?

Thanks!

Adam
> This is the only point I've seen, the rest looks good to me.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
