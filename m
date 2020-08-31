From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Aug 2020 22:13:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix building against
 gobject-introspection
In-Reply-To: <20200814213721.62d58c25@windsurf.home>
References: <20200813232351.1552307-1-aduskett@gmail.com>
 <20200814133934.26a33b17@windsurf.home>
 <CAFSsvmqhCPXYn9A8pXOy5bi2h35KJZ92r-EWms9Ra7yG2HW=xA@mail.gmail.com>
 <20200814213721.62d58c25@windsurf.home>
Message-ID: <20200831201336.GS14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-14 21:37 +0200, Thomas Petazzoni spake thusly:
> On Fri, 14 Aug 2020 12:27:46 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
> 
> > > This really isn't very neat. Isn't there a better solution?
> > >  
> > Maybe? But that's why the GIR_EXTRA_LABS_PATH macro exists, is for
> > situations just like this.
> 
> It seems absolutely awful that within the build of a package this kind
> of variable is needed. If it was to point to libraries installed by
> other packages, why not. But here, the package build system itself is
> not capable of finding its own libraries?

Remember that this is GOI we are speaking of, here! ;-)

More seriously, though, remember that this is also going through the
wrappers, backed by qemu because this is executing foreign code...

And again, GOI. Meh... ;-]

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
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
