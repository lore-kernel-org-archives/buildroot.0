From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 15:26:02 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/tvheadend: Fix static build
In-Reply-To: <20150829130656.GD4857@free.fr>
References: <1440849333-27450-1-git-send-email-bernd.kuhls@t-online.de>
 <20150829130656.GD4857@free.fr>
Message-ID: <20150829152602.76d984e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Bernd,

On Sat, 29 Aug 2015 15:06:56 +0200, Yann E. MORIN wrote:

> > +The only trace of dladdr() can be found currently in src/trap.c in line
> > +192, encapsulated in #if ENABLE_EXECINFO. The buildsystem does not
> > +contain any trace of ENABLE_EXECINFO
> 
> Yes there is:
> 
>     $ git grep -i execinfo
>     configure:check_cc_header execinfo
>     [...]

Yes, I missed that one when looking for places where libdl was actually
used. So libdl is not only used by capmt_ca.c, but also by tvheadend
itself, when execinfo support is available.

Maybe we should stop bike-shedding, and mark tvheadend as not available
for static builds, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
